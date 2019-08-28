Shader "Custom/SelectPanel"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
		_Radius ("Radius", Range(0, 0.4)) = 0.1
		_Space ("Space", Range(0, 0.1)) = 0.05
		_FadeDistance ("Fade Distance", Range(0, 1)) = 1
		_LightColor("Light Color", Color) = (1, 0, 0, 1)
		[Toggle] _Neighbor0("_Neighbor0", Float) = 0
		[Toggle] _Neighbor1("_Neighbor1", Float) = 0
		[Toggle] _Neighbor2("_Neighbor2", Float) = 0
		[Toggle] _Neighbor3("_Neighbor3", Float) = 0
		[Toggle] _Neighbor4("_Neighbor4", Float) = 0
		[Toggle] _Neighbor5("_Neighbor5", Float) = 0
		[Toggle] _Neighbor6("_Neighbor6", Float) = 0
		[Toggle] _Neighbor7("_Neighbor7", Float) = 0
		[Toggle] _IsShow("IsShow", Float) = 0
	}
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        LOD 100
		Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
			float _Radius;
			float _Space;
			float _FadeDistance;
			float4 _LightColor;
			float _Neighbor0;
			float _Neighbor1;
			float _Neighbor2;
			float _Neighbor3;
			float _Neighbor4;
			float _Neighbor5;
			float _Neighbor6;
			float _Neighbor7;
			float _IsShow;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

			// 绘制凸圆角
			fixed4 drawConvex(fixed4 col, float2 uv, float2 center)
			{
				float fadeDis = _FadeDistance * _Radius;
				if (fadeDis > 0)
				{
					float dis = distance(uv, center);
					if (dis <= _Radius)
					{
						dis -= (_Radius - fadeDis);
						if (dis < 0)
						{
							dis = 0;
						}

						float percent = dis / fadeDis;
						col.xyz = col.xyz * (1 - percent) + _LightColor.xyz * percent;
					}
				}
				return col;
			}

			// 绘制凹圆角
			fixed4 drawConcave(fixed4 col, float2 uv)
			{
				float fadeDis = _FadeDistance * _Radius;
				if (fadeDis > 0)
				{
					float dis = distance(uv, float2(0.5, 0.5));
					if (dis >= _Space && dis < _Space + fadeDis)
					{
						dis -= _Space;

						float percent = dis / fadeDis;
						col.xyz = col.xyz * percent + _LightColor.xyz * (1 - percent);
					}
				}
				return col;
			}

			// 绘制横线
			fixed4 drawHorizontal(fixed4 col, float2 uv)
			{
				float fadeDis = _FadeDistance * _Radius;
				if (fadeDis > 0)
				{
					if ((0.5 - uv.y) >= _Space && (0.5 - uv.y) <= (_Space + fadeDis))
					{
						float dis = 0.5 - uv.y - _Space;
						float percent = dis / fadeDis;
						col.xyz = col.xyz * percent + _LightColor.xyz * (1 - percent);
					}
				}
				return col;
			}

			// 绘制竖线
			fixed4 drawVertical(fixed4 col, float2 uv)
			{
				float fadeDis = _FadeDistance * _Radius;
				if (fadeDis > 0)
				{
					if ((0.5 - uv.x) >= _Space && (0.5 - uv.x) <= (_Space + fadeDis))
					{
						float dis = 0.5 - uv.x - _Space;
						float percent = dis / fadeDis;
						col.xyz = col.xyz * percent + _LightColor.xyz * (1 - percent);
					}
				}
				return col;
			}

			fixed4 drawCorner(float idx0, float idx1, float idx2, fixed4 col, float2 uv, float2 center)
			{
				if (!idx0 && idx2)
				{
					return drawHorizontal(col, uv);
				}
				else if (idx0 && !idx2)
				{
					return drawVertical(col, uv);
				}
				else if (idx0 && idx1 && idx2)
				{
					return col;
				}
				else if (idx0 && !idx1 && idx2)
				{
					return drawConcave(col, uv);
				}
				else
				{
					return drawConvex(col, uv, center);
				}
				return col;
			}

            fixed4 frag (v2f i) : SV_Target
            {
				fixed4 col = tex2D(_MainTex, i.uv);

				if (!_IsShow)
				{
					return col;
				}
				float _ShowDis = 0.5 - _Space;
				float2 center = float2(abs(_ShowDis - _Radius), abs(_ShowDis - _Radius));
				float2 uv = float2(abs(i.uv.x - 0.5), abs(i.uv.y - 0.5));
				// 画四个角
				if (uv.x > center.x && uv.y > center.y)
				{
					if (i.uv.x > 0.5)
					{
						if (i.uv.y > 0.5)
						{
							return drawCorner(_Neighbor1, _Neighbor2, _Neighbor4, col, uv, center);
						}
						else
						{
							return drawCorner(_Neighbor6, _Neighbor7, _Neighbor4, col, uv, center);
						}
					}
					else
					{
						if (i.uv.y > 0.5)
						{
							return drawCorner(_Neighbor1, _Neighbor0, _Neighbor3, col, uv, center);
						}
						else
						{
							return drawCorner(_Neighbor6, _Neighbor5, _Neighbor3, col, uv, center);
						}
					}
				}
				else	// 画四条边
				{
					if (uv.x > uv.y)
					{
						if ((i.uv.x > 0.5 && !_Neighbor4) || (i.uv.x < 0.5 && !_Neighbor3))
						{
							return drawVertical(col, uv);
						}
						else
						{
							return col;
						}
					}
					else
					{
						if ((i.uv.y > 0.5 && !_Neighbor1) || (i.uv.y < 0.5 && !_Neighbor6))
						{
							return drawHorizontal(col, uv);
						}
						else
						{
							return col;
						}
					}
				}
            }
            ENDCG
        }
    }
}

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

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

			void drawCorner(float idx0, float idx1, float idx2)
			{
				if (!idx0 && idx2)
				{
					// 横
				}
				else if (idx0 && !idx2)
				{
					// 竖
				}
				else if (idx0 && idx1 && idx2)
				{
					// 不画
					return;
				}
				else if (idx0 && !idx1 && idx2)
				{
					// 凹
				}
				else
				{
					// 凸
				}
			}

            fixed4 frag (v2f i) : SV_Target
            {
				fixed4 col = tex2D(_MainTex, i.uv);
				if (i.uv.x < _Space || i.uv.x >(1 - _Space) || i.uv.y < _Space || i.uv.y >(1 - _Space))
				{
					return col;
				}
				else
				{
					float _ShowDis = 0.5 - _Space;
					float2 center = float2(abs(_ShowDis - _Radius), abs(_ShowDis - _Radius));
					float2 uv = float2(abs(i.uv.x - 0.5), abs(i.uv.y - 0.5));
					if (uv.x > center.x && uv.y > center.y)
					{
						float dis = distance(uv, center);
						if (dis > _Radius)
						{
							return col;
						}
						else
						{
							float fadeDis = _FadeDistance * _Radius;
							if (fadeDis > 0)
							{
								dis -= (_Radius - fadeDis);
								if (dis < 0)
								{
									dis = 0;
								}

								float percent = dis / fadeDis;
								col.xyz = col.xyz * (1 - percent) + _LightColor.xyz * percent;
							}
							return col;
						}
					}
					else
					{
						float dis = max(uv.x, uv.y) - (_ShowDis - _Radius);
						float fadeDis = _FadeDistance * _Radius;
						if (fadeDis > 0)
						{
							dis -= (_Radius - fadeDis);
							if (dis < 0)
							{
								dis = 0;
							}
							float percent = dis / fadeDis;
							col.xyz = col.xyz * (1 - percent) + _LightColor.xyz * percent;
						}
						return col;

					}
				}
            }
            ENDCG
        }
    }
}

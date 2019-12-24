Shader "Custom/CircleFill"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
		[PerRendererData] _NeedAmbient("Need Ambient", Float) = 1.0
		[PerRendererData] _Percent("Percent", Range(0, 1)) = 0.125
		[PerRendererData] _Slope("Slope", Float) = 1
	}
    SubShader
    {
        Tags {             
			"Queue" = "Transparent+1"
			"RenderType" = "Transparent"
		}
		ZWrite off

        Pass
        {
			Blend SrcAlpha OneMinusSrcAlpha

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
				float4 color : COLOR;
			};

            sampler2D _MainTex;
            float4 _MainTex_ST;
			float _Slope;
			float _Percent;
			float _NeedAmbient;

			bool isFloatEqual(float f1, float f2)
			{
				return abs(f1 - f2) < 0.000001;
			}

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.color = UNITY_LIGHTMODEL_AMBIENT;
				return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
				fixed4 col;
				if (isFloatEqual(0, _Percent))
				{
					return fixed4(0, 0, 0, 0);
				}
				else if (isFloatEqual(0.5, _Percent))
				{
					float2 pos = i.uv - float2(0.5, 0.5);
					if (pos.x > 0)
					{
						col = tex2D(_MainTex, i.uv);
					}
					else
					{
						col = fixed4(0, 0, 0, 0);
					}
				}
				else if (_Percent < 0.5)
				{
					float2 pos = i.uv - float2(0.5, 0.5);
					if (pos.x > 0)
					{
						float slope = pos.y / pos.x;
						if (slope > _Slope)
						{
							col = tex2D(_MainTex, i.uv);
						}
						else
						{
							col = fixed4(0, 0, 0, 0);
						}
					}
					else
					{
						col = fixed4(0, 0, 0, 0);
					}
				}
				else
				{
					float2 pos = i.uv - float2(0.5, 0.5);
					if (pos.x < 0)
					{
						float slope = pos.y / pos.x;
						if (slope > _Slope)
						{
							col = tex2D(_MainTex, i.uv);
						}
						else
						{
							col = fixed4(0, 0, 0, 0);
						}
					}
					else
					{
						col = tex2D(_MainTex, i.uv);
					}
				}
				if (_NeedAmbient)
				{
					return col * i.color;
				}
				else
				{
					return col;
				}
            }
            ENDCG
        }
    }
}

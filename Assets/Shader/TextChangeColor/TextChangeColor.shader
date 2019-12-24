Shader "Custom/UI/TextChangeColor"
{
	Properties
	{
		[PerRendererData] _MainTex("Font Texture", 2D) = "white" {}
		_BeginColor("Begin Color", Color) = (0,0,0,1)									//起始颜色
		_EndColor("End Color", Color) = (0,0,0,1)									//结束颜色
		[PerRendererData] _Rect("Rect", Vector) = (0, 0, 0, 0)
		[PerRendererData] _Duration("Duration", Float) = 314
	}

		SubShader
		{
			Tags{ "RenderType" = "Transparent" "Queue" = "Transparent" }

			Blend SrcAlpha OneMinusSrcAlpha

			Pass
			{
				CGPROGRAM

				#pragma vertex vert
				#pragma fragment frag
				#include "UnityCG.cginc"

				sampler2D _MainTex;
				fixed4 _BeginColor;
				fixed4 _EndColor;
				float4 _MainTex_ST;
				float4 _Rect;
				float _Duration;

				struct a2v {
					float4 vertex	: POSITION;
					float2 texcoord	: TEXCOORD0;
				};

				struct v2f {
					float4 pos	: SV_POSITION;
					float2 tex	: TEXCOORD1;
				};

				v2f vert(a2v v)
				{
					v2f f;
					f.pos = UnityObjectToClipPos(v.vertex);
					f.tex = TRANSFORM_TEX(v.texcoord, _MainTex);
					return f;
				}

				fixed4 frag(v2f f) : SV_Target
				{
					fixed4 color = tex2D(_MainTex, f.tex);
					if (color.a > 0)
					{
						float curTime = _Time.y;
						float startTime = floor(curTime / _Duration) * _Duration;
						float offsetTime = curTime - startTime;

						fixed4 col = lerp(_BeginColor, _EndColor, (sin((f.pos.x - _Rect.x) / _Rect.z * 3.14 + offsetTime * 5) + 1) / 2);

						return fixed4(col.xyz, color.a);
					}
					else
					{
						return fixed4(0, 0, 0, 0);
					}
				}

				ENDCG
			}
		}
}
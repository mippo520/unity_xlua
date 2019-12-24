
Shader "Custom/UI/TextMap"
{
    Properties
    {
		[PerRendererData] _MainTex("Font Texture", 2D) = "white" {}
		_EffectTex("Effect Texture", 2D) = "white" {}
		[PerRendererData] _Rect("Rect", Vector) = (0, 0, 0, 0)
		//支持Mask 裁剪的部分
		_StencilComp("Stencil Comparison", Float) = 8
		_Stencil("Stencil ID", Float) = 0
		_StencilOp("Stencil Operation", Float) = 0
		_StencilWriteMask("Stencil Write Mask", Float) = 255
		_StencilReadMask("Stencil Read Mask", Float) = 255
		_ColorMask("Color Mask", Float) = 15
	}
    SubShader
    {
		Tags{ "RenderType" = "Transparent" "Queue" = "Transparent" }

		Blend SrcAlpha OneMinusSrcAlpha
		LOD 100
		//支持Mask 裁剪的部分
		//Start
		Stencil
		{
			Ref[_Stencil]
			Comp[_StencilComp]
			Pass[_StencilOp]
			ReadMask[_StencilReadMask]
			WriteMask[_StencilWriteMask]
		}
		ColorMask[_ColorMask]
		//End

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				fixed4 color : COLOR;
			};

            struct v2f
            {
				float2 uv : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float4 vertex : SV_POSITION;
				fixed4 color : COLOR;
            };

			sampler2D _MainTex;
			float4 _MainTex_ST;

			sampler2D _EffectTex;
			float4 _EffectTex_ST;
			float4 _Rect;

            v2f vert (appdata v)
            {
                v2f o;
				float bottomY = _Rect.y - _Rect.w;
				float vOffset = (v.vertex.y - bottomY) / _Rect.w;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.uv1 = TRANSFORM_TEX(float2(0.1, vOffset), _EffectTex);
				o.color = v.color;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {

				fixed4 col = tex2D(_MainTex, i.uv);
				fixed4 col1 = tex2D(_EffectTex, i.uv1);

				return fixed4(col1.rgb, col.a * i.color.a);

            }
            ENDCG
        }
    }
}

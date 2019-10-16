Shader "Custom/GoaheadNotice/Fade"
{
    Properties
    {
		[PerRendererData] _MainTex("Font Texture", 2D) = "white" {}
		[PerRendererData] _MaskRect("Mask Rect", Vector) = (0, 0, 0, 0)
		_Color ("Color", Color) = (0, 0, 0, 1)
		_FadeRange ("Fade Range", Range(0, 1)) = 0.5
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
			float4 _MaskRect;
			float4 _Color;
			float _FadeRange;

            v2f vert (appdata v)
            {
				v2f f;
				f.vertex = UnityObjectToClipPos(v.vertex);
				f.uv = TRANSFORM_TEX(v.uv, _MainTex);
				return f;
			}

            fixed4 frag (v2f i) : SV_Target
            {
				fixed a = tex2D(_MainTex, i.uv).a;
				if (a > 0)
				{
					float fadeArea = _MaskRect.z / 3 * _FadeRange;
					float left = _MaskRect.x;
					float leftEnd = left + fadeArea;
					float right = left + _MaskRect.z;
					float rightEnd = right - fadeArea;
					if (i.vertex.x >= left && i.vertex.x < leftEnd)
					{
						a = min((i.vertex.x - left) / fadeArea, a);
					}
					else if (i.vertex.x > rightEnd && i.vertex.x <= right)
					{
						a = min((right - i.vertex.x) / fadeArea, a);
					}

				}
				fixed4 col = fixed4(_Color.rgb, a);
                return col;
            }
            ENDCG
        }
    }
}

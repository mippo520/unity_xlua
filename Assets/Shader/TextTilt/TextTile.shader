
Shader "Custom/UI/TextTile"
{
    Properties
    {
		[PerRendererData] _MainTex("Font Texture", 2D) = "white" {}
		_LeftRangeBegin("Left Range Begin", Range(-0.5, 0.5)) = 0
		_RightRangeBegin("Right Range Begin", Range(-0.5, 0.5)) = 0
		_LeftRangeEnd("Left Range End", Range(-0.5, 0.5)) = 0
		_RightRangeEnd("Right Range End", Range(-0.5, 0.5)) = 0
		_Color("Color", Color) = (1,1,1,1)
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
				fixed4 color : COLOR;
			};

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
				fixed4 color : COLOR;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
			float _LeftRangeBegin;
			float _LeftRangeEnd;
			float _RightRangeBegin;
			float _RightRangeEnd;
			float4 _Color;
			float4 _Rect;

            v2f vert (appdata v)
            {
                v2f o;

				float h = _Rect.w;
				float bottomY = _Rect.y - _Rect.w;
				float h0 = v.vertex.y - bottomY;
				float w = v.vertex.x - _Rect.x;

				float topY1 = _Rect.y - (w * (_RightRangeBegin - _LeftRangeBegin) / _Rect.z + _LeftRangeBegin) * h;
				float bottomY1 = _Rect.y - _Rect.w + (w * (_RightRangeEnd - _LeftRangeEnd) / _Rect.z + _LeftRangeEnd) * h;

				float h1 = topY1 - bottomY1;


				float hx = h1 * h0 / h;
				v.vertex.y = hx + bottomY1;

				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.color = v.color;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {

                fixed4 col = tex2D(_MainTex, i.uv);

                return fixed4(i.color.rgb, col.a * i.color.a);
            }
            ENDCG
        }
    }
}

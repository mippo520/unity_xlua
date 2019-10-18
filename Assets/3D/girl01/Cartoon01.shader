// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34758,y:32806,varname:node_9361,prsc:2|custl-1600-OUT,olwid-2291-OUT,olcol-8832-RGB;n:type:ShaderForge.SFN_Tex2d,id:1317,x:31983,y:32846,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_1317,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7901,x:32213,y:32901,varname:node_7901,prsc:2|A-1317-RGB,B-7272-OUT;n:type:ShaderForge.SFN_NormalVector,id:7272,x:31983,y:33015,prsc:2,pt:True;n:type:ShaderForge.SFN_Dot,id:5986,x:32552,y:32898,varname:node_5986,prsc:2,dt:1|A-7901-OUT,B-5004-OUT;n:type:ShaderForge.SFN_Dot,id:3483,x:32366,y:33278,varname:node_3483,prsc:2,dt:1|A-5004-OUT,B-4348-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:4348,x:31983,y:33330,varname:node_4348,prsc:2;n:type:ShaderForge.SFN_LightVector,id:5004,x:31983,y:33175,varname:node_5004,prsc:2;n:type:ShaderForge.SFN_Power,id:9886,x:32639,y:33317,varname:node_9886,prsc:2|VAL-3483-OUT,EXP-752-OUT;n:type:ShaderForge.SFN_Slider,id:752,x:32263,y:33519,ptovrint:False,ptlb:3S Width,ptin:_3SWidth,varname:node_752,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:0.1,max:10;n:type:ShaderForge.SFN_Multiply,id:3965,x:32859,y:33397,varname:node_3965,prsc:2|A-9886-OUT,B-4419-OUT;n:type:ShaderForge.SFN_Slider,id:4419,x:32406,y:33624,ptovrint:False,ptlb:3S Ligth,ptin:_3SLigth,varname:node_4419,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_SwitchProperty,id:6974,x:32911,y:33214,ptovrint:False,ptlb:3S,ptin:_3S,varname:node_6974,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-8090-OUT,B-3965-OUT;n:type:ShaderForge.SFN_Vector1,id:8090,x:32589,y:33194,varname:node_8090,prsc:2,v1:0;n:type:ShaderForge.SFN_Add,id:8044,x:32823,y:32968,varname:node_8044,prsc:2|A-5986-OUT,B-6974-OUT;n:type:ShaderForge.SFN_Append,id:9365,x:33078,y:32968,varname:node_9365,prsc:2|A-8044-OUT,B-8044-OUT;n:type:ShaderForge.SFN_Tex2d,id:8874,x:33267,y:32968,ptovrint:False,ptlb:Ramp,ptin:_Ramp,varname:node_8874,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-9365-OUT;n:type:ShaderForge.SFN_Power,id:4361,x:33497,y:33077,varname:node_4361,prsc:2|VAL-8874-RGB,EXP-8230-OUT;n:type:ShaderForge.SFN_Slider,id:8230,x:33127,y:33195,ptovrint:False,ptlb:Power,ptin:_Power,varname:node_8230,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:5;n:type:ShaderForge.SFN_Multiply,id:3703,x:33880,y:33049,varname:node_3703,prsc:2|A-8472-RGB,B-4361-OUT,C-9438-OUT;n:type:ShaderForge.SFN_Tex2d,id:8472,x:33599,y:32920,ptovrint:False,ptlb:TexTure,ptin:_TexTure,varname:node_8472,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:9438,x:33680,y:33308,ptovrint:False,ptlb:Light Color,ptin:_LightColor,varname:node_9438,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-70-OUT,B-8764-RGB;n:type:ShaderForge.SFN_Vector1,id:70,x:33437,y:33308,varname:node_70,prsc:2,v1:1;n:type:ShaderForge.SFN_LightColor,id:8764,x:33416,y:33397,varname:node_8764,prsc:2;n:type:ShaderForge.SFN_Add,id:1600,x:34403,y:32958,varname:node_1600,prsc:2|A-354-OUT,B-3053-OUT;n:type:ShaderForge.SFN_Fresnel,id:232,x:33654,y:32665,varname:node_232,prsc:2|EXP-9084-OUT;n:type:ShaderForge.SFN_Slider,id:9084,x:33279,y:32703,ptovrint:False,ptlb:Fresnel Intensity,ptin:_FresnelIntensity,varname:node_9084,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:10;n:type:ShaderForge.SFN_Step,id:8577,x:33872,y:32630,varname:node_8577,prsc:2|A-4288-OUT,B-232-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4288,x:33634,y:32601,ptovrint:False,ptlb:Fresnel N,ptin:_FresnelN,varname:node_4288,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_Multiply,id:31,x:34115,y:32660,varname:node_31,prsc:2|A-7049-RGB,B-8577-OUT,C-2942-OUT;n:type:ShaderForge.SFN_Vector1,id:2942,x:33923,y:32784,varname:node_2942,prsc:2,v1:2;n:type:ShaderForge.SFN_Color,id:7049,x:33872,y:32454,ptovrint:False,ptlb:Fresnel Color,ptin:_FresnelColor,varname:node_7049,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_SwitchProperty,id:354,x:34354,y:32699,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:node_354,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1273-OUT,B-31-OUT;n:type:ShaderForge.SFN_Vector1,id:1273,x:34262,y:32549,varname:node_1273,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:2291,x:34301,y:33164,ptovrint:False,ptlb:Outline Width,ptin:_OutlineWidth,varname:node_2291,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.01,max:0.05;n:type:ShaderForge.SFN_Color,id:8832,x:34404,y:33307,ptovrint:False,ptlb:Outline Color,ptin:_OutlineColor,varname:node_8832,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:3053,x:34125,y:32970,varname:node_3053,prsc:2|A-756-OUT,B-3703-OUT;n:type:ShaderForge.SFN_Slider,id:756,x:33794,y:32895,ptovrint:False,ptlb:TexTure Glow,ptin:_TexTureGlow,varname:node_756,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;proporder:8472-756-8874-8230-1317-6974-752-4419-354-9084-4288-7049-2291-8832-9438;pass:END;sub:END;*/

Shader "Materials/Cartoon01" {
    Properties {
        _TexTure ("TexTure", 2D) = "white" {}

    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }

		LOD 100
		Pass {

            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            uniform sampler2D _TexTure; 
			uniform float4 _TexTure_ST;

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
			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _TexTure);
				return o;
			}
			fixed4 frag(v2f i) : SV_Target
			{
				fixed4 col = tex2D(_TexTure, i.uv);
				return col;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}

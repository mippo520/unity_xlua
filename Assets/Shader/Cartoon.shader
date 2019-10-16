// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

//one directional light
Shader "Custom/Cartoon" {
Properties {
		_Color("Main Color",color)=(1,1,1,1)
		_OutlineColor("Outline Color",color)=(0.1,0.1,0.2,1)
		_MainTex ("BaseTex", 2D) = "white" {}
		_ToonMap("Ramp Map",2D)="white"{}
		_Outline("Thick of Outline",range(0,0.1))=0.02
		_Factor("Factor",range(0,1))=0.5
		_ToonEffect("Toon Effect",range(0,1))=0.5
        _SpecularArea("Specular Area", range(0, 1)) = 0.5
        _SpecularLight("Specular Light", range(0, 1)) = 0.5
        _BaseDistance("Base Distance", range(1, 100)) = 10
        _Test("Test", range(1, 10)) = 1
	}
	SubShader {
		pass{
            Tags{"LightMode"="Always"}
            Cull Front
            ZWrite On
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            float _Outline;
            float _Factor;
            float4 _OutlineColor;
            
            struct v2f {
                float4 pos:SV_POSITION;
            };
    
            v2f vert (appdata_full v) {
                v2f o;
                float3 dir=normalize(v.vertex.xyz);
                float3 dir2=v.normal;
                float D=dot(dir,dir2);
                dir=dir*sign(D);
                dir=dir*_Factor+dir2*(1-_Factor);
                v.vertex.xyz+=dir*_Outline;
                o.pos=UnityObjectToClipPos(v.vertex);
                return o;
            }
            float4 frag(v2f i):COLOR
            {
                float4 c=_OutlineColor;
                return c;
            }
            ENDCG
		}   //  outline
		
		pass{
            Tags{"LightMode"="ForwardBase"}
            Cull Back
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdbase

            #include "UnityCG.cginc"
    
            sampler2D _ToonMap;
            sampler2D _MainTex;
            float4 _MainTex_ST;
            float4 _LightColor0;
            float4 _Color;
            float _ToonEffect;
            float _SpecularArea;
            float _SpecularLight;
    
            struct v2f {
                float4 pos:SV_POSITION;
                float3 lightDir:TEXCOORD0;
                float3 normal:TEXCOORD1;
                float2 texcoord:TEXCOORD2;
            };
    
            v2f vert (appdata_full v) {
                v2f o;
                o.pos=UnityObjectToClipPos(v.vertex);
                o.normal=v.normal;
                o.lightDir=ObjSpaceLightDir(v.vertex);
                o.texcoord=TRANSFORM_TEX(v.texcoord, _MainTex);
                return o;
            }
            
            float4 frag(v2f i):COLOR
            {
                float4 c=1;
                float3 N=normalize(i.normal);
                float3 lightDir=normalize(i.lightDir);
                float diff=max(0,dot(N,lightDir));
                diff=(diff+1)/2;
                diff=smoothstep(0,1,diff);
                float sl = 0.999 + (1 - _SpecularArea) * 0.001;
                if (diff <= sl)
                {
                    float toon=tex2D(_ToonMap,float2(diff,0.5)).r;
                    diff = lerp(diff,toon,_ToonEffect);
                    c = _Color;
                    c *= _LightColor0;
                    c *= diff;
                }
                else
                {
                    c = lerp(c, _Color, (1 - _ToonEffect) * (1 - _SpecularLight));
                }
                // c=_Color*_LightColor0*(diff);
                c *= tex2D(_MainTex, i.texcoord);
                return c;
            }
            ENDCG
		}   // ForwardBase

        Pass {
 
            Tags { "LightMode"="ForwardAdd" }
            
            Blend One One
        
            CGPROGRAM
            
            #pragma multi_compile_fwdadd
            
            #pragma vertex vert
            #pragma fragment frag
            
            #include "Lighting.cginc"
            #include "AutoLight.cginc"
            
            sampler2D _ToonMap;
            sampler2D _MainTex;
            fixed4 _Color;
            float4 _MainTex_ST;
            float _ToonEffect;
            float _SpecularArea;
            float _SpecularLight;
            float _BaseDistance;
            float _Test;

            struct a2v {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            
            struct v2f {
                float4 pos : SV_POSITION;
                float3 worldNormal : TEXCOORD0;
                float3 worldPos : TEXCOORD1;
            };
            
            v2f vert(a2v v) {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                
                return o;
            }
            
            fixed4 frag(v2f i) : SV_Target {
                fixed3 worldNormal = normalize(i.worldNormal);
                #ifdef USING_DIRECTIONAL_LIGHT
                    fixed3 worldLightDir = normalize(_WorldSpaceLightPos0.xyz);
                #else
                    fixed3 worldLightDir = normalize(_WorldSpaceLightPos0.xyz - i.worldPos.xyz);
                #endif
                
                float dotRes = dot(worldNormal, worldLightDir);
                float absDotres = abs(dotRes);
                float diffuse = max(0, dotRes);
                diffuse = (diffuse + 3) / 2;
                diffuse = smoothstep(0,1, diffuse);
                float toon = tex2D(_ToonMap, float2(diffuse,0.5)).r;
                diffuse = lerp(diffuse, toon, _ToonEffect);

                #ifdef USING_DIRECTIONAL_LIGHT
                    fixed atten = 1.0;
                #else
                    #if defined (POINT)
                        float3 lightCoord = mul(unity_WorldToLight, float4(i.worldPos, 1)).xyz;
                        fixed atten = tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).UNITY_ATTEN_CHANNEL;
                    #elif defined (SPOT)
                        float4 lightCoord = mul(unity_WorldToLight, float4(i.worldPos, 1));
                        fixed atten = (lightCoord.z > 0) * tex2D(_LightTexture0, lightCoord.xy / lightCoord.w + 0.5).w * tex2D(_LightTextureB0, dot(lightCoord, lightCoord).rr).UNITY_ATTEN_CHANNEL;
                    #else
                        fixed atten = 1.0;
                    #endif
                #endif

                float3 diff = _LightColor0.rgb * _Color.rgb * diffuse;
                if (atten < 0.001)
                {
                    atten = 0;
                }
                else
                {
                    atten = 0.5;
                }

                return fixed4(diff * atten, 1.0);
            }
            
            ENDCG
        }   // addtional pass

        pass 
        {
            Tags{ "LightMode" = "ShadowCaster" }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_shadowcaster
            #include "UnityCG.cginc"
            struct v2f
            {
                float4 pos:SV_POSITION;

            };

            v2f vert(appdata_full v) 
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
                return o;
            }

            float4 frag(v2f o) :SV_Target
            {
                SHADOW_CASTER_FRAGMENT(o)
            }

            ENDCG
        }   // shadow
	} 
}

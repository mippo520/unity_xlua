#if USE_UNI_LUA
using LuaAPI = UniLua.Lua;
using RealStatePtr = UniLua.ILuaState;
using LuaCSFunction = UniLua.CSharpFunctionDelegate;
#else
using LuaAPI = XLua.LuaDLL.Lua;
using RealStatePtr = System.IntPtr;
using LuaCSFunction = XLua.LuaDLL.lua_CSFunction;
#endif

using XLua;
using System.Collections.Generic;


namespace XLua.CSObjectWrap
{
    using Utils = XLua.Utils;
    public class AssetsCommonNetIPackageCreatorWrap 
    {
        public static void __Register(RealStatePtr L)
        {
			ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			System.Type type = typeof(Assets.Common.Net.IPackageCreator);
			Utils.BeginObjectRegister(type, L, translator, 0, 2, 4, 4);
			
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "Receive", _m_Receive);
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "Send", _m_Send);
			
			
			Utils.RegisterFunc(L, Utils.GETTER_IDX, "endianType", _g_get_endianType);
            Utils.RegisterFunc(L, Utils.GETTER_IDX, "packageLenSize", _g_get_packageLenSize);
            Utils.RegisterFunc(L, Utils.GETTER_IDX, "socket", _g_get_socket);
            Utils.RegisterFunc(L, Utils.GETTER_IDX, "manager", _g_get_manager);
            
			Utils.RegisterFunc(L, Utils.SETTER_IDX, "endianType", _s_set_endianType);
            Utils.RegisterFunc(L, Utils.SETTER_IDX, "packageLenSize", _s_set_packageLenSize);
            Utils.RegisterFunc(L, Utils.SETTER_IDX, "socket", _s_set_socket);
            Utils.RegisterFunc(L, Utils.SETTER_IDX, "manager", _s_set_manager);
            
			
			Utils.EndObjectRegister(type, L, translator, null, null,
			    null, null, null);

		    Utils.BeginClassRegister(type, L, __CreateInstance, 1, 0, 0);
			
			
            
			
			
			
			Utils.EndClassRegister(type, L, translator);
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int __CreateInstance(RealStatePtr L)
        {
            return LuaAPI.luaL_error(L, "Assets.Common.Net.IPackageCreator does not have a constructor!");
        }
        
		
        
		
        
        
        
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Receive(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                Assets.Common.Net.IPackageCreator gen_to_be_invoked = (Assets.Common.Net.IPackageCreator)translator.FastGetCSObj(L, 1);
            
            
                
                {
                    
                    gen_to_be_invoked.Receive(  );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Send(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                Assets.Common.Net.IPackageCreator gen_to_be_invoked = (Assets.Common.Net.IPackageCreator)translator.FastGetCSObj(L, 1);
            
            
                
                {
                    byte[] _data = LuaAPI.lua_tobytes(L, 2);
                    
                    gen_to_be_invoked.Send( ref _data );
                    LuaAPI.lua_pushstring(L, _data);
                        
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        
        
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _g_get_endianType(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                Assets.Common.Net.IPackageCreator gen_to_be_invoked = (Assets.Common.Net.IPackageCreator)translator.FastGetCSObj(L, 1);
                translator.Push(L, gen_to_be_invoked.endianType);
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            return 1;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _g_get_packageLenSize(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                Assets.Common.Net.IPackageCreator gen_to_be_invoked = (Assets.Common.Net.IPackageCreator)translator.FastGetCSObj(L, 1);
                LuaAPI.xlua_pushinteger(L, gen_to_be_invoked.packageLenSize);
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            return 1;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _g_get_socket(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                Assets.Common.Net.IPackageCreator gen_to_be_invoked = (Assets.Common.Net.IPackageCreator)translator.FastGetCSObj(L, 1);
                translator.Push(L, gen_to_be_invoked.socket);
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            return 1;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _g_get_manager(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                Assets.Common.Net.IPackageCreator gen_to_be_invoked = (Assets.Common.Net.IPackageCreator)translator.FastGetCSObj(L, 1);
                translator.Push(L, gen_to_be_invoked.manager);
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            return 1;
        }
        
        
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _s_set_endianType(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                Assets.Common.Net.IPackageCreator gen_to_be_invoked = (Assets.Common.Net.IPackageCreator)translator.FastGetCSObj(L, 1);
                Assets.Common.Net.EndianType gen_value;translator.Get(L, 2, out gen_value);
				gen_to_be_invoked.endianType = gen_value;
            
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            return 0;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _s_set_packageLenSize(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                Assets.Common.Net.IPackageCreator gen_to_be_invoked = (Assets.Common.Net.IPackageCreator)translator.FastGetCSObj(L, 1);
                gen_to_be_invoked.packageLenSize = LuaAPI.xlua_tointeger(L, 2);
            
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            return 0;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _s_set_socket(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                Assets.Common.Net.IPackageCreator gen_to_be_invoked = (Assets.Common.Net.IPackageCreator)translator.FastGetCSObj(L, 1);
                gen_to_be_invoked.socket = (System.Net.Sockets.Socket)translator.GetObject(L, 2, typeof(System.Net.Sockets.Socket));
            
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            return 0;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _s_set_manager(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                Assets.Common.Net.IPackageCreator gen_to_be_invoked = (Assets.Common.Net.IPackageCreator)translator.FastGetCSObj(L, 1);
                gen_to_be_invoked.manager = (Assets.Common.Net.NetManager)translator.GetObject(L, 2, typeof(Assets.Common.Net.NetManager));
            
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            return 0;
        }
        
		
		
		
		
    }
}

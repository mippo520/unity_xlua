#define DEBUG_ASSETBUNDLE

using Assets.Common.Log;
using Assets.Common.Resource;
using Assets.Common.Singleton;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using XLua;

namespace Assets.Common.Lua
{
    class LuaManager : GameObjSingleton<LuaManager>
    {
        public LuaFunction s_CreateBehaviour = null;
        public LuaFunction s_GetBehaviour = null;

        private Int64 s_Id = 10086;
        private LuaEnv m_LuaEnv = null;

        public LuaEnv Env
        {
            get
            {
                return m_LuaEnv;
            }
        }

        public Int64 GetId()
        {
            return ++s_Id;
        }

        public LuaTable CreateBehaviour(Int64 id, string script)
        {
            return s_CreateBehaviour.Call(id, script)[0] as LuaTable;
        }

        public LuaTable GetBehaviour(Int64 id)
        {
            return s_GetBehaviour.Call(id)[0] as LuaTable;
        }
        public LuaManager()
        {

        }

        public void startup()
        {
            if (null != m_LuaEnv)
            {
                m_LuaEnv.Dispose();
                m_LuaEnv = null;
            }

            m_LuaEnv = new LuaEnv();
            m_LuaEnv.AddBuildin("rapidjson", XLua.LuaDLL.Lua.LoadRapidJson);
            m_LuaEnv.AddBuildin("pb", XLua.LuaDLL.Lua.LoadLuaProtobuf);

            m_LuaEnv.AddLoader(new LuaEnv.CustomLoader((ref string f) =>
            {
                f = f.Replace(".", "/");
#if UNITY_EDITOR && !DEBUG_ASSETBUNDLE
                f = "Assets/Script/" + f + ".lua";
                return File.ReadAllBytes(f);
#else
                f = "Assets/Script/" + f + ".txt";
                var luaScript = ResourcesManager.GetInstance().LoadAsset<TextAsset>(f.ToLower());
                return System.Text.Encoding.Default.GetBytes(luaScript.text);
#endif
            }));
        }

        private void Update()
        {
            if (null != m_LuaEnv)
            {
                m_LuaEnv.Tick();

                if (Time.frameCount % 100 == 0)
                {
                    m_LuaEnv.FullGc();
                }
            }
        }

        protected override void _destroy()
        {
            base._destroy();
            if (null != m_LuaEnv)
            {
                m_LuaEnv.Dispose();
                m_LuaEnv = null;
            }
        }
    }
}

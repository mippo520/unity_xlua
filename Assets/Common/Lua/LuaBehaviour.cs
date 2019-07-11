using Assets.Common.Log;
using Assets.Common.Net;
using Assets.Common.Resource;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;
using XLua;

namespace Assets.Common.Lua
{
    public class LuaBehaviour : MonoBehaviour
    {
        static Int64 s_Id = 0;
        public string luaScript;

        private LuaEnv m_LuaEnv = null;
        internal static float lastGCTime = 0;
        internal const float GCInterval = 1;//1 second 

        public LuaFunction AwakeFunction;
        public LuaFunction StartFunction;
        public LuaFunction UpdateFunction;
        public LuaFunction OnDestroyFunction;
//         private LuaTable scriptEnv;
        private LuaTable luaBehaviour = null;
        private Int64 m_Id = 0;

        void Awake()
        {
            m_Id = ++s_Id;
            m_LuaEnv = LuaManager.GetInstance().Env;
//             scriptEnv = m_LuaEnv.NewTable();
// 
//             // 为每个脚本设置一个独立的环境，可一定程度上防止脚本间全局变量、函数冲突
//             LuaTable meta = m_LuaEnv.NewTable();
//             meta.Set("__index", m_LuaEnv.Global);
//             scriptEnv.SetMetaTable(meta);
//             meta.Dispose();
            var beginIndex = luaScript.LastIndexOf(".") + 1;
            var scriptName = luaScript;
            if (beginIndex >= 0 && beginIndex < luaScript.Length)
            {
                scriptName = scriptName.Substring(beginIndex);
            }

            m_LuaEnv.DoString(string.Format(@"
                BehaviourManager.create({0}, '{1}')
            ", m_Id, luaScript), "LuaBehaviour"/*, scriptEnv*/);

            var luaBehaviourManager = m_LuaEnv.Global.Get<LuaTable>("BehaviourManager");
            var getFunc = luaBehaviourManager.Get<LuaFunction>("getBehaviour");
            this.luaBehaviour = getFunc.Call(m_Id)[0] as LuaTable;
            AwakeFunction = luaBehaviour.Get<LuaFunction>("awake");
            StartFunction = luaBehaviour.Get<LuaFunction>("start");
            UpdateFunction = luaBehaviour.Get<LuaFunction>("update");
            OnDestroyFunction = luaBehaviour.Get<LuaFunction>("destroy");
            this.luaBehaviour.Set("gameObject", this.gameObject);
            this.luaBehaviour.Set("luaScript", this.luaScript);
            this.luaBehaviour.Set("id", this.m_Id);
            //             meta = m_LuaEnv.NewTable();
            //             meta.Set("__index", this);
            //             className.SetMetaTable(meta);
            //             meta.Dispose();
            // 
            //             meta = m_LuaEnv.NewTable();
            //             className.Set("__index", className);
            //             meta.SetMetaTable(className);
            //             className = meta;

            if (null != AwakeFunction)
            {
                AwakeFunction.Call(this.luaBehaviour);
            }
        }

        // Use this for initialization
        void Start()
        {
            if (null != StartFunction) { StartFunction.Call(luaBehaviour); }
        }

        // Update is called once per frame
        void Update()
        {
            if (null != UpdateFunction) { UpdateFunction.Call(luaBehaviour); }
        }

        void OnDestroy()
        {
            if (null != OnDestroyFunction) { OnDestroyFunction.Call(luaBehaviour); }

//             if (null != scriptEnv) scriptEnv.Dispose();
        }


        private void OnApplicationQuit()
        {
            OnDestroy();
            OnDestroyFunction = null;
            UpdateFunction = null;
            StartFunction = null;
            AwakeFunction = null;
//             scriptEnv = null;
        }

    }
}

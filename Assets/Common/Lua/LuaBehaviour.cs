using Assets.Common.Resource;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;
using XLua;

namespace Assets.Common.Lua
{
    public class LuaBehaviour : MonoBehaviour
    {
        public string luaScript;

        private LuaEnv m_LuaEnv = null;
        internal static float lastGCTime = 0;
        internal const float GCInterval = 1;//1 second 

        public LuaFunction AwakeFunction;
        public LuaFunction StartFunction;
        public LuaFunction UpdateFunction;
        public LuaFunction OnDestroyFunction;
        private LuaTable scriptEnv;

        void Awake()
        {
            m_LuaEnv = LuaManager.GetInstance().Env;
            scriptEnv = m_LuaEnv.NewTable();

            // 为每个脚本设置一个独立的环境，可一定程度上防止脚本间全局变量、函数冲突
            LuaTable meta = m_LuaEnv.NewTable();
            meta.Set("__index", m_LuaEnv.Global);
            scriptEnv.SetMetaTable(meta);
            meta.Dispose();

            m_LuaEnv.DoString(string.Format("require '{0}'", luaScript), "LuaBehaviour", scriptEnv);

            LuaTable className = scriptEnv.Get<LuaTable>(luaScript);
            AwakeFunction = className.Get<LuaFunction>("awake");
            StartFunction = className.Get<LuaFunction>("start");
            UpdateFunction = className.Get<LuaFunction>("update");
            OnDestroyFunction = className.Get<LuaFunction>("onDestroy");

            if (null != AwakeFunction)
            {
                AwakeFunction.Call(gameObject);
            }
        }

        // Use this for initialization
        void Start()
        {
            if (StartFunction != null) { StartFunction.Call(); }
        }

        // Update is called once per frame
        void Update()
        {
            if (UpdateFunction != null) { UpdateFunction.Call(); }
        }

        void OnDestroy()
        {
            if (OnDestroyFunction != null) { OnDestroyFunction.Call(); }
            scriptEnv.Dispose();
        }


        private void OnApplicationQuit()
        {
            OnDestroyFunction = null;
            UpdateFunction = null;
            StartFunction = null;
            AwakeFunction = null;
        }

    }
}

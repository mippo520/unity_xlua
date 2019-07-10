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
        public string luaScript;

        private LuaEnv m_LuaEnv = null;
        internal static float lastGCTime = 0;
        internal const float GCInterval = 1;//1 second 

        public LuaFunction AwakeFunction;
        public LuaFunction StartFunction;
        public LuaFunction UpdateFunction;
        public LuaFunction OnDestroyFunction;
        private LuaTable scriptEnv;
        private LuaTable className = null;

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

            var beginIndex = luaScript.LastIndexOf(".") + 1;
            var scriptName = luaScript;
            if (beginIndex >= 0 && beginIndex < luaScript.Length)
            {
                scriptName = scriptName.Substring(beginIndex);

            }
            className = scriptEnv.Get<LuaTable>(scriptName);
            AwakeFunction = className.Get<LuaFunction>("awake");
            StartFunction = className.Get<LuaFunction>("start");
            UpdateFunction = className.Get<LuaFunction>("update");
            OnDestroyFunction = className.Get<LuaFunction>("onDestroy");
            meta = m_LuaEnv.NewTable();
            meta.Set("__index", this);
            className.SetMetaTable(meta);
            meta.Dispose();

            if (null != AwakeFunction)
            {
                AwakeFunction.Call(className);
            }
        }

        // Use this for initialization
        void Start()
        {
            if (null != StartFunction) { StartFunction.Call(className); }
        }

        // Update is called once per frame
        void Update()
        {
            if (null != UpdateFunction) { UpdateFunction.Call(className); }
        }

        void OnDestroy()
        {
            if (null != OnDestroyFunction) { OnDestroyFunction.Call(className); }
            if (null != scriptEnv) scriptEnv.Dispose();
        }


        private void OnApplicationQuit()
        {
            OnDestroy();
            OnDestroyFunction = null;
            UpdateFunction = null;
            StartFunction = null;
            AwakeFunction = null;
            scriptEnv = null;
        }

    }
}

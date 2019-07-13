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
        public static LuaFunction s_CreateBehaviour = null;
        public static LuaFunction s_GetBehaviour = null;
        static Int64 s_Id = 10086;
        public string luaScript;

        public LuaFunction AwakeFunction;
        public LuaFunction StartFunction;
        public LuaFunction UpdateFunction;
        public LuaFunction OnDestroyFunction;
        private LuaTable luaBehaviour = null;
        private Int64 m_Id = 0;
        public Int64 id { get {
                return m_Id;
            }
        }

        void Awake()
        {
            m_Id = ++s_Id;
            var luaEnv = LuaManager.GetInstance().Env;
            var beginIndex = luaScript.LastIndexOf(".") + 1;
            var scriptName = luaScript;
            if (beginIndex >= 0 && beginIndex < luaScript.Length)
            {
                scriptName = scriptName.Substring(beginIndex);
            }

            s_CreateBehaviour.Call(m_Id, luaScript);
            this.luaBehaviour = s_GetBehaviour.Call(m_Id)[0] as LuaTable;
            AwakeFunction = luaBehaviour.Get<LuaFunction>("awake");
            StartFunction = luaBehaviour.Get<LuaFunction>("start");
            UpdateFunction = luaBehaviour.Get<LuaFunction>("update");
            OnDestroyFunction = luaBehaviour.Get<LuaFunction>("destroy");
            this.luaBehaviour.Set("gameObject", this.gameObject);
            this.luaBehaviour.Set("behaviour", this);
            this.luaBehaviour.Set("luaScript", this.luaScript);
            this.luaBehaviour.Set("id", this.m_Id);

            Info.Debug("lua awake! " + luaScript);
            if (null != AwakeFunction)
            {
                AwakeFunction.Call(this.luaBehaviour);
            }
        }

        // Use this for initialization
        void Start()
        {
            Info.Debug("lua start! " + luaScript);
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
        }


        private void OnApplicationQuit()
        {
            OnDestroy();
            OnDestroyFunction = null;
            UpdateFunction = null;
            StartFunction = null;
            AwakeFunction = null;
        }

    }
}

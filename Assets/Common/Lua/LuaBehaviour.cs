using Assets.Common.Log;
using Assets.Common.Net;
using Assets.Common.Resource;
using Assets.Common.Tools;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using XLua;

namespace Assets.Common.Lua
{
    public enum BehaviourType
    {
        Int = 0,
        Int64,
        String,
        Double
    }

    [Serializable]
    public class stParamObj
    {
        public string name;
        public UnityEngine.Object obj;
        public string type;
    }

    [Serializable]
    public class stStringObj
    {
        public string name;
        public string obj;
        public string type;
    }

    public class LuaBehaviour : MonoBehaviour
    {
        [FilePath("Script", ".lua")]
        public string luaScript;

        private LuaFunction AwakeFunction;
        private LuaFunction StartFunction;
        private LuaFunction UpdateFunction;
        private LuaFunction OnDestroyFunction;
        public LuaTable luaBehaviour = null;
        private Int64 m_Id = 0;
        public Int64 id { get {
                return m_Id;
            }
        }

        [HideInInspector]
        public List<stParamObj> listParams = new List<stParamObj>();

        [HideInInspector]
        public List<stStringObj> listStrings = new List<stStringObj>();

        void Awake()
        {
            m_Id = LuaManager.GetInstance().GetId();
            var luaEnv = LuaManager.GetInstance().Env;

            var luaExtBegin = luaScript.LastIndexOf(".lua");
            if (luaExtBegin >= 0)
            {
                luaScript = luaScript.Substring(0, luaExtBegin);
            }

            var beginIndex = luaScript.LastIndexOf(".") + 1;
            var scriptName = luaScript;
            if (beginIndex >= 0 && beginIndex < luaScript.Length)
            {
                scriptName = scriptName.Substring(beginIndex);
            }

            LuaManager.GetInstance().CreateBehaviour(m_Id, luaScript);
            this.luaBehaviour = LuaManager.GetInstance().GetBehaviour(m_Id);
            AwakeFunction = luaBehaviour.Get<LuaFunction>("awake");
            StartFunction = luaBehaviour.Get<LuaFunction>("start");
            UpdateFunction = luaBehaviour.Get<LuaFunction>("update");
            OnDestroyFunction = luaBehaviour.Get<LuaFunction>("destroy");
            this.luaBehaviour.Set("behaviourObject", this);

            foreach (stStringObj so in listStrings)
            {
                if (typeof(int).Name == so.type)
                {
                    this.luaBehaviour.Set(so.name, Convert.ToInt32(so.obj));
                }
                else if (typeof(Double).Name == so.type)
                {
                    this.luaBehaviour.Set(so.name, Convert.ToDouble(so.obj));
                }
                else if (typeof(string).Name == so.type)
                {
                    this.luaBehaviour.Set(so.name, so.obj);
                }
                else
                {
                    Info.Error("luaBehaviour awake error! arg type error! type is " + so.type);
                }
            }

            foreach (stParamObj po in listParams)
            {
                this.luaBehaviour.Set(po.name, po.obj);
            }

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

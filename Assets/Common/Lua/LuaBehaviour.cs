using Assets.Common.Log;
using Assets.Common.Net;
using Assets.Common.Resource;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;
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
    public class LuaBehaviour : MonoBehaviour
    {
        public string luaScript;

        [System.Serializable]
        public struct Param
        {
            public string name;
            public string value;
            public BehaviourType type;
        }

        public List<Param> listParames = new List<Param>();

        private LuaFunction AwakeFunction;
        private LuaFunction StartFunction;
        private LuaFunction UpdateFunction;
        private LuaFunction OnDestroyFunction;
        private LuaTable luaBehaviour = null;
        private Int64 m_Id = 0;
        public Int64 id { get {
                return m_Id;
            }
        }

        void Awake()
        {
            m_Id = LuaManager.GetInstance().GetId();
            var luaEnv = LuaManager.GetInstance().Env;
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

            foreach (Param arg in listParames)
            {
                switch(arg.type)
                {
                    case BehaviourType.Int:
                        this.luaBehaviour.Set(arg.name, Convert.ToInt32(arg.value));
                        break;
                    case BehaviourType.Int64:
                        this.luaBehaviour.Set(arg.name, Convert.ToInt64(arg.value));
                        break;
                    case BehaviourType.String:
                        this.luaBehaviour.Set(arg.name, arg.value);
                        break;
                    case BehaviourType.Double:
                        this.luaBehaviour.Set(arg.name, Convert.ToDouble(arg.value));
                        break;
                    default:
                        Info.Error(string.Format("set param error! type is ", arg.type));
                        break;
                }
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

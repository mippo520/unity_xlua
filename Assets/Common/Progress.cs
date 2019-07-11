using Assets.Common.Log;
using Assets.Common.Lua;
using Assets.Common.Resource;
using Assets.Common.Singleton;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine.UI;
using XLua;

namespace Assets.Common
{
    class Progress : GameObjSingleton<Progress>
    {
        public LuaFunction StartFunction;
        public LuaFunction UpdateFunction;
        public LuaFunction QuitFunction;

        private void Start()
        {
            ResourcesManager.GetInstance().Hotupdate((HotUpdateRes res, long totalSize, string err) =>
            {
                if (HotUpdateRes.Complete == res)
                {
                    ResourcesManager.GetInstance().Init(() =>
                    {
                        ResourcesManager.GetInstance().LoadAssetBundleAsync(new string[] { "lua_script" },
                            null,
                            (string[] arrPath) =>
                            {
                                Info.Debug(string.Format("complete {0}", Assets.Common.Tools.Time.now()));
                                var luaEnv = LuaManager.GetInstance().Env;

                                LuaManager.GetInstance().Env.DoString("require 'launcher'", "Launcher");
                                LuaTable className = luaEnv.Global.Get<LuaTable>("Launcher");
                                StartFunction = className.Get<LuaFunction>("start");
                                QuitFunction = className.Get<LuaFunction>("appQuit");
                                UpdateFunction = className.Get<LuaFunction>("update");

                                var luaBehaviourManager = luaEnv.Global.Get<LuaTable>("BehaviourManager");
                                LuaBehaviour.s_CreateBehaviour = luaBehaviourManager.Get<LuaFunction>("create");
                                LuaBehaviour.s_GetBehaviour = luaBehaviourManager.Get<LuaFunction>("getBehaviour");


                                if (null != StartFunction)
                                {
                                    StartFunction.Call();
                                }
                            });
                    });

                }
            },
            (long completeSize) =>
            {
                Info.Debug(string.Format("completeSize = {0}", completeSize));
            });
        }

        private void Update()
        {
            if (null != UpdateFunction)
            {
                UpdateFunction.Call();
            }
        }

        private void OnApplicationQuit()
        {
            if (null != QuitFunction)
            {
                QuitFunction.Call();
            }
        }

        private void OnDestroy()
        {

        }

    }
}

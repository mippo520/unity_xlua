using Assets.Common.Log;
using Assets.Common.Lua;
using Assets.Common.Resource;
using Assets.Common.Singleton;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.UI;
using XLua;

namespace Assets.Common
{
    class Progress : GameObjSingleton<Progress>
    {
        private LuaTable Launcher;
        private LuaFunction StartFunction;
        private LuaFunction UpdateFunction;
        private LuaFunction QuitFunction;

        public void begin()
        {
            ResourcesManager.GetInstance().checkVersion();
            ResourcesManager.GetInstance().Init(() =>
            {
                ResourcesManager.GetInstance().LoadAssetBundleAsync(new string[] { "lua_script" },
                    null,
                    (string[] arrPath) =>
                    {
                        LuaManager.GetInstance().startup();
                        var luaEnv = LuaManager.GetInstance().Env;

                        LuaManager.GetInstance().Env.DoString("require 'progress'", "Progress");
                        Launcher = luaEnv.Global.Get<LuaTable>("Progress");
                        StartFunction = Launcher.Get<LuaFunction>("start");
                        UpdateFunction = Launcher.Get<LuaFunction>("update");
                        QuitFunction = Launcher.Get<LuaFunction>("appQuit");

                        var luaBehaviourManager = luaEnv.Global.Get<LuaTable>("BehaviourManager");
                        LuaManager.GetInstance().s_CreateBehaviour = luaBehaviourManager.Get<LuaFunction>("create");
                        LuaManager.GetInstance().s_GetBehaviour = luaBehaviourManager.Get<LuaFunction>("getBehaviour");

                        if (null != StartFunction)
                        {
                            StartFunction.Call(Launcher);
                        }
                    });
            });
        }

        private void Update()
        {
            if (null != UpdateFunction)
            {
                UpdateFunction.Call(Launcher);
            }
        }

        private void OnApplicationQuit()
        {
            if (null != QuitFunction)
            {
                QuitFunction.Call(Launcher);
            }
        }
    }
}

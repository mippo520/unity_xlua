using Assets.Common.Log;
using Assets.Common.Lua;
using Assets.Common.Net;
using Assets.Common.Resource;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using XLua;

public class Launcher : MonoBehaviour
{
    public LuaFunction StartFunction;
    public LuaFunction UpdateFunction;
    public LuaFunction QuitFunction;
    private LuaTable scriptEnv;

    // Start is called before the first frame update
    void Start()
    {
        ResourcesManager.GetInstance().Hotupdate((HotUpdateRes res, long totalSize, string err) =>
        {
            Info.Debug( string.Format("res = {0}, totalSize = {1} ", res, totalSize) + err );
            var text = this.transform.GetChild(0).GetComponent<Text>();
            text.text = string.Format("res = {0}, totalSize = {1} ", res, totalSize) + err;

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
                            scriptEnv = luaEnv.NewTable();

                            // 为每个脚本设置一个独立的环境，可一定程度上防止脚本间全局变量、函数冲突
                            LuaTable meta = luaEnv.NewTable();
                            meta.Set("__index", luaEnv.Global);
                            scriptEnv.SetMetaTable(meta);
                            meta.Dispose();

                            LuaManager.GetInstance().Env.DoString("require 'launcher'", "Launcher", scriptEnv);
                            LuaTable className = scriptEnv.Get<LuaTable>("Launcher");
                            StartFunction = className.Get<LuaFunction>("start");
                            QuitFunction = className.Get<LuaFunction>("appQuit");
                            UpdateFunction = className.Get<LuaFunction>("update");

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
            var text = this.transform.GetChild(0).GetComponent<Text>();
            text.text = string.Format("completeSize = {0}", completeSize);
        });
    }

    // Update is called once per frame
    void Update()
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

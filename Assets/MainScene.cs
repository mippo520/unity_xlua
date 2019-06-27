using Assets;
using Assets.Common.Log;
using Assets.Common.Lua;
using Assets.Common.Net;
using Assets.Common.Resource;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Net.Sockets;
using UnityEditor;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MainScene : MonoBehaviour
{
    private void Awake()
    {
    }

    void Start()
    {
        ResourcesManager.GetInstance().Init(() =>
        {
            ResourcesManager.GetInstance().LoadAssetBundleAsync(new string[] { "lua_script" });
            var btn1 = this.transform.GetChild(0).gameObject;
            btn1.GetComponent<Button>().onClick.AddListener(() =>
            {
                //                 SceneManager.LoadScene("Game");
                string ip = "192.168.3.192";
                NetManager.GetInstance().Connect(ref ip, 9101, (NetState res) =>
                {
                    Info.Debug(string.Format("connect res {0}", res));
                    if (NetState.Connected == res)
                    {
                        NetManager.GetInstance().Receive((byte[] data, NetState state) => {
                            if (NetState.Connected != state)
                            {
                                Info.Debug("connect is close!");
                                return;
                            }
                            foreach (byte c in data)
                            {
                                Info.Debug(string.Format("{0}", (char)c));
                            }
                        });
                    }
                });
            });
            var btn2 = this.transform.GetChild(1).gameObject;
            btn2.GetComponent<Button>().onClick.AddListener(() =>
            {
                NetManager.GetInstance().Close();
            });
            var btn3 = this.transform.GetChild(2).gameObject;
            btn3.GetComponent<Button>().onClick.AddListener(() =>
            {
                var data = System.Text.Encoding.Default.GetBytes("var btn3 = this.transform.GetChild(2).gameObject;");
                NetManager.GetInstance().Send(ref data);
            });
            var btn4 = this.transform.GetChild(3).gameObject;
            btn4.GetComponent<Button>().onClick.AddListener(() =>
            {
                NetManager.GetInstance().Reconnect();
            });
        });

        LuaManager.GetInstance();
        NetManager.GetInstance().Init(EndianType.Big, 4, new FirstPackageCreator());
    }

    public void FrameCallback(float process)
    {
    }

    public void CompleteCallback(string[] arrPath)
    {
    }

    // Update is called once per frame
    void Update()
    {
    }

}

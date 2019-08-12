using Assets.Common;
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

class Launcher : MonoBehaviour
{
    void Start()
    {
        Progress.GetInstance().begin();
    }
}

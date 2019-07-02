
require("common.functions")

UnityUI = CS.UnityEngine.UI
Unity = CS.UnityEngine
UnitySceneManager = CS.UnityEngine.SceneManagement.SceneManager
UnitySceneMode = CS.UnityEngine.SceneManagement.LoadSceneMode

Info = CS.Assets.Common.Log.Info
FileManagerInst = CS.Assets.Common.Tools.FileManager.GetInstance()
ResourcesManagerInst = CS.Assets.Common.Resource.ResourcesManager.GetInstance()
Time = CS.Assets.Common.Tools.Time

NetManagerInst = require("common.net.net_manager").GetInstance()
EventManagerInst = require("common.event.event_manager").GetInstance()
TimeManagerInst = require("common.time.time_manager").GetInstance()
Event = require("define.event")
Tools = require("common.tools")
Now = handler(TimeManagerInst, TimeManagerInst.now)

RapidJson = require 'rapidjson'
PB = require 'pb'
Protoc = require 'common.pb.protoc'

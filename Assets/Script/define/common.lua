
require("common.functions")
require("common.ui.behaviour.behaviour_manager")

UnityUI = CS.UnityEngine.UI
Unity = CS.UnityEngine
UnitySceneManager = CS.UnityEngine.SceneManagement.SceneManager
UnitySceneMode = CS.UnityEngine.SceneManagement.LoadSceneMode

CSCommon = CS.Assets.Common
CSLuaBehaviour = CSCommon.Lua.LuaBehaviour

Info = CSCommon.Log.Info
FileManagerInst = CSCommon.Tools.FileManager.GetInstance()
ResourcesManagerInst = CSCommon.Resource.ResourcesManager.GetInstance()
Time = CSCommon.Tools.Time

NetManagerInst = require("common.net.net_manager").GetInstance()
EventManagerInst = require("common.event.event_manager").GetInstance()
TimeManagerInst = require("common.time.time_manager").GetInstance()
DialogManagerInst = require("common.ui.dialog_manager").GetInstance()

Event = require("define.event")
DialogType = require("define.dialog_type")
Tools = require("common.tools")
Now = handler(TimeManagerInst, TimeManagerInst.now)

Behaviour = require("common.ui.behaviour.behaviour")


RapidJson = require 'rapidjson'
PB = require 'pb'
Protoc = require 'common.pb.protoc'

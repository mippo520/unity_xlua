
require("common.functions")
require("common.ui.behaviour.behaviour_manager")

Event = require("define.event")
DialogType = require("define.dialog_type")
Error = require("define.error")
LoginType = require("define.login_type")
LanguageType = require("define.language_type")
SceneType = require("define.scene_type")

Tools = require("common.tools")

UnityUI = CS.UnityEngine.UI
Unity = CS.UnityEngine
UnitySceneManager = CS.UnityEngine.SceneManagement.SceneManager
UnitySceneMode = CS.UnityEngine.SceneManagement.LoadSceneMode

CSCommon = CS.Assets.Common
CSLuaBehaviour = CSCommon.Lua.LuaBehaviour

Info = CSCommon.Log.Info
FileManager = CSCommon.Tools.FileManager
FileManagerInst = FileManager.GetInstance()
ResourcesManagerInst = CSCommon.Resource.ResourcesManager.GetInstance()
Time = CSCommon.Tools.Time
HttpState = CS.Assets.Common.Net.HttpState


NetManagerInst = require("common.net.net_manager").GetInstance()
EventManagerInst = require("common.event.event_manager").GetInstance()
TimeManagerInst = require("common.time.time_manager").GetInstance()
DialogManagerInst = require("common.ui.dialog_manager").GetInstance()
HttpManagerInst = require("common.net.http_manager").GetInstance()
LanguageManagerInst = require("common.language.language_manager").GetInstance()

Behaviour = require("common.ui.behaviour.behaviour")
DialogBehaviour = require("common.ui.behaviour.dialog_behaviour")
XLuaUtil = require 'xlua.util'

Now = handler(TimeManagerInst, TimeManagerInst.now)

RapidJson = require 'rapidjson'
PB = require 'pb'
Protoc = require 'common.pb.protoc'
c_gs = require("pb.pb")

LoginControllerInst = require("controller.login_controller").GetInstance()

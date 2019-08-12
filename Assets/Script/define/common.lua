
require("common.functions")
require("common.ui.behaviour.behaviour_manager")

Event = require("define.event")
DialogType = require("define.dialog_type")
Error = require("define.error")
LoginType = require("define.login_type")
LanguageType = require("define.language_type")
SceneType = require("define.scene_type")
StorageKey = require("define.storage_key")

Tools = require("common.tools")

UnityUI = CS.UnityEngine.UI
Unity = CS.UnityEngine
UnitySceneManager = CS.UnityEngine.SceneManagement.SceneManager
UnitySceneMode = CS.UnityEngine.SceneManagement.LoadSceneMode

CSCommon = CS.Assets.Common
CSLuaBehaviour = CSCommon.Lua.LuaBehaviour
CSLuaScrollRect = CSCommon.UI.LuaScrollRect

Info = CSCommon.Log.Info
FileManager = CSCommon.Tools.FileManager
FileManagerInst = FileManager.GetInstance()
ResourcesManagerInst = CSCommon.Resource.ResourcesManager.GetInstance()
Time = CSCommon.Tools.Time
HttpState = CS.Assets.Common.Net.HttpState

RapidJson = require 'rapidjson'
PB = require 'pb'
Protoc = require 'common.pb.protoc'
c_gs = require("pb.pb")

NetManagerInst = require("common.net.net_manager").GetInstance()
EventManagerInst = require("common.event.event_manager").GetInstance()
TimeManagerInst = require("common.time.time_manager").GetInstance()
DialogManagerInst = require("common.ui.dialog_manager").GetInstance()
HttpManagerInst = require("common.net.http_manager").GetInstance()
LanguageManagerInst = require("common.language.language_manager").GetInstance()
StorageInst = require("common.storage.storage").GetInstance()

AutoObject = require("common.auto_object")
Behaviour = require("common.ui.behaviour.behaviour")
DialogBehaviour = require("common.ui.behaviour.dialog_behaviour")
BindProperty = require("common.bind.bind_property")
XLuaUtil = require 'xlua.util'

Now = handler(TimeManagerInst, TimeManagerInst.now)


LoginControllerInst = require("controller.login_controller").GetInstance()
AccountDataInst = require("module.account_data").GetInstance()

Version = BindProperty.new("0.0.0")

ListView = require("common.ui.list_view.list_view")


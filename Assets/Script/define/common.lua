
require("common.functions")
require("common.behaviour.behaviour_manager")

Event = require("define.event")
DialogType = require("define.dialog_type")
Error = require("define.error")
LoginType = require("define.login_type")
LanguageType = require("define.language_type")
SceneType = require("define.scene_type")
StorageKey = require("define.storage_key")

AutoObject = require("common.auto_object")
BindProperty = require("common.bind.bind_property")
Tools = require("common.tools")
Vector = require("common.vector")

Unity = CS.UnityEngine
UnityUI = Unity.UI
UnitySceneManager = Unity.SceneManagement.SceneManager
UnitySceneMode = Unity.SceneManagement.LoadSceneMode
TMPro = CS.TMPro
Input = Unity.Input

CSCommon = CS.Assets.Common
CSLuaBehaviour = CSCommon.Lua.LuaBehaviour
CSLuaScrollRect = CSCommon.UI.LuaScrollRect
CSRvo = CS.RVO
CSRvoInst = CSRvo.Simulator.Instance
CSTools = CSCommon.Tools
CSEngineExt = CSTools.EngineExt
CSPackageCreator = CSCommon.Net.PackageCreator

Info = CSCommon.Log.Info
Info.s_Level = CSCommon.Log.eLogLevel.Debug
FileManager = CSTools.FileManager
FileManagerInst = FileManager.GetInstance()
ResourcesManagerInst = CSCommon.Resource.ResourcesManager.GetInstance()
Time = CSTools.Time
HttpState = CSCommon.Net.HttpState

CSCoroutine = require("xlua.cs_coroutine")
RapidJson = require 'rapidjson'
PB = require 'pb'
Protoc = require 'common.pb.protoc'
c_gs = require("pb.pb")

EventManagerInst = require("common.event.event_manager")
StorageInst = require("common.storage.storage")
TcpManagerInst = require("common.net.tcp_manager")
UdpManagerInst = require("common.net.udp_manager")
TimeManagerInst = require("common.time.time_manager")
DialogManagerInst = require("common.ui.dialog_manager")
HttpManagerInst = require("common.net.http_manager")

SimpleEvent = require("common.event.simple_event")

Behaviour = require("common.behaviour.behaviour")
DialogBehaviour = require("common.ui.dialog_behaviour")

XLuaUtil = require 'xlua.util'

Now = handler(TimeManagerInst, TimeManagerInst.now)
ServerTime = handler(TimeManagerInst, TimeManagerInst.serverTime)

Version = BindProperty.new("0.0.0")

ListView = require("ui.list_view.list_view")
GridView = require("ui.list_view.grid_view")
StepListView = require("ui.list_view.step_list_view")

CfgLoader = require("common.cfg.cfg_loader")

ApplicationInst = require("application")
CameraManagerInst = require("common.camera.camera_manager")

require("define.game")
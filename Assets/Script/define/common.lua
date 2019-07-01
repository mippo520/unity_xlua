
require("common.functions")

UnityUI = CS.UnityEngine.UI

Info = CS.Assets.Common.Log.Info
FileManager = CS.Assets.Common.Tools.FileManager
ResourcesManager = CS.Assets.Common.Resource.ResourcesManager
Time = CS.Assets.Common.Tools.Time

NetManager = require("common.net.net_manager")
EventManager = require("common.event.event_manager")
Event = require("define.event")
Tools = require("common.tools")
TimeManager = require("common.time.time_manager")
Now = handler(TimeManager.GetInstance(), TimeManager.GetInstance().now)

RapidJson = require 'rapidjson'
PB = require 'pb'
Protoc = require 'common.pb.protoc'

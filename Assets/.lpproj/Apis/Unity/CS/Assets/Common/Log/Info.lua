---@class CS.Assets.Common.Log.Info : CS.System.Object
CS.Assets.Common.Log.Info = {}

---@field public CS.Assets.Common.Log.Info.s_Level : CS.Assets.Common.Log.eLogLevel
CS.Assets.Common.Log.Info.s_Level = nil

---@return CS.Assets.Common.Log.Info
function CS.Assets.Common.Log.Info()
end

---@param content : CS.System.String
function CS.Assets.Common.Log.Info.Debug(content)
end

---@param content : CS.System.String
function CS.Assets.Common.Log.Info.Log(content)
end

---@param content : CS.System.String
function CS.Assets.Common.Log.Info.Warn(content)
end

---@param content : CS.System.String
function CS.Assets.Common.Log.Info.Error(content)
end
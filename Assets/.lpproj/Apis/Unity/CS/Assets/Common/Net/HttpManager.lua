---@class CS.Assets.Common.Net.HttpManager : CS.Assets.Common.Singleton.GameObjSingleton
CS.Assets.Common.Net.HttpManager = {}

---@return CS.Assets.Common.Net.HttpManager
function CS.Assets.Common.Net.HttpManager()
end

---@param url : CS.System.String
---@param callback : CS.System.Action
---@return CS.System.Int64
function CS.Assets.Common.Net.HttpManager:Get(url, callback)
end
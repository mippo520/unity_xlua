---@class CS.Assets.Common.Resource.ResourcesManager : CS.Assets.Common.Singleton.GameObjSingleton
CS.Assets.Common.Resource.ResourcesManager = {}

---@field public CS.Assets.Common.Resource.ResourcesManager.s_VersionFile : CS.System.String
CS.Assets.Common.Resource.ResourcesManager.s_VersionFile = nil

---@field public CS.Assets.Common.Resource.ResourcesManager.s_VersionFileName : CS.System.String
CS.Assets.Common.Resource.ResourcesManager.s_VersionFileName = nil

---@field public CS.Assets.Common.Resource.ResourcesManager.s_FileData : CS.System.String
CS.Assets.Common.Resource.ResourcesManager.s_FileData = nil

---@field public CS.Assets.Common.Resource.ResourcesManager.s_FileDataFileName : CS.System.String
CS.Assets.Common.Resource.ResourcesManager.s_FileDataFileName = nil

---@return CS.Assets.Common.Resource.ResourcesManager
function CS.Assets.Common.Resource.ResourcesManager()
end

---@param resCallback : CS.System.Action
---@param timeout : CS.System.Int32
function CS.Assets.Common.Resource.ResourcesManager:CompareUpdateFile(resCallback, timeout)
end

---@param resCallback : CS.System.Action
---@param processCallback : CS.System.Action
---@param timeout : CS.System.Int32
function CS.Assets.Common.Resource.ResourcesManager:Hotupdate(resCallback, processCallback, timeout)
end

---@param callback : CS.System.Action
function CS.Assets.Common.Resource.ResourcesManager:Init(callback)
end

---@param arrPath : CS.System.String[]
---@param frameCallback : CS.System.Action
---@param completeCallback : CS.System.Action
function CS.Assets.Common.Resource.ResourcesManager:LoadAssetBundleAsync(arrPath, frameCallback, completeCallback)
end

---@param path : CS.System.String
---@return CS.UnityEngine.Object
function CS.Assets.Common.Resource.ResourcesManager:LoadAsset(path)
end

---@param arrPath : CS.System.String[]
function CS.Assets.Common.Resource.ResourcesManager:UnloadAssetBundle(arrPath)
end

function CS.Assets.Common.Resource.ResourcesManager:UnloadAllAssetBundle()
end

function CS.Assets.Common.Resource.ResourcesManager:checkVersion()
end
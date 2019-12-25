---@class CS.Assets.Common.Tools.FileManager : CS.Assets.Common.Singleton.GameObjSingleton
CS.Assets.Common.Tools.FileManager = {}

---@return CS.Assets.Common.Tools.FileManager
function CS.Assets.Common.Tools.FileManager()
end

---@param packageName : CS.System.String
---@param fileName : CS.System.String
---@param callback : CS.Assets.Common.Tools.CallbackFunc
function CS.Assets.Common.Tools.FileManager:readAllBytesAsync(packageName, fileName, callback)
end

---@param fileName : CS.System.String
---@return CS.System.Byte[]
function CS.Assets.Common.Tools.FileManager:readAllBytes(fileName)
end

---@param content : CS.System.Byte[]
---@return CS.System.String
function CS.Assets.Common.Tools.FileManager.md5(content)
end
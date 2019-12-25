---@class CS.Assets.Common.Tools.FilePathAttribute : CS.UnityEngine.PropertyAttribute
CS.Assets.Common.Tools.FilePathAttribute = {}

---@property readwrite CS.Assets.Common.Tools.FilePathAttribute.arrExt : CS.System.String[]
CS.Assets.Common.Tools.FilePathAttribute.arrExt = nil

---@property readwrite CS.Assets.Common.Tools.FilePathAttribute.arrPath : CS.System.Collections.Generic.List
CS.Assets.Common.Tools.FilePathAttribute.arrPath = nil

---@param arrPath : CS.System.String[]
---@param arrExt : CS.System.String[]
---@return CS.Assets.Common.Tools.FilePathAttribute
function CS.Assets.Common.Tools.FilePathAttribute(arrPath, arrExt)
end

---@param path : CS.System.String
---@param ext : CS.System.String
---@return CS.Assets.Common.Tools.FilePathAttribute
function CS.Assets.Common.Tools.FilePathAttribute(path, ext)
end

---@param ext : CS.System.String
---@return CS.Assets.Common.Tools.FilePathAttribute
function CS.Assets.Common.Tools.FilePathAttribute(ext)
end

---@param arrExt : CS.System.String[]
---@return CS.Assets.Common.Tools.FilePathAttribute
function CS.Assets.Common.Tools.FilePathAttribute(arrExt)
end
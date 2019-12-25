---@class CS.Spine.SkeletonJson : CS.System.Object
CS.Spine.SkeletonJson = {}

---@property readwrite CS.Spine.SkeletonJson.Scale : CS.System.Single
CS.Spine.SkeletonJson.Scale = nil

---@param atlasArray : CS.Spine.Atlas[]
---@return CS.Spine.SkeletonJson
function CS.Spine.SkeletonJson(atlasArray)
end

---@param attachmentLoader : CS.Spine.AttachmentLoader
---@return CS.Spine.SkeletonJson
function CS.Spine.SkeletonJson(attachmentLoader)
end

---@param path : CS.System.String
---@return CS.Spine.SkeletonData
function CS.Spine.SkeletonJson:ReadSkeletonData(path)
end

---@param reader : CS.System.IO.TextReader
---@return CS.Spine.SkeletonData
function CS.Spine.SkeletonJson:ReadSkeletonData(reader)
end
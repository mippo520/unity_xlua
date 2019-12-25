---@class CS.Spine.Unity.RegionlessAttachmentLoader : CS.System.Object
CS.Spine.Unity.RegionlessAttachmentLoader = {}

---@return CS.Spine.Unity.RegionlessAttachmentLoader
function CS.Spine.Unity.RegionlessAttachmentLoader()
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@param path : CS.System.String
---@return CS.Spine.RegionAttachment
function CS.Spine.Unity.RegionlessAttachmentLoader:NewRegionAttachment(skin, name, path)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@param path : CS.System.String
---@return CS.Spine.MeshAttachment
function CS.Spine.Unity.RegionlessAttachmentLoader:NewMeshAttachment(skin, name, path)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.BoundingBoxAttachment
function CS.Spine.Unity.RegionlessAttachmentLoader:NewBoundingBoxAttachment(skin, name)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.PathAttachment
function CS.Spine.Unity.RegionlessAttachmentLoader:NewPathAttachment(skin, name)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.PointAttachment
function CS.Spine.Unity.RegionlessAttachmentLoader:NewPointAttachment(skin, name)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.ClippingAttachment
function CS.Spine.Unity.RegionlessAttachmentLoader:NewClippingAttachment(skin, name)
end
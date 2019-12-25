---@class CS.Spine.AttachmentLoader
CS.Spine.AttachmentLoader = {}

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@param path : CS.System.String
---@return CS.Spine.RegionAttachment
function CS.Spine.AttachmentLoader:NewRegionAttachment(skin, name, path)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@param path : CS.System.String
---@return CS.Spine.MeshAttachment
function CS.Spine.AttachmentLoader:NewMeshAttachment(skin, name, path)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.BoundingBoxAttachment
function CS.Spine.AttachmentLoader:NewBoundingBoxAttachment(skin, name)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.PathAttachment
function CS.Spine.AttachmentLoader:NewPathAttachment(skin, name)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.PointAttachment
function CS.Spine.AttachmentLoader:NewPointAttachment(skin, name)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.ClippingAttachment
function CS.Spine.AttachmentLoader:NewClippingAttachment(skin, name)
end
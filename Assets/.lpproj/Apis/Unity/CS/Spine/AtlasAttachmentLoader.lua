---@class CS.Spine.AtlasAttachmentLoader : CS.System.Object
CS.Spine.AtlasAttachmentLoader = {}

---@param atlasArray : CS.Spine.Atlas[]
---@return CS.Spine.AtlasAttachmentLoader
function CS.Spine.AtlasAttachmentLoader(atlasArray)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@param path : CS.System.String
---@return CS.Spine.RegionAttachment
function CS.Spine.AtlasAttachmentLoader:NewRegionAttachment(skin, name, path)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@param path : CS.System.String
---@return CS.Spine.MeshAttachment
function CS.Spine.AtlasAttachmentLoader:NewMeshAttachment(skin, name, path)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.BoundingBoxAttachment
function CS.Spine.AtlasAttachmentLoader:NewBoundingBoxAttachment(skin, name)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.PathAttachment
function CS.Spine.AtlasAttachmentLoader:NewPathAttachment(skin, name)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.PointAttachment
function CS.Spine.AtlasAttachmentLoader:NewPointAttachment(skin, name)
end

---@param skin : CS.Spine.Skin
---@param name : CS.System.String
---@return CS.Spine.ClippingAttachment
function CS.Spine.AtlasAttachmentLoader:NewClippingAttachment(skin, name)
end

---@param name : CS.System.String
---@return CS.Spine.AtlasRegion
function CS.Spine.AtlasAttachmentLoader:FindRegion(name)
end
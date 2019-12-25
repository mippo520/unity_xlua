---@module CS.Spine.Unity.Modules.AttachmentTools
CS.Spine.Unity.Modules.AttachmentTools = {}

---@class CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions : CS.System.Object
CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions = {}

---@param attachment : CS.Spine.Attachment
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.GetRegion(attachment)
end

---@param regionAttachment : CS.Spine.RegionAttachment
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.GetRegion(regionAttachment)
end

---@param meshAttachment : CS.Spine.MeshAttachment
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.GetRegion(meshAttachment)
end

---@param attachment : CS.Spine.Attachment
---@param region : CS.Spine.AtlasRegion
---@param updateOffset : CS.System.Boolean
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.SetRegion(attachment, region, updateOffset)
end

---@param attachment : CS.Spine.RegionAttachment
---@param region : CS.Spine.AtlasRegion
---@param updateOffset : CS.System.Boolean
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.SetRegion(attachment, region, updateOffset)
end

---@param attachment : CS.Spine.MeshAttachment
---@param region : CS.Spine.AtlasRegion
---@param updateUVs : CS.System.Boolean
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.SetRegion(attachment, region, updateUVs)
end

---@param sprite : CS.UnityEngine.Sprite
---@param material : CS.UnityEngine.Material
---@param rotation : CS.System.Single
---@return CS.Spine.RegionAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.ToRegionAttachment(sprite, material, rotation)
end

---@param sprite : CS.UnityEngine.Sprite
---@param page : CS.Spine.AtlasPage
---@param rotation : CS.System.Single
---@return CS.Spine.RegionAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.ToRegionAttachment(sprite, page, rotation)
end

---@param sprite : CS.UnityEngine.Sprite
---@param shader : CS.UnityEngine.Shader
---@param textureFormat : CS.UnityEngine.TextureFormat
---@param mipmaps : CS.System.Boolean
---@param materialPropertySource : CS.UnityEngine.Material
---@param rotation : CS.System.Single
---@return CS.Spine.RegionAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.ToRegionAttachmentPMAClone(sprite, shader, textureFormat, mipmaps, materialPropertySource, rotation)
end

---@param sprite : CS.UnityEngine.Sprite
---@param materialPropertySource : CS.UnityEngine.Material
---@param textureFormat : CS.UnityEngine.TextureFormat
---@param mipmaps : CS.System.Boolean
---@param rotation : CS.System.Single
---@return CS.Spine.RegionAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.ToRegionAttachmentPMAClone(sprite, materialPropertySource, textureFormat, mipmaps, rotation)
end

---@param region : CS.Spine.AtlasRegion
---@param attachmentName : CS.System.String
---@param scale : CS.System.Single
---@param rotation : CS.System.Single
---@return CS.Spine.RegionAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.ToRegionAttachment(region, attachmentName, scale, rotation)
end

---@param regionAttachment : CS.Spine.RegionAttachment
---@param scale : CS.UnityEngine.Vector2
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.SetScale(regionAttachment, scale)
end

---@param regionAttachment : CS.Spine.RegionAttachment
---@param x : CS.System.Single
---@param y : CS.System.Single
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.SetScale(regionAttachment, x, y)
end

---@param regionAttachment : CS.Spine.RegionAttachment
---@param offset : CS.UnityEngine.Vector2
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.SetPositionOffset(regionAttachment, offset)
end

---@param regionAttachment : CS.Spine.RegionAttachment
---@param x : CS.System.Single
---@param y : CS.System.Single
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.SetPositionOffset(regionAttachment, x, y)
end

---@param regionAttachment : CS.Spine.RegionAttachment
---@param rotation : CS.System.Single
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentRegionExtensions.SetRotation(regionAttachment, rotation)
end
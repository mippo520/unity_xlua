---@class CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions : CS.System.Object
CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions = {}

---@param o : CS.Spine.Attachment
---@param cloneMeshesAsLinked : CS.System.Boolean
---@return CS.Spine.Attachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetClone(o, cloneMeshesAsLinked)
end

---@param o : CS.Spine.RegionAttachment
---@return CS.Spine.RegionAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetClone(o)
end

---@param o : CS.Spine.ClippingAttachment
---@return CS.Spine.ClippingAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetClone(o)
end

---@param o : CS.Spine.PointAttachment
---@return CS.Spine.PointAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetClone(o)
end

---@param o : CS.Spine.BoundingBoxAttachment
---@return CS.Spine.BoundingBoxAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetClone(o)
end

---@param o : CS.Spine.MeshAttachment
---@param inheritDeform : CS.System.Boolean
---@return CS.Spine.MeshAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetLinkedClone(o, inheritDeform)
end

---@param o : CS.Spine.MeshAttachment
---@return CS.Spine.MeshAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetClone(o)
end

---@param o : CS.Spine.PathAttachment
---@return CS.Spine.PathAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetClone(o)
end

---@param o : CS.Spine.MeshAttachment
---@param newLinkedMeshName : CS.System.String
---@param region : CS.Spine.AtlasRegion
---@param inheritDeform : CS.System.Boolean
---@param copyOriginalProperties : CS.System.Boolean
---@return CS.Spine.MeshAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetLinkedMesh(o, newLinkedMeshName, region, inheritDeform, copyOriginalProperties)
end

---@param o : CS.Spine.MeshAttachment
---@param sprite : CS.UnityEngine.Sprite
---@param shader : CS.UnityEngine.Shader
---@param inheritDeform : CS.System.Boolean
---@param materialPropertySource : CS.UnityEngine.Material
---@return CS.Spine.MeshAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetLinkedMesh(o, sprite, shader, inheritDeform, materialPropertySource)
end

---@param o : CS.Spine.MeshAttachment
---@param sprite : CS.UnityEngine.Sprite
---@param materialPropertySource : CS.UnityEngine.Material
---@param inheritDeform : CS.System.Boolean
---@return CS.Spine.MeshAttachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetLinkedMesh(o, sprite, materialPropertySource, inheritDeform)
end

---@param o : CS.Spine.Attachment
---@param sprite : CS.UnityEngine.Sprite
---@param sourceMaterial : CS.UnityEngine.Material
---@param premultiplyAlpha : CS.System.Boolean
---@param cloneMeshAsLinked : CS.System.Boolean
---@param useOriginalRegionSize : CS.System.Boolean
---@return CS.Spine.Attachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetRemappedClone(o, sprite, sourceMaterial, premultiplyAlpha, cloneMeshAsLinked, useOriginalRegionSize)
end

---@param o : CS.Spine.Attachment
---@param atlasRegion : CS.Spine.AtlasRegion
---@param cloneMeshAsLinked : CS.System.Boolean
---@param useOriginalRegionSize : CS.System.Boolean
---@param scale : CS.System.Single
---@return CS.Spine.Attachment
function CS.Spine.Unity.Modules.AttachmentTools.AttachmentCloneExtensions.GetRemappedClone(o, atlasRegion, cloneMeshAsLinked, useOriginalRegionSize, scale)
end
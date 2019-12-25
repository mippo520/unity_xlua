---@class CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities : CS.System.Object
CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities = {}

---@param skeleton : CS.Spine.Skeleton
---@param includeDefaultSkin : CS.System.Boolean
---@param unshareAttachments : CS.System.Boolean
---@param state : CS.Spine.AnimationState
---@return CS.Spine.Skin
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.UnshareSkin(skeleton, includeDefaultSkin, unshareAttachments, state)
end

---@param skeleton : CS.Spine.Skeleton
---@param newSkinName : CS.System.String
---@param includeDefaultSkin : CS.System.Boolean
---@param cloneAttachments : CS.System.Boolean
---@param cloneMeshesAsLinked : CS.System.Boolean
---@return CS.Spine.Skin
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.GetClonedSkin(skeleton, newSkinName, includeDefaultSkin, cloneAttachments, cloneMeshesAsLinked)
end

---@param original : CS.Spine.Skin
---@return CS.Spine.Skin
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.GetClone(original)
end

---@param skin : CS.Spine.Skin
---@param slotName : CS.System.String
---@param keyName : CS.System.String
---@param attachment : CS.Spine.Attachment
---@param skeleton : CS.Spine.Skeleton
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.SetAttachment(skin, slotName, keyName, attachment, skeleton)
end

---@param skin : CS.Spine.Skin
---@param otherSkin : CS.Spine.Skin
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.AddAttachments(skin, otherSkin)
end

---@param skin : CS.Spine.Skin
---@param slotName : CS.System.String
---@param keyName : CS.System.String
---@param skeleton : CS.Spine.Skeleton
---@return CS.Spine.Attachment
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.GetAttachment(skin, slotName, keyName, skeleton)
end

---@param skin : CS.Spine.Skin
---@param slotIndex : CS.System.Int32
---@param keyName : CS.System.String
---@param attachment : CS.Spine.Attachment
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.SetAttachment(skin, slotIndex, keyName, attachment)
end

---@param skin : CS.Spine.Skin
---@param slotName : CS.System.String
---@param keyName : CS.System.String
---@param skeletonData : CS.Spine.SkeletonData
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.RemoveAttachment(skin, slotName, keyName, skeletonData)
end

---@param skin : CS.Spine.Skin
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.Clear(skin)
end

---@param destination : CS.Spine.Skin
---@param source : CS.Spine.Skin
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.Append(destination, source)
end

---@param source : CS.Spine.Skin
---@param destination : CS.Spine.Skin
---@param overwrite : CS.System.Boolean
---@param cloneAttachments : CS.System.Boolean
---@param cloneMeshesAsLinked : CS.System.Boolean
function CS.Spine.Unity.Modules.AttachmentTools.SkinUtilities.CopyTo(source, destination, overwrite, cloneAttachments, cloneMeshesAsLinked)
end
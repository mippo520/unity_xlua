---@class CS.Spine.Unity.SpineAttachment : CS.Spine.Unity.SpineAttributeBase
CS.Spine.Unity.SpineAttachment = {}

---@field public CS.Spine.Unity.SpineAttachment.returnAttachmentPath : CS.System.Boolean
CS.Spine.Unity.SpineAttachment.returnAttachmentPath = nil

---@field public CS.Spine.Unity.SpineAttachment.currentSkinOnly : CS.System.Boolean
CS.Spine.Unity.SpineAttachment.currentSkinOnly = nil

---@field public CS.Spine.Unity.SpineAttachment.placeholdersOnly : CS.System.Boolean
CS.Spine.Unity.SpineAttachment.placeholdersOnly = nil

---@field public CS.Spine.Unity.SpineAttachment.skinField : CS.System.String
CS.Spine.Unity.SpineAttachment.skinField = nil

---@field public CS.Spine.Unity.SpineAttachment.slotField : CS.System.String
CS.Spine.Unity.SpineAttachment.slotField = nil

---@param currentSkinOnly : CS.System.Boolean
---@param returnAttachmentPath : CS.System.Boolean
---@param placeholdersOnly : CS.System.Boolean
---@param slotField : CS.System.String
---@param dataField : CS.System.String
---@param skinField : CS.System.String
---@param includeNone : CS.System.Boolean
---@param fallbackToTextField : CS.System.Boolean
---@return CS.Spine.Unity.SpineAttachment
function CS.Spine.Unity.SpineAttachment(currentSkinOnly, returnAttachmentPath, placeholdersOnly, slotField, dataField, skinField, includeNone, fallbackToTextField)
end

---@param fullPath : CS.System.String
---@return CS.Spine.Unity.Hierarchy
function CS.Spine.Unity.SpineAttachment.GetHierarchy(fullPath)
end

---@param attachmentPath : CS.System.String
---@param skeletonData : CS.Spine.SkeletonData
---@return CS.Spine.Attachment
function CS.Spine.Unity.SpineAttachment.GetAttachment(attachmentPath, skeletonData)
end

---@param attachmentPath : CS.System.String
---@param skeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
---@return CS.Spine.Attachment
function CS.Spine.Unity.SpineAttachment.GetAttachment(attachmentPath, skeletonDataAsset)
end
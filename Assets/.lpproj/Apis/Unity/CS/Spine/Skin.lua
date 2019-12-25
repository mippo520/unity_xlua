---@class CS.Spine.Skin : CS.System.Object
CS.Spine.Skin = {}

---@property readonly CS.Spine.Skin.Name : CS.System.String
CS.Spine.Skin.Name = nil

---@property readonly CS.Spine.Skin.Attachments : CS.System.Collections.Generic.Dictionary
CS.Spine.Skin.Attachments = nil

---@param name : CS.System.String
---@return CS.Spine.Skin
function CS.Spine.Skin(name)
end

---@param slotIndex : CS.System.Int32
---@param name : CS.System.String
---@param attachment : CS.Spine.Attachment
function CS.Spine.Skin:AddAttachment(slotIndex, name, attachment)
end

---@param slotIndex : CS.System.Int32
---@param name : CS.System.String
---@return CS.Spine.Attachment
function CS.Spine.Skin:GetAttachment(slotIndex, name)
end

---@param slotIndex : CS.System.Int32
---@param name : CS.System.String
function CS.Spine.Skin:RemoveAttachment(slotIndex, name)
end

---@param slotIndex : CS.System.Int32
---@param names : CS.System.Collections.Generic.List
function CS.Spine.Skin:FindNamesForSlot(slotIndex, names)
end

---@param slotIndex : CS.System.Int32
---@param attachments : CS.System.Collections.Generic.List
function CS.Spine.Skin:FindAttachmentsForSlot(slotIndex, attachments)
end

---@return CS.System.String
function CS.Spine.Skin:ToString()
end
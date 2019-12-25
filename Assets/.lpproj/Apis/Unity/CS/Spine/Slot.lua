---@class CS.Spine.Slot : CS.System.Object
CS.Spine.Slot = {}

---@property readonly CS.Spine.Slot.Data : CS.Spine.SlotData
CS.Spine.Slot.Data = nil

---@property readonly CS.Spine.Slot.Bone : CS.Spine.Bone
CS.Spine.Slot.Bone = nil

---@property readonly CS.Spine.Slot.Skeleton : CS.Spine.Skeleton
CS.Spine.Slot.Skeleton = nil

---@property readwrite CS.Spine.Slot.R : CS.System.Single
CS.Spine.Slot.R = nil

---@property readwrite CS.Spine.Slot.G : CS.System.Single
CS.Spine.Slot.G = nil

---@property readwrite CS.Spine.Slot.B : CS.System.Single
CS.Spine.Slot.B = nil

---@property readwrite CS.Spine.Slot.A : CS.System.Single
CS.Spine.Slot.A = nil

---@property readwrite CS.Spine.Slot.R2 : CS.System.Single
CS.Spine.Slot.R2 = nil

---@property readwrite CS.Spine.Slot.G2 : CS.System.Single
CS.Spine.Slot.G2 = nil

---@property readwrite CS.Spine.Slot.B2 : CS.System.Single
CS.Spine.Slot.B2 = nil

---@property readwrite CS.Spine.Slot.HasSecondColor : CS.System.Boolean
CS.Spine.Slot.HasSecondColor = nil

---@property readwrite CS.Spine.Slot.Attachment : CS.Spine.Attachment
CS.Spine.Slot.Attachment = nil

---@property readwrite CS.Spine.Slot.AttachmentTime : CS.System.Single
CS.Spine.Slot.AttachmentTime = nil

---@property readwrite CS.Spine.Slot.AttachmentVertices : CS.Spine.ExposedList
CS.Spine.Slot.AttachmentVertices = nil

---@param data : CS.Spine.SlotData
---@param bone : CS.Spine.Bone
---@return CS.Spine.Slot
function CS.Spine.Slot(data, bone)
end

---@param slot : CS.Spine.Slot
---@param bone : CS.Spine.Bone
---@return CS.Spine.Slot
function CS.Spine.Slot(slot, bone)
end

function CS.Spine.Slot:SetToSetupPose()
end

---@return CS.System.String
function CS.Spine.Slot:ToString()
end
---@class CS.Spine.SlotData : CS.System.Object
CS.Spine.SlotData = {}

---@property readonly CS.Spine.SlotData.Index : CS.System.Int32
CS.Spine.SlotData.Index = nil

---@property readonly CS.Spine.SlotData.Name : CS.System.String
CS.Spine.SlotData.Name = nil

---@property readonly CS.Spine.SlotData.BoneData : CS.Spine.BoneData
CS.Spine.SlotData.BoneData = nil

---@property readwrite CS.Spine.SlotData.R : CS.System.Single
CS.Spine.SlotData.R = nil

---@property readwrite CS.Spine.SlotData.G : CS.System.Single
CS.Spine.SlotData.G = nil

---@property readwrite CS.Spine.SlotData.B : CS.System.Single
CS.Spine.SlotData.B = nil

---@property readwrite CS.Spine.SlotData.A : CS.System.Single
CS.Spine.SlotData.A = nil

---@property readwrite CS.Spine.SlotData.R2 : CS.System.Single
CS.Spine.SlotData.R2 = nil

---@property readwrite CS.Spine.SlotData.G2 : CS.System.Single
CS.Spine.SlotData.G2 = nil

---@property readwrite CS.Spine.SlotData.B2 : CS.System.Single
CS.Spine.SlotData.B2 = nil

---@property readwrite CS.Spine.SlotData.HasSecondColor : CS.System.Boolean
CS.Spine.SlotData.HasSecondColor = nil

---@property readwrite CS.Spine.SlotData.AttachmentName : CS.System.String
CS.Spine.SlotData.AttachmentName = nil

---@property readwrite CS.Spine.SlotData.BlendMode : CS.Spine.BlendMode
CS.Spine.SlotData.BlendMode = nil

---@param index : CS.System.Int32
---@param name : CS.System.String
---@param boneData : CS.Spine.BoneData
---@return CS.Spine.SlotData
function CS.Spine.SlotData(index, name, boneData)
end

---@return CS.System.String
function CS.Spine.SlotData:ToString()
end
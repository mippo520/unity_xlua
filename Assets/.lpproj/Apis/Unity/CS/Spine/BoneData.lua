---@class CS.Spine.BoneData : CS.System.Object
CS.Spine.BoneData = {}

---@property readonly CS.Spine.BoneData.Index : CS.System.Int32
CS.Spine.BoneData.Index = nil

---@property readonly CS.Spine.BoneData.Name : CS.System.String
CS.Spine.BoneData.Name = nil

---@property readonly CS.Spine.BoneData.Parent : CS.Spine.BoneData
CS.Spine.BoneData.Parent = nil

---@property readwrite CS.Spine.BoneData.Length : CS.System.Single
CS.Spine.BoneData.Length = nil

---@property readwrite CS.Spine.BoneData.X : CS.System.Single
CS.Spine.BoneData.X = nil

---@property readwrite CS.Spine.BoneData.Y : CS.System.Single
CS.Spine.BoneData.Y = nil

---@property readwrite CS.Spine.BoneData.Rotation : CS.System.Single
CS.Spine.BoneData.Rotation = nil

---@property readwrite CS.Spine.BoneData.ScaleX : CS.System.Single
CS.Spine.BoneData.ScaleX = nil

---@property readwrite CS.Spine.BoneData.ScaleY : CS.System.Single
CS.Spine.BoneData.ScaleY = nil

---@property readwrite CS.Spine.BoneData.ShearX : CS.System.Single
CS.Spine.BoneData.ShearX = nil

---@property readwrite CS.Spine.BoneData.ShearY : CS.System.Single
CS.Spine.BoneData.ShearY = nil

---@property readwrite CS.Spine.BoneData.TransformMode : CS.Spine.TransformMode
CS.Spine.BoneData.TransformMode = nil

---@param index : CS.System.Int32
---@param name : CS.System.String
---@param parent : CS.Spine.BoneData
---@return CS.Spine.BoneData
function CS.Spine.BoneData(index, name, parent)
end

---@return CS.System.String
function CS.Spine.BoneData:ToString()
end
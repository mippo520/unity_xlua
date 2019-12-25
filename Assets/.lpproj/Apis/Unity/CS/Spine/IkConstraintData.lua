---@class CS.Spine.IkConstraintData : CS.System.Object
CS.Spine.IkConstraintData = {}

---@property readonly CS.Spine.IkConstraintData.Name : CS.System.String
CS.Spine.IkConstraintData.Name = nil

---@property readwrite CS.Spine.IkConstraintData.Order : CS.System.Int32
CS.Spine.IkConstraintData.Order = nil

---@property readonly CS.Spine.IkConstraintData.Bones : CS.System.Collections.Generic.List
CS.Spine.IkConstraintData.Bones = nil

---@property readwrite CS.Spine.IkConstraintData.Target : CS.Spine.BoneData
CS.Spine.IkConstraintData.Target = nil

---@property readwrite CS.Spine.IkConstraintData.Mix : CS.System.Single
CS.Spine.IkConstraintData.Mix = nil

---@property readwrite CS.Spine.IkConstraintData.BendDirection : CS.System.Int32
CS.Spine.IkConstraintData.BendDirection = nil

---@property readwrite CS.Spine.IkConstraintData.Compress : CS.System.Boolean
CS.Spine.IkConstraintData.Compress = nil

---@property readwrite CS.Spine.IkConstraintData.Stretch : CS.System.Boolean
CS.Spine.IkConstraintData.Stretch = nil

---@property readwrite CS.Spine.IkConstraintData.Uniform : CS.System.Boolean
CS.Spine.IkConstraintData.Uniform = nil

---@param name : CS.System.String
---@return CS.Spine.IkConstraintData
function CS.Spine.IkConstraintData(name)
end

---@return CS.System.String
function CS.Spine.IkConstraintData:ToString()
end
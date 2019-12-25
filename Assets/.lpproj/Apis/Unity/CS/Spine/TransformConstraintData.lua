---@class CS.Spine.TransformConstraintData : CS.System.Object
CS.Spine.TransformConstraintData = {}

---@property readonly CS.Spine.TransformConstraintData.Name : CS.System.String
CS.Spine.TransformConstraintData.Name = nil

---@property readwrite CS.Spine.TransformConstraintData.Order : CS.System.Int32
CS.Spine.TransformConstraintData.Order = nil

---@property readonly CS.Spine.TransformConstraintData.Bones : CS.Spine.ExposedList
CS.Spine.TransformConstraintData.Bones = nil

---@property readwrite CS.Spine.TransformConstraintData.Target : CS.Spine.BoneData
CS.Spine.TransformConstraintData.Target = nil

---@property readwrite CS.Spine.TransformConstraintData.RotateMix : CS.System.Single
CS.Spine.TransformConstraintData.RotateMix = nil

---@property readwrite CS.Spine.TransformConstraintData.TranslateMix : CS.System.Single
CS.Spine.TransformConstraintData.TranslateMix = nil

---@property readwrite CS.Spine.TransformConstraintData.ScaleMix : CS.System.Single
CS.Spine.TransformConstraintData.ScaleMix = nil

---@property readwrite CS.Spine.TransformConstraintData.ShearMix : CS.System.Single
CS.Spine.TransformConstraintData.ShearMix = nil

---@property readwrite CS.Spine.TransformConstraintData.OffsetRotation : CS.System.Single
CS.Spine.TransformConstraintData.OffsetRotation = nil

---@property readwrite CS.Spine.TransformConstraintData.OffsetX : CS.System.Single
CS.Spine.TransformConstraintData.OffsetX = nil

---@property readwrite CS.Spine.TransformConstraintData.OffsetY : CS.System.Single
CS.Spine.TransformConstraintData.OffsetY = nil

---@property readwrite CS.Spine.TransformConstraintData.OffsetScaleX : CS.System.Single
CS.Spine.TransformConstraintData.OffsetScaleX = nil

---@property readwrite CS.Spine.TransformConstraintData.OffsetScaleY : CS.System.Single
CS.Spine.TransformConstraintData.OffsetScaleY = nil

---@property readwrite CS.Spine.TransformConstraintData.OffsetShearY : CS.System.Single
CS.Spine.TransformConstraintData.OffsetShearY = nil

---@property readwrite CS.Spine.TransformConstraintData.Relative : CS.System.Boolean
CS.Spine.TransformConstraintData.Relative = nil

---@property readwrite CS.Spine.TransformConstraintData.Local : CS.System.Boolean
CS.Spine.TransformConstraintData.Local = nil

---@param name : CS.System.String
---@return CS.Spine.TransformConstraintData
function CS.Spine.TransformConstraintData(name)
end

---@return CS.System.String
function CS.Spine.TransformConstraintData:ToString()
end
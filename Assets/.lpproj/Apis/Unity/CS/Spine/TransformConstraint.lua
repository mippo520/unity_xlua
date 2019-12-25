---@class CS.Spine.TransformConstraint : CS.System.Object
CS.Spine.TransformConstraint = {}

---@property readonly CS.Spine.TransformConstraint.Order : CS.System.Int32
CS.Spine.TransformConstraint.Order = nil

---@property readonly CS.Spine.TransformConstraint.Bones : CS.Spine.ExposedList
CS.Spine.TransformConstraint.Bones = nil

---@property readwrite CS.Spine.TransformConstraint.Target : CS.Spine.Bone
CS.Spine.TransformConstraint.Target = nil

---@property readwrite CS.Spine.TransformConstraint.RotateMix : CS.System.Single
CS.Spine.TransformConstraint.RotateMix = nil

---@property readwrite CS.Spine.TransformConstraint.TranslateMix : CS.System.Single
CS.Spine.TransformConstraint.TranslateMix = nil

---@property readwrite CS.Spine.TransformConstraint.ScaleMix : CS.System.Single
CS.Spine.TransformConstraint.ScaleMix = nil

---@property readwrite CS.Spine.TransformConstraint.ShearMix : CS.System.Single
CS.Spine.TransformConstraint.ShearMix = nil

---@property readonly CS.Spine.TransformConstraint.Data : CS.Spine.TransformConstraintData
CS.Spine.TransformConstraint.Data = nil

---@param data : CS.Spine.TransformConstraintData
---@param skeleton : CS.Spine.Skeleton
---@return CS.Spine.TransformConstraint
function CS.Spine.TransformConstraint(data, skeleton)
end

---@param constraint : CS.Spine.TransformConstraint
---@param skeleton : CS.Spine.Skeleton
---@return CS.Spine.TransformConstraint
function CS.Spine.TransformConstraint(constraint, skeleton)
end

function CS.Spine.TransformConstraint:Apply()
end

function CS.Spine.TransformConstraint:Update()
end

---@return CS.System.String
function CS.Spine.TransformConstraint:ToString()
end
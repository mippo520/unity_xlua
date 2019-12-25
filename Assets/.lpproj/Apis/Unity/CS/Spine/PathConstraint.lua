---@class CS.Spine.PathConstraint : CS.System.Object
CS.Spine.PathConstraint = {}

---@property readonly CS.Spine.PathConstraint.Order : CS.System.Int32
CS.Spine.PathConstraint.Order = nil

---@property readwrite CS.Spine.PathConstraint.Position : CS.System.Single
CS.Spine.PathConstraint.Position = nil

---@property readwrite CS.Spine.PathConstraint.Spacing : CS.System.Single
CS.Spine.PathConstraint.Spacing = nil

---@property readwrite CS.Spine.PathConstraint.RotateMix : CS.System.Single
CS.Spine.PathConstraint.RotateMix = nil

---@property readwrite CS.Spine.PathConstraint.TranslateMix : CS.System.Single
CS.Spine.PathConstraint.TranslateMix = nil

---@property readonly CS.Spine.PathConstraint.Bones : CS.Spine.ExposedList
CS.Spine.PathConstraint.Bones = nil

---@property readwrite CS.Spine.PathConstraint.Target : CS.Spine.Slot
CS.Spine.PathConstraint.Target = nil

---@property readonly CS.Spine.PathConstraint.Data : CS.Spine.PathConstraintData
CS.Spine.PathConstraint.Data = nil

---@param data : CS.Spine.PathConstraintData
---@param skeleton : CS.Spine.Skeleton
---@return CS.Spine.PathConstraint
function CS.Spine.PathConstraint(data, skeleton)
end

---@param constraint : CS.Spine.PathConstraint
---@param skeleton : CS.Spine.Skeleton
---@return CS.Spine.PathConstraint
function CS.Spine.PathConstraint(constraint, skeleton)
end

function CS.Spine.PathConstraint:Apply()
end

function CS.Spine.PathConstraint:Update()
end

---@return CS.System.String
function CS.Spine.PathConstraint:ToString()
end
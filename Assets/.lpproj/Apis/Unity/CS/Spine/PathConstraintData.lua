---@class CS.Spine.PathConstraintData : CS.System.Object
CS.Spine.PathConstraintData = {}

---@property readonly CS.Spine.PathConstraintData.Name : CS.System.String
CS.Spine.PathConstraintData.Name = nil

---@property readwrite CS.Spine.PathConstraintData.Order : CS.System.Int32
CS.Spine.PathConstraintData.Order = nil

---@property readonly CS.Spine.PathConstraintData.Bones : CS.Spine.ExposedList
CS.Spine.PathConstraintData.Bones = nil

---@property readwrite CS.Spine.PathConstraintData.Target : CS.Spine.SlotData
CS.Spine.PathConstraintData.Target = nil

---@property readwrite CS.Spine.PathConstraintData.PositionMode : CS.Spine.PositionMode
CS.Spine.PathConstraintData.PositionMode = nil

---@property readwrite CS.Spine.PathConstraintData.SpacingMode : CS.Spine.SpacingMode
CS.Spine.PathConstraintData.SpacingMode = nil

---@property readwrite CS.Spine.PathConstraintData.RotateMode : CS.Spine.RotateMode
CS.Spine.PathConstraintData.RotateMode = nil

---@property readwrite CS.Spine.PathConstraintData.OffsetRotation : CS.System.Single
CS.Spine.PathConstraintData.OffsetRotation = nil

---@property readwrite CS.Spine.PathConstraintData.Position : CS.System.Single
CS.Spine.PathConstraintData.Position = nil

---@property readwrite CS.Spine.PathConstraintData.Spacing : CS.System.Single
CS.Spine.PathConstraintData.Spacing = nil

---@property readwrite CS.Spine.PathConstraintData.RotateMix : CS.System.Single
CS.Spine.PathConstraintData.RotateMix = nil

---@property readwrite CS.Spine.PathConstraintData.TranslateMix : CS.System.Single
CS.Spine.PathConstraintData.TranslateMix = nil

---@param name : CS.System.String
---@return CS.Spine.PathConstraintData
function CS.Spine.PathConstraintData(name)
end

---@return CS.System.String
function CS.Spine.PathConstraintData:ToString()
end
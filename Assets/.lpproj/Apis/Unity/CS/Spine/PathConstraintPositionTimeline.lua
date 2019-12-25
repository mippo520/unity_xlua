---@class CS.Spine.PathConstraintPositionTimeline : CS.Spine.CurveTimeline
CS.Spine.PathConstraintPositionTimeline = {}

---@field public CS.Spine.PathConstraintPositionTimeline.ENTRIES : CS.System.Int32
CS.Spine.PathConstraintPositionTimeline.ENTRIES = nil

---@property readonly CS.Spine.PathConstraintPositionTimeline.PropertyId : CS.System.Int32
CS.Spine.PathConstraintPositionTimeline.PropertyId = nil

---@property readwrite CS.Spine.PathConstraintPositionTimeline.PathConstraintIndex : CS.System.Int32
CS.Spine.PathConstraintPositionTimeline.PathConstraintIndex = nil

---@property readwrite CS.Spine.PathConstraintPositionTimeline.Frames : CS.System.Single[]
CS.Spine.PathConstraintPositionTimeline.Frames = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.PathConstraintPositionTimeline
function CS.Spine.PathConstraintPositionTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param position : CS.System.Single
function CS.Spine.PathConstraintPositionTimeline:SetFrame(frameIndex, time, position)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.PathConstraintPositionTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
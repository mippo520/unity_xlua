---@class CS.Spine.PathConstraintSpacingTimeline : CS.Spine.PathConstraintPositionTimeline
CS.Spine.PathConstraintSpacingTimeline = {}

---@property readonly CS.Spine.PathConstraintSpacingTimeline.PropertyId : CS.System.Int32
CS.Spine.PathConstraintSpacingTimeline.PropertyId = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.PathConstraintSpacingTimeline
function CS.Spine.PathConstraintSpacingTimeline(frameCount)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param events : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.PathConstraintSpacingTimeline:Apply(skeleton, lastTime, time, events, alpha, blend, direction)
end
---@class CS.Spine.ScaleTimeline : CS.Spine.TranslateTimeline
CS.Spine.ScaleTimeline = {}

---@property readonly CS.Spine.ScaleTimeline.PropertyId : CS.System.Int32
CS.Spine.ScaleTimeline.PropertyId = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.ScaleTimeline
function CS.Spine.ScaleTimeline(frameCount)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.ScaleTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
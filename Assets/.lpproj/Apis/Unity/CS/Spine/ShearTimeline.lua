---@class CS.Spine.ShearTimeline : CS.Spine.TranslateTimeline
CS.Spine.ShearTimeline = {}

---@property readonly CS.Spine.ShearTimeline.PropertyId : CS.System.Int32
CS.Spine.ShearTimeline.PropertyId = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.ShearTimeline
function CS.Spine.ShearTimeline(frameCount)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.ShearTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
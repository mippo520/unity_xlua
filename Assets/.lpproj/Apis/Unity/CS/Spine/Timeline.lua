---@class CS.Spine.Timeline
CS.Spine.Timeline = {}

---@property readonly CS.Spine.Timeline.PropertyId : CS.System.Int32
CS.Spine.Timeline.PropertyId = nil

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param events : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.Timeline:Apply(skeleton, lastTime, time, events, alpha, blend, direction)
end
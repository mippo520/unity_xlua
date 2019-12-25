---@class CS.Spine.DrawOrderTimeline : CS.System.Object
CS.Spine.DrawOrderTimeline = {}

---@property readonly CS.Spine.DrawOrderTimeline.PropertyId : CS.System.Int32
CS.Spine.DrawOrderTimeline.PropertyId = nil

---@property readonly CS.Spine.DrawOrderTimeline.FrameCount : CS.System.Int32
CS.Spine.DrawOrderTimeline.FrameCount = nil

---@property readwrite CS.Spine.DrawOrderTimeline.Frames : CS.System.Single[]
CS.Spine.DrawOrderTimeline.Frames = nil

---@property readwrite CS.Spine.DrawOrderTimeline.DrawOrders : CS.System.Int32[][]
CS.Spine.DrawOrderTimeline.DrawOrders = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.DrawOrderTimeline
function CS.Spine.DrawOrderTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param drawOrder : CS.System.Int32[]
function CS.Spine.DrawOrderTimeline:SetFrame(frameIndex, time, drawOrder)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.DrawOrderTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
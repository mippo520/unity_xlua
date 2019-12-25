---@class CS.Spine.EventTimeline : CS.System.Object
CS.Spine.EventTimeline = {}

---@property readonly CS.Spine.EventTimeline.PropertyId : CS.System.Int32
CS.Spine.EventTimeline.PropertyId = nil

---@property readonly CS.Spine.EventTimeline.FrameCount : CS.System.Int32
CS.Spine.EventTimeline.FrameCount = nil

---@property readwrite CS.Spine.EventTimeline.Frames : CS.System.Single[]
CS.Spine.EventTimeline.Frames = nil

---@property readwrite CS.Spine.EventTimeline.Events : CS.Spine.Event[]
CS.Spine.EventTimeline.Events = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.EventTimeline
function CS.Spine.EventTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param e : CS.Spine.Event
function CS.Spine.EventTimeline:SetFrame(frameIndex, e)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.EventTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
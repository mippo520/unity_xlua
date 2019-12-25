---@class CS.Spine.TwoColorTimeline : CS.Spine.CurveTimeline
CS.Spine.TwoColorTimeline = {}

---@field public CS.Spine.TwoColorTimeline.ENTRIES : CS.System.Int32
CS.Spine.TwoColorTimeline.ENTRIES = nil

---@property readonly CS.Spine.TwoColorTimeline.PropertyId : CS.System.Int32
CS.Spine.TwoColorTimeline.PropertyId = nil

---@property readwrite CS.Spine.TwoColorTimeline.SlotIndex : CS.System.Int32
CS.Spine.TwoColorTimeline.SlotIndex = nil

---@property readonly CS.Spine.TwoColorTimeline.Frames : CS.System.Single[]
CS.Spine.TwoColorTimeline.Frames = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.TwoColorTimeline
function CS.Spine.TwoColorTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param r : CS.System.Single
---@param g : CS.System.Single
---@param b : CS.System.Single
---@param a : CS.System.Single
---@param r2 : CS.System.Single
---@param g2 : CS.System.Single
---@param b2 : CS.System.Single
function CS.Spine.TwoColorTimeline:SetFrame(frameIndex, time, r, g, b, a, r2, g2, b2)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.TwoColorTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
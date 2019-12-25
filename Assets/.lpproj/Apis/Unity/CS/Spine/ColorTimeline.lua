---@class CS.Spine.ColorTimeline : CS.Spine.CurveTimeline
CS.Spine.ColorTimeline = {}

---@field public CS.Spine.ColorTimeline.ENTRIES : CS.System.Int32
CS.Spine.ColorTimeline.ENTRIES = nil

---@property readonly CS.Spine.ColorTimeline.PropertyId : CS.System.Int32
CS.Spine.ColorTimeline.PropertyId = nil

---@property readwrite CS.Spine.ColorTimeline.SlotIndex : CS.System.Int32
CS.Spine.ColorTimeline.SlotIndex = nil

---@property readwrite CS.Spine.ColorTimeline.Frames : CS.System.Single[]
CS.Spine.ColorTimeline.Frames = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.ColorTimeline
function CS.Spine.ColorTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param r : CS.System.Single
---@param g : CS.System.Single
---@param b : CS.System.Single
---@param a : CS.System.Single
function CS.Spine.ColorTimeline:SetFrame(frameIndex, time, r, g, b, a)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.ColorTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
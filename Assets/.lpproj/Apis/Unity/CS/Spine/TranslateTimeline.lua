---@class CS.Spine.TranslateTimeline : CS.Spine.CurveTimeline
CS.Spine.TranslateTimeline = {}

---@field public CS.Spine.TranslateTimeline.ENTRIES : CS.System.Int32
CS.Spine.TranslateTimeline.ENTRIES = nil

---@property readonly CS.Spine.TranslateTimeline.PropertyId : CS.System.Int32
CS.Spine.TranslateTimeline.PropertyId = nil

---@property readwrite CS.Spine.TranslateTimeline.BoneIndex : CS.System.Int32
CS.Spine.TranslateTimeline.BoneIndex = nil

---@property readwrite CS.Spine.TranslateTimeline.Frames : CS.System.Single[]
CS.Spine.TranslateTimeline.Frames = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.TranslateTimeline
function CS.Spine.TranslateTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param x : CS.System.Single
---@param y : CS.System.Single
function CS.Spine.TranslateTimeline:SetFrame(frameIndex, time, x, y)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.TranslateTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
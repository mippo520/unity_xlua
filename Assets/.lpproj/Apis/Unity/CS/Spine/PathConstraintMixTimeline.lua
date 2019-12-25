---@class CS.Spine.PathConstraintMixTimeline : CS.Spine.CurveTimeline
CS.Spine.PathConstraintMixTimeline = {}

---@field public CS.Spine.PathConstraintMixTimeline.ENTRIES : CS.System.Int32
CS.Spine.PathConstraintMixTimeline.ENTRIES = nil

---@property readonly CS.Spine.PathConstraintMixTimeline.PropertyId : CS.System.Int32
CS.Spine.PathConstraintMixTimeline.PropertyId = nil

---@property readwrite CS.Spine.PathConstraintMixTimeline.PathConstraintIndex : CS.System.Int32
CS.Spine.PathConstraintMixTimeline.PathConstraintIndex = nil

---@property readwrite CS.Spine.PathConstraintMixTimeline.Frames : CS.System.Single[]
CS.Spine.PathConstraintMixTimeline.Frames = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.PathConstraintMixTimeline
function CS.Spine.PathConstraintMixTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param rotateMix : CS.System.Single
---@param translateMix : CS.System.Single
function CS.Spine.PathConstraintMixTimeline:SetFrame(frameIndex, time, rotateMix, translateMix)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.PathConstraintMixTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
---@class CS.Spine.TransformConstraintTimeline : CS.Spine.CurveTimeline
CS.Spine.TransformConstraintTimeline = {}

---@field public CS.Spine.TransformConstraintTimeline.ENTRIES : CS.System.Int32
CS.Spine.TransformConstraintTimeline.ENTRIES = nil

---@property readonly CS.Spine.TransformConstraintTimeline.PropertyId : CS.System.Int32
CS.Spine.TransformConstraintTimeline.PropertyId = nil

---@property readwrite CS.Spine.TransformConstraintTimeline.TransformConstraintIndex : CS.System.Int32
CS.Spine.TransformConstraintTimeline.TransformConstraintIndex = nil

---@property readwrite CS.Spine.TransformConstraintTimeline.Frames : CS.System.Single[]
CS.Spine.TransformConstraintTimeline.Frames = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.TransformConstraintTimeline
function CS.Spine.TransformConstraintTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param rotateMix : CS.System.Single
---@param translateMix : CS.System.Single
---@param scaleMix : CS.System.Single
---@param shearMix : CS.System.Single
function CS.Spine.TransformConstraintTimeline:SetFrame(frameIndex, time, rotateMix, translateMix, scaleMix, shearMix)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.TransformConstraintTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
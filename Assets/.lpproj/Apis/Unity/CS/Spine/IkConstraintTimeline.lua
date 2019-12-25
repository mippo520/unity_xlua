---@class CS.Spine.IkConstraintTimeline : CS.Spine.CurveTimeline
CS.Spine.IkConstraintTimeline = {}

---@field public CS.Spine.IkConstraintTimeline.ENTRIES : CS.System.Int32
CS.Spine.IkConstraintTimeline.ENTRIES = nil

---@property readonly CS.Spine.IkConstraintTimeline.PropertyId : CS.System.Int32
CS.Spine.IkConstraintTimeline.PropertyId = nil

---@property readwrite CS.Spine.IkConstraintTimeline.IkConstraintIndex : CS.System.Int32
CS.Spine.IkConstraintTimeline.IkConstraintIndex = nil

---@property readwrite CS.Spine.IkConstraintTimeline.Frames : CS.System.Single[]
CS.Spine.IkConstraintTimeline.Frames = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.IkConstraintTimeline
function CS.Spine.IkConstraintTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param mix : CS.System.Single
---@param bendDirection : CS.System.Int32
---@param compress : CS.System.Boolean
---@param stretch : CS.System.Boolean
function CS.Spine.IkConstraintTimeline:SetFrame(frameIndex, time, mix, bendDirection, compress, stretch)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.IkConstraintTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
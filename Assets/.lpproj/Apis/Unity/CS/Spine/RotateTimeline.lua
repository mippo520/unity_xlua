---@class CS.Spine.RotateTimeline : CS.Spine.CurveTimeline
CS.Spine.RotateTimeline = {}

---@field public CS.Spine.RotateTimeline.ENTRIES : CS.System.Int32
CS.Spine.RotateTimeline.ENTRIES = nil

---@property readonly CS.Spine.RotateTimeline.PropertyId : CS.System.Int32
CS.Spine.RotateTimeline.PropertyId = nil

---@property readwrite CS.Spine.RotateTimeline.BoneIndex : CS.System.Int32
CS.Spine.RotateTimeline.BoneIndex = nil

---@property readwrite CS.Spine.RotateTimeline.Frames : CS.System.Single[]
CS.Spine.RotateTimeline.Frames = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.RotateTimeline
function CS.Spine.RotateTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param degrees : CS.System.Single
function CS.Spine.RotateTimeline:SetFrame(frameIndex, time, degrees)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.RotateTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
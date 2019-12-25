---@class CS.Spine.DeformTimeline : CS.Spine.CurveTimeline
CS.Spine.DeformTimeline = {}

---@property readonly CS.Spine.DeformTimeline.PropertyId : CS.System.Int32
CS.Spine.DeformTimeline.PropertyId = nil

---@property readwrite CS.Spine.DeformTimeline.SlotIndex : CS.System.Int32
CS.Spine.DeformTimeline.SlotIndex = nil

---@property readwrite CS.Spine.DeformTimeline.Attachment : CS.Spine.VertexAttachment
CS.Spine.DeformTimeline.Attachment = nil

---@property readwrite CS.Spine.DeformTimeline.Frames : CS.System.Single[]
CS.Spine.DeformTimeline.Frames = nil

---@property readwrite CS.Spine.DeformTimeline.Vertices : CS.System.Single[][]
CS.Spine.DeformTimeline.Vertices = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.DeformTimeline
function CS.Spine.DeformTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param vertices : CS.System.Single[]
function CS.Spine.DeformTimeline:SetFrame(frameIndex, time, vertices)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.DeformTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
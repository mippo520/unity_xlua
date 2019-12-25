---@class CS.Spine.AttachmentTimeline : CS.System.Object
CS.Spine.AttachmentTimeline = {}

---@property readonly CS.Spine.AttachmentTimeline.PropertyId : CS.System.Int32
CS.Spine.AttachmentTimeline.PropertyId = nil

---@property readonly CS.Spine.AttachmentTimeline.FrameCount : CS.System.Int32
CS.Spine.AttachmentTimeline.FrameCount = nil

---@property readwrite CS.Spine.AttachmentTimeline.SlotIndex : CS.System.Int32
CS.Spine.AttachmentTimeline.SlotIndex = nil

---@property readwrite CS.Spine.AttachmentTimeline.Frames : CS.System.Single[]
CS.Spine.AttachmentTimeline.Frames = nil

---@property readwrite CS.Spine.AttachmentTimeline.AttachmentNames : CS.System.String[]
CS.Spine.AttachmentTimeline.AttachmentNames = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.AttachmentTimeline
function CS.Spine.AttachmentTimeline(frameCount)
end

---@param frameIndex : CS.System.Int32
---@param time : CS.System.Single
---@param attachmentName : CS.System.String
function CS.Spine.AttachmentTimeline:SetFrame(frameIndex, time, attachmentName)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.AttachmentTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end
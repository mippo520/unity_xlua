---@class CS.Spine.CurveTimeline : CS.System.Object
CS.Spine.CurveTimeline = {}

---@property readonly CS.Spine.CurveTimeline.FrameCount : CS.System.Int32
CS.Spine.CurveTimeline.FrameCount = nil

---@property readonly CS.Spine.CurveTimeline.PropertyId : CS.System.Int32
CS.Spine.CurveTimeline.PropertyId = nil

---@param frameCount : CS.System.Int32
---@return CS.Spine.CurveTimeline
function CS.Spine.CurveTimeline(frameCount)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param firedEvents : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.CurveTimeline:Apply(skeleton, lastTime, time, firedEvents, alpha, blend, direction)
end

---@param frameIndex : CS.System.Int32
function CS.Spine.CurveTimeline:SetLinear(frameIndex)
end

---@param frameIndex : CS.System.Int32
function CS.Spine.CurveTimeline:SetStepped(frameIndex)
end

---@param frameIndex : CS.System.Int32
---@return CS.System.Single
function CS.Spine.CurveTimeline:GetCurveType(frameIndex)
end

---@param frameIndex : CS.System.Int32
---@param cx1 : CS.System.Single
---@param cy1 : CS.System.Single
---@param cx2 : CS.System.Single
---@param cy2 : CS.System.Single
function CS.Spine.CurveTimeline:SetCurve(frameIndex, cx1, cy1, cx2, cy2)
end

---@param frameIndex : CS.System.Int32
---@param percent : CS.System.Single
---@return CS.System.Single
function CS.Spine.CurveTimeline:GetCurvePercent(frameIndex, percent)
end
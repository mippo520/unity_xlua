---@class CS.Spine.AnimationStateData : CS.System.Object
CS.Spine.AnimationStateData = {}

---@property readonly CS.Spine.AnimationStateData.SkeletonData : CS.Spine.SkeletonData
CS.Spine.AnimationStateData.SkeletonData = nil

---@property readwrite CS.Spine.AnimationStateData.DefaultMix : CS.System.Single
CS.Spine.AnimationStateData.DefaultMix = nil

---@param skeletonData : CS.Spine.SkeletonData
---@return CS.Spine.AnimationStateData
function CS.Spine.AnimationStateData(skeletonData)
end

---@param fromName : CS.System.String
---@param toName : CS.System.String
---@param duration : CS.System.Single
function CS.Spine.AnimationStateData:SetMix(fromName, toName, duration)
end

---@param from : CS.Spine.Animation
---@param to : CS.Spine.Animation
---@param duration : CS.System.Single
function CS.Spine.AnimationStateData:SetMix(from, to, duration)
end

---@param from : CS.Spine.Animation
---@param to : CS.Spine.Animation
---@return CS.System.Single
function CS.Spine.AnimationStateData:GetMix(from, to)
end
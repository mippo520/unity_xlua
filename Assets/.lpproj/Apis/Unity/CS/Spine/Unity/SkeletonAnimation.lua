---@class CS.Spine.Unity.SkeletonAnimation : CS.Spine.Unity.SkeletonRenderer
CS.Spine.Unity.SkeletonAnimation = {}

---@field public CS.Spine.Unity.SkeletonAnimation.state : CS.Spine.AnimationState
CS.Spine.Unity.SkeletonAnimation.state = nil

---@field public CS.Spine.Unity.SkeletonAnimation.loop : CS.System.Boolean
CS.Spine.Unity.SkeletonAnimation.loop = nil

---@field public CS.Spine.Unity.SkeletonAnimation.timeScale : CS.System.Single
CS.Spine.Unity.SkeletonAnimation.timeScale = nil

---@property readonly CS.Spine.Unity.SkeletonAnimation.AnimationState : CS.Spine.AnimationState
CS.Spine.Unity.SkeletonAnimation.AnimationState = nil

---@property readwrite CS.Spine.Unity.SkeletonAnimation.AnimationName : CS.System.String
CS.Spine.Unity.SkeletonAnimation.AnimationName = nil

---@return CS.Spine.Unity.SkeletonAnimation
function CS.Spine.Unity.SkeletonAnimation()
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonAnimation:add_UpdateLocal(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonAnimation:remove_UpdateLocal(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonAnimation:add_UpdateWorld(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonAnimation:remove_UpdateWorld(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonAnimation:add_UpdateComplete(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonAnimation:remove_UpdateComplete(value)
end

---@param gameObject : CS.UnityEngine.GameObject
---@param skeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
---@return CS.Spine.Unity.SkeletonAnimation
function CS.Spine.Unity.SkeletonAnimation.AddToGameObject(gameObject, skeletonDataAsset)
end

---@param skeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
---@return CS.Spine.Unity.SkeletonAnimation
function CS.Spine.Unity.SkeletonAnimation.NewSkeletonAnimationGameObject(skeletonDataAsset)
end

function CS.Spine.Unity.SkeletonAnimation:ClearState()
end

---@param overwrite : CS.System.Boolean
function CS.Spine.Unity.SkeletonAnimation:Initialize(overwrite)
end

---@param deltaTime : CS.System.Single
function CS.Spine.Unity.SkeletonAnimation:Update(deltaTime)
end
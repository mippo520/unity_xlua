---@module CS.Spine.Unity
CS.Spine.Unity = {}

---@class CS.Spine.Unity.AnimationReferenceAsset : CS.UnityEngine.ScriptableObject
CS.Spine.Unity.AnimationReferenceAsset = {}

---@property readonly CS.Spine.Unity.AnimationReferenceAsset.SkeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
CS.Spine.Unity.AnimationReferenceAsset.SkeletonDataAsset = nil

---@property readonly CS.Spine.Unity.AnimationReferenceAsset.Animation : CS.Spine.Animation
CS.Spine.Unity.AnimationReferenceAsset.Animation = nil

---@return CS.Spine.Unity.AnimationReferenceAsset
function CS.Spine.Unity.AnimationReferenceAsset()
end

function CS.Spine.Unity.AnimationReferenceAsset:Initialize()
end

---@param asset : CS.Spine.Unity.AnimationReferenceAsset
---@return CS.Spine.Animation
function CS.Spine.Unity.AnimationReferenceAsset.op_Implicit(asset)
end
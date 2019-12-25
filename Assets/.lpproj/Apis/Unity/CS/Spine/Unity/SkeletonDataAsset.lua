---@class CS.Spine.Unity.SkeletonDataAsset : CS.UnityEngine.ScriptableObject
CS.Spine.Unity.SkeletonDataAsset = {}

---@field public CS.Spine.Unity.SkeletonDataAsset.atlasAssets : CS.Spine.Unity.AtlasAssetBase[]
CS.Spine.Unity.SkeletonDataAsset.atlasAssets = nil

---@field public CS.Spine.Unity.SkeletonDataAsset.scale : CS.System.Single
CS.Spine.Unity.SkeletonDataAsset.scale = nil

---@field public CS.Spine.Unity.SkeletonDataAsset.skeletonJSON : CS.UnityEngine.TextAsset
CS.Spine.Unity.SkeletonDataAsset.skeletonJSON = nil

---@field public CS.Spine.Unity.SkeletonDataAsset.skeletonDataModifiers : CS.System.Collections.Generic.List
CS.Spine.Unity.SkeletonDataAsset.skeletonDataModifiers = nil

---@field public CS.Spine.Unity.SkeletonDataAsset.fromAnimation : CS.System.String[]
CS.Spine.Unity.SkeletonDataAsset.fromAnimation = nil

---@field public CS.Spine.Unity.SkeletonDataAsset.toAnimation : CS.System.String[]
CS.Spine.Unity.SkeletonDataAsset.toAnimation = nil

---@field public CS.Spine.Unity.SkeletonDataAsset.duration : CS.System.Single[]
CS.Spine.Unity.SkeletonDataAsset.duration = nil

---@field public CS.Spine.Unity.SkeletonDataAsset.defaultMix : CS.System.Single
CS.Spine.Unity.SkeletonDataAsset.defaultMix = nil

---@field public CS.Spine.Unity.SkeletonDataAsset.controller : CS.UnityEngine.RuntimeAnimatorController
CS.Spine.Unity.SkeletonDataAsset.controller = nil

---@property readonly CS.Spine.Unity.SkeletonDataAsset.IsLoaded : CS.System.Boolean
CS.Spine.Unity.SkeletonDataAsset.IsLoaded = nil

---@return CS.Spine.Unity.SkeletonDataAsset
function CS.Spine.Unity.SkeletonDataAsset()
end

---@param skeletonDataFile : CS.UnityEngine.TextAsset
---@param atlasAsset : CS.Spine.Unity.AtlasAssetBase
---@param initialize : CS.System.Boolean
---@param scale : CS.System.Single
---@return CS.Spine.Unity.SkeletonDataAsset
function CS.Spine.Unity.SkeletonDataAsset.CreateRuntimeInstance(skeletonDataFile, atlasAsset, initialize, scale)
end

---@param skeletonDataFile : CS.UnityEngine.TextAsset
---@param atlasAssets : CS.Spine.Unity.AtlasAssetBase[]
---@param initialize : CS.System.Boolean
---@param scale : CS.System.Single
---@return CS.Spine.Unity.SkeletonDataAsset
function CS.Spine.Unity.SkeletonDataAsset.CreateRuntimeInstance(skeletonDataFile, atlasAssets, initialize, scale)
end

function CS.Spine.Unity.SkeletonDataAsset:Clear()
end

---@return CS.Spine.AnimationStateData
function CS.Spine.Unity.SkeletonDataAsset:GetAnimationStateData()
end

---@param quiet : CS.System.Boolean
---@return CS.Spine.SkeletonData
function CS.Spine.Unity.SkeletonDataAsset:GetSkeletonData(quiet)
end

function CS.Spine.Unity.SkeletonDataAsset:FillStateData()
end
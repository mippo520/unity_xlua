---@class CS.Spine.Unity.SpineBone : CS.Spine.Unity.SpineAttributeBase
CS.Spine.Unity.SpineBone = {}

---@param startsWith : CS.System.String
---@param dataField : CS.System.String
---@param includeNone : CS.System.Boolean
---@param fallbackToTextField : CS.System.Boolean
---@return CS.Spine.Unity.SpineBone
function CS.Spine.Unity.SpineBone(startsWith, dataField, includeNone, fallbackToTextField)
end

---@param boneName : CS.System.String
---@param renderer : CS.Spine.Unity.SkeletonRenderer
---@return CS.Spine.Bone
function CS.Spine.Unity.SpineBone.GetBone(boneName, renderer)
end

---@param boneName : CS.System.String
---@param skeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
---@return CS.Spine.BoneData
function CS.Spine.Unity.SpineBone.GetBoneData(boneName, skeletonDataAsset)
end
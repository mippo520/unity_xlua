---@class CS.Spine.Unity.SkeletonUtilityBone : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.SkeletonUtilityBone = {}

---@field public CS.Spine.Unity.SkeletonUtilityBone.boneName : CS.System.String
CS.Spine.Unity.SkeletonUtilityBone.boneName = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.parentReference : CS.UnityEngine.Transform
CS.Spine.Unity.SkeletonUtilityBone.parentReference = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.mode : CS.Spine.Unity.Mode
CS.Spine.Unity.SkeletonUtilityBone.mode = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.position : CS.System.Boolean
CS.Spine.Unity.SkeletonUtilityBone.position = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.rotation : CS.System.Boolean
CS.Spine.Unity.SkeletonUtilityBone.rotation = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.scale : CS.System.Boolean
CS.Spine.Unity.SkeletonUtilityBone.scale = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.zPosition : CS.System.Boolean
CS.Spine.Unity.SkeletonUtilityBone.zPosition = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.overrideAlpha : CS.System.Single
CS.Spine.Unity.SkeletonUtilityBone.overrideAlpha = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.hierarchy : CS.Spine.Unity.SkeletonUtility
CS.Spine.Unity.SkeletonUtilityBone.hierarchy = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.bone : CS.Spine.Bone
CS.Spine.Unity.SkeletonUtilityBone.bone = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.transformLerpComplete : CS.System.Boolean
CS.Spine.Unity.SkeletonUtilityBone.transformLerpComplete = nil

---@field public CS.Spine.Unity.SkeletonUtilityBone.valid : CS.System.Boolean
CS.Spine.Unity.SkeletonUtilityBone.valid = nil

---@property readonly CS.Spine.Unity.SkeletonUtilityBone.IncompatibleTransformMode : CS.System.Boolean
CS.Spine.Unity.SkeletonUtilityBone.IncompatibleTransformMode = nil

---@return CS.Spine.Unity.SkeletonUtilityBone
function CS.Spine.Unity.SkeletonUtilityBone()
end

function CS.Spine.Unity.SkeletonUtilityBone:Reset()
end

---@param phase : CS.Spine.Unity.UpdatePhase
function CS.Spine.Unity.SkeletonUtilityBone:DoUpdate(phase)
end

---@param bone : CS.Spine.Bone
---@return CS.System.Boolean
function CS.Spine.Unity.SkeletonUtilityBone.BoneTransformModeIncompatible(bone)
end

---@param skinName : CS.System.String
---@param slotName : CS.System.String
---@param attachmentName : CS.System.String
function CS.Spine.Unity.SkeletonUtilityBone:AddBoundingBox(skinName, slotName, attachmentName)
end
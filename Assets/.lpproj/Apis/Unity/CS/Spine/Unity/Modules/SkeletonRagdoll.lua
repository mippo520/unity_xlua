---@class CS.Spine.Unity.Modules.SkeletonRagdoll : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.Modules.SkeletonRagdoll = {}

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.startingBoneName : CS.System.String
CS.Spine.Unity.Modules.SkeletonRagdoll.startingBoneName = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.stopBoneNames : CS.System.Collections.Generic.List
CS.Spine.Unity.Modules.SkeletonRagdoll.stopBoneNames = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.applyOnStart : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll.applyOnStart = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.disableIK : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll.disableIK = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.disableOtherConstraints : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll.disableOtherConstraints = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.pinStartBone : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll.pinStartBone = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.enableJointCollision : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll.enableJointCollision = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.useGravity : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll.useGravity = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.thickness : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll.thickness = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.rotationLimit : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll.rotationLimit = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.rootMass : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll.rootMass = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.massFalloffFactor : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll.massFalloffFactor = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.colliderLayer : CS.System.Int32
CS.Spine.Unity.Modules.SkeletonRagdoll.colliderLayer = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll.mix : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll.mix = nil

---@property readwrite CS.Spine.Unity.Modules.SkeletonRagdoll.RootRigidbody : CS.UnityEngine.Rigidbody
CS.Spine.Unity.Modules.SkeletonRagdoll.RootRigidbody = nil

---@property readwrite CS.Spine.Unity.Modules.SkeletonRagdoll.StartingBone : CS.Spine.Bone
CS.Spine.Unity.Modules.SkeletonRagdoll.StartingBone = nil

---@property readonly CS.Spine.Unity.Modules.SkeletonRagdoll.RootOffset : CS.UnityEngine.Vector3
CS.Spine.Unity.Modules.SkeletonRagdoll.RootOffset = nil

---@property readonly CS.Spine.Unity.Modules.SkeletonRagdoll.IsActive : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll.IsActive = nil

---@property readonly CS.Spine.Unity.Modules.SkeletonRagdoll.RigidbodyArray : CS.UnityEngine.Rigidbody[]
CS.Spine.Unity.Modules.SkeletonRagdoll.RigidbodyArray = nil

---@property readonly CS.Spine.Unity.Modules.SkeletonRagdoll.EstimatedSkeletonPosition : CS.UnityEngine.Vector3
CS.Spine.Unity.Modules.SkeletonRagdoll.EstimatedSkeletonPosition = nil

---@return CS.Spine.Unity.Modules.SkeletonRagdoll
function CS.Spine.Unity.Modules.SkeletonRagdoll()
end

function CS.Spine.Unity.Modules.SkeletonRagdoll:Apply()
end

---@param target : CS.System.Single
---@param duration : CS.System.Single
---@return CS.UnityEngine.Coroutine
function CS.Spine.Unity.Modules.SkeletonRagdoll:SmoothMix(target, duration)
end

---@param worldPosition : CS.UnityEngine.Vector3
function CS.Spine.Unity.Modules.SkeletonRagdoll:SetSkeletonPosition(worldPosition)
end

function CS.Spine.Unity.Modules.SkeletonRagdoll:Remove()
end

---@param boneName : CS.System.String
---@return CS.UnityEngine.Rigidbody
function CS.Spine.Unity.Modules.SkeletonRagdoll:GetRigidbody(boneName)
end
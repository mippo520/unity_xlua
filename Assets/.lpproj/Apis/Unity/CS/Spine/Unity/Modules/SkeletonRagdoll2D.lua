---@class CS.Spine.Unity.Modules.SkeletonRagdoll2D : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.Modules.SkeletonRagdoll2D = {}

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.startingBoneName : CS.System.String
CS.Spine.Unity.Modules.SkeletonRagdoll2D.startingBoneName = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.stopBoneNames : CS.System.Collections.Generic.List
CS.Spine.Unity.Modules.SkeletonRagdoll2D.stopBoneNames = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.applyOnStart : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll2D.applyOnStart = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.disableIK : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll2D.disableIK = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.disableOtherConstraints : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll2D.disableOtherConstraints = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.pinStartBone : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll2D.pinStartBone = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.gravityScale : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll2D.gravityScale = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.thickness : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll2D.thickness = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.rotationLimit : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll2D.rotationLimit = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.rootMass : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll2D.rootMass = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.massFalloffFactor : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll2D.massFalloffFactor = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.colliderLayer : CS.System.Int32
CS.Spine.Unity.Modules.SkeletonRagdoll2D.colliderLayer = nil

---@field public CS.Spine.Unity.Modules.SkeletonRagdoll2D.mix : CS.System.Single
CS.Spine.Unity.Modules.SkeletonRagdoll2D.mix = nil

---@property readwrite CS.Spine.Unity.Modules.SkeletonRagdoll2D.RootRigidbody : CS.UnityEngine.Rigidbody2D
CS.Spine.Unity.Modules.SkeletonRagdoll2D.RootRigidbody = nil

---@property readwrite CS.Spine.Unity.Modules.SkeletonRagdoll2D.StartingBone : CS.Spine.Bone
CS.Spine.Unity.Modules.SkeletonRagdoll2D.StartingBone = nil

---@property readonly CS.Spine.Unity.Modules.SkeletonRagdoll2D.RootOffset : CS.UnityEngine.Vector3
CS.Spine.Unity.Modules.SkeletonRagdoll2D.RootOffset = nil

---@property readonly CS.Spine.Unity.Modules.SkeletonRagdoll2D.IsActive : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRagdoll2D.IsActive = nil

---@property readonly CS.Spine.Unity.Modules.SkeletonRagdoll2D.RigidbodyArray : CS.UnityEngine.Rigidbody2D[]
CS.Spine.Unity.Modules.SkeletonRagdoll2D.RigidbodyArray = nil

---@property readonly CS.Spine.Unity.Modules.SkeletonRagdoll2D.EstimatedSkeletonPosition : CS.UnityEngine.Vector3
CS.Spine.Unity.Modules.SkeletonRagdoll2D.EstimatedSkeletonPosition = nil

---@return CS.Spine.Unity.Modules.SkeletonRagdoll2D
function CS.Spine.Unity.Modules.SkeletonRagdoll2D()
end

function CS.Spine.Unity.Modules.SkeletonRagdoll2D:Apply()
end

---@param target : CS.System.Single
---@param duration : CS.System.Single
---@return CS.UnityEngine.Coroutine
function CS.Spine.Unity.Modules.SkeletonRagdoll2D:SmoothMix(target, duration)
end

---@param worldPosition : CS.UnityEngine.Vector3
function CS.Spine.Unity.Modules.SkeletonRagdoll2D:SetSkeletonPosition(worldPosition)
end

function CS.Spine.Unity.Modules.SkeletonRagdoll2D:Remove()
end

---@param boneName : CS.System.String
---@return CS.UnityEngine.Rigidbody2D
function CS.Spine.Unity.Modules.SkeletonRagdoll2D:GetRigidbody(boneName)
end
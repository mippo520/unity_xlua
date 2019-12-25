---@class CS.Spine.Unity.BoneFollower : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.BoneFollower = {}

---@field public CS.Spine.Unity.BoneFollower.skeletonRenderer : CS.Spine.Unity.SkeletonRenderer
CS.Spine.Unity.BoneFollower.skeletonRenderer = nil

---@field public CS.Spine.Unity.BoneFollower.boneName : CS.System.String
CS.Spine.Unity.BoneFollower.boneName = nil

---@field public CS.Spine.Unity.BoneFollower.followZPosition : CS.System.Boolean
CS.Spine.Unity.BoneFollower.followZPosition = nil

---@field public CS.Spine.Unity.BoneFollower.followBoneRotation : CS.System.Boolean
CS.Spine.Unity.BoneFollower.followBoneRotation = nil

---@field public CS.Spine.Unity.BoneFollower.followSkeletonFlip : CS.System.Boolean
CS.Spine.Unity.BoneFollower.followSkeletonFlip = nil

---@field public CS.Spine.Unity.BoneFollower.followLocalScale : CS.System.Boolean
CS.Spine.Unity.BoneFollower.followLocalScale = nil

---@field public CS.Spine.Unity.BoneFollower.initializeOnAwake : CS.System.Boolean
CS.Spine.Unity.BoneFollower.initializeOnAwake = nil

---@field public CS.Spine.Unity.BoneFollower.valid : CS.System.Boolean
CS.Spine.Unity.BoneFollower.valid = nil

---@field public CS.Spine.Unity.BoneFollower.bone : CS.Spine.Bone
CS.Spine.Unity.BoneFollower.bone = nil

---@property readwrite CS.Spine.Unity.BoneFollower.SkeletonRenderer : CS.Spine.Unity.SkeletonRenderer
CS.Spine.Unity.BoneFollower.SkeletonRenderer = nil

---@return CS.Spine.Unity.BoneFollower
function CS.Spine.Unity.BoneFollower()
end

---@param name : CS.System.String
---@return CS.System.Boolean
function CS.Spine.Unity.BoneFollower:SetBone(name)
end

function CS.Spine.Unity.BoneFollower:Awake()
end

---@param skeletonRenderer : CS.Spine.Unity.SkeletonRenderer
function CS.Spine.Unity.BoneFollower:HandleRebuildRenderer(skeletonRenderer)
end

function CS.Spine.Unity.BoneFollower:Initialize()
end

function CS.Spine.Unity.BoneFollower:LateUpdate()
end
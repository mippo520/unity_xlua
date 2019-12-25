---@class CS.Spine.Unity.BoneFollowerGraphic : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.BoneFollowerGraphic = {}

---@field public CS.Spine.Unity.BoneFollowerGraphic.skeletonGraphic : CS.Spine.Unity.SkeletonGraphic
CS.Spine.Unity.BoneFollowerGraphic.skeletonGraphic = nil

---@field public CS.Spine.Unity.BoneFollowerGraphic.initializeOnAwake : CS.System.Boolean
CS.Spine.Unity.BoneFollowerGraphic.initializeOnAwake = nil

---@field public CS.Spine.Unity.BoneFollowerGraphic.boneName : CS.System.String
CS.Spine.Unity.BoneFollowerGraphic.boneName = nil

---@field public CS.Spine.Unity.BoneFollowerGraphic.followBoneRotation : CS.System.Boolean
CS.Spine.Unity.BoneFollowerGraphic.followBoneRotation = nil

---@field public CS.Spine.Unity.BoneFollowerGraphic.followSkeletonFlip : CS.System.Boolean
CS.Spine.Unity.BoneFollowerGraphic.followSkeletonFlip = nil

---@field public CS.Spine.Unity.BoneFollowerGraphic.followLocalScale : CS.System.Boolean
CS.Spine.Unity.BoneFollowerGraphic.followLocalScale = nil

---@field public CS.Spine.Unity.BoneFollowerGraphic.followZPosition : CS.System.Boolean
CS.Spine.Unity.BoneFollowerGraphic.followZPosition = nil

---@field public CS.Spine.Unity.BoneFollowerGraphic.bone : CS.Spine.Bone
CS.Spine.Unity.BoneFollowerGraphic.bone = nil

---@field public CS.Spine.Unity.BoneFollowerGraphic.valid : CS.System.Boolean
CS.Spine.Unity.BoneFollowerGraphic.valid = nil

---@property readwrite CS.Spine.Unity.BoneFollowerGraphic.SkeletonGraphic : CS.Spine.Unity.SkeletonGraphic
CS.Spine.Unity.BoneFollowerGraphic.SkeletonGraphic = nil

---@return CS.Spine.Unity.BoneFollowerGraphic
function CS.Spine.Unity.BoneFollowerGraphic()
end

---@param name : CS.System.String
---@return CS.System.Boolean
function CS.Spine.Unity.BoneFollowerGraphic:SetBone(name)
end

function CS.Spine.Unity.BoneFollowerGraphic:Awake()
end

function CS.Spine.Unity.BoneFollowerGraphic:Initialize()
end

function CS.Spine.Unity.BoneFollowerGraphic:LateUpdate()
end
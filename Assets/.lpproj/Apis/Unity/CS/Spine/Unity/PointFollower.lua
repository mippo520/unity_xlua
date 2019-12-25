---@class CS.Spine.Unity.PointFollower : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.PointFollower = {}

---@field public CS.Spine.Unity.PointFollower.skeletonRenderer : CS.Spine.Unity.SkeletonRenderer
CS.Spine.Unity.PointFollower.skeletonRenderer = nil

---@field public CS.Spine.Unity.PointFollower.slotName : CS.System.String
CS.Spine.Unity.PointFollower.slotName = nil

---@field public CS.Spine.Unity.PointFollower.pointAttachmentName : CS.System.String
CS.Spine.Unity.PointFollower.pointAttachmentName = nil

---@field public CS.Spine.Unity.PointFollower.followRotation : CS.System.Boolean
CS.Spine.Unity.PointFollower.followRotation = nil

---@field public CS.Spine.Unity.PointFollower.followSkeletonFlip : CS.System.Boolean
CS.Spine.Unity.PointFollower.followSkeletonFlip = nil

---@field public CS.Spine.Unity.PointFollower.followSkeletonZPosition : CS.System.Boolean
CS.Spine.Unity.PointFollower.followSkeletonZPosition = nil

---@property readonly CS.Spine.Unity.PointFollower.SkeletonRenderer : CS.Spine.Unity.SkeletonRenderer
CS.Spine.Unity.PointFollower.SkeletonRenderer = nil

---@property readonly CS.Spine.Unity.PointFollower.SkeletonComponent : CS.Spine.Unity.ISkeletonComponent
CS.Spine.Unity.PointFollower.SkeletonComponent = nil

---@property readonly CS.Spine.Unity.PointFollower.IsValid : CS.System.Boolean
CS.Spine.Unity.PointFollower.IsValid = nil

---@return CS.Spine.Unity.PointFollower
function CS.Spine.Unity.PointFollower()
end

function CS.Spine.Unity.PointFollower:Initialize()
end

function CS.Spine.Unity.PointFollower:LateUpdate()
end
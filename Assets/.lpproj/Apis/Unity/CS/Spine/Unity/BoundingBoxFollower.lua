---@class CS.Spine.Unity.BoundingBoxFollower : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.BoundingBoxFollower = {}

---@field public CS.Spine.Unity.BoundingBoxFollower.skeletonRenderer : CS.Spine.Unity.SkeletonRenderer
CS.Spine.Unity.BoundingBoxFollower.skeletonRenderer = nil

---@field public CS.Spine.Unity.BoundingBoxFollower.slotName : CS.System.String
CS.Spine.Unity.BoundingBoxFollower.slotName = nil

---@field public CS.Spine.Unity.BoundingBoxFollower.isTrigger : CS.System.Boolean
CS.Spine.Unity.BoundingBoxFollower.isTrigger = nil

---@field public CS.Spine.Unity.BoundingBoxFollower.clearStateOnDisable : CS.System.Boolean
CS.Spine.Unity.BoundingBoxFollower.clearStateOnDisable = nil

---@field public CS.Spine.Unity.BoundingBoxFollower.colliderTable : CS.System.Collections.Generic.Dictionary
CS.Spine.Unity.BoundingBoxFollower.colliderTable = nil

---@field public CS.Spine.Unity.BoundingBoxFollower.nameTable : CS.System.Collections.Generic.Dictionary
CS.Spine.Unity.BoundingBoxFollower.nameTable = nil

---@property readonly CS.Spine.Unity.BoundingBoxFollower.Slot : CS.Spine.Slot
CS.Spine.Unity.BoundingBoxFollower.Slot = nil

---@property readonly CS.Spine.Unity.BoundingBoxFollower.CurrentAttachment : CS.Spine.BoundingBoxAttachment
CS.Spine.Unity.BoundingBoxFollower.CurrentAttachment = nil

---@property readonly CS.Spine.Unity.BoundingBoxFollower.CurrentAttachmentName : CS.System.String
CS.Spine.Unity.BoundingBoxFollower.CurrentAttachmentName = nil

---@property readonly CS.Spine.Unity.BoundingBoxFollower.CurrentCollider : CS.UnityEngine.PolygonCollider2D
CS.Spine.Unity.BoundingBoxFollower.CurrentCollider = nil

---@property readonly CS.Spine.Unity.BoundingBoxFollower.IsTrigger : CS.System.Boolean
CS.Spine.Unity.BoundingBoxFollower.IsTrigger = nil

---@return CS.Spine.Unity.BoundingBoxFollower
function CS.Spine.Unity.BoundingBoxFollower()
end

---@param overwrite : CS.System.Boolean
function CS.Spine.Unity.BoundingBoxFollower:Initialize(overwrite)
end

function CS.Spine.Unity.BoundingBoxFollower:ClearState()
end
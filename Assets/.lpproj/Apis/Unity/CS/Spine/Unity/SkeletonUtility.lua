---@class CS.Spine.Unity.SkeletonUtility : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.SkeletonUtility = {}

---@field public CS.Spine.Unity.SkeletonUtility.boneRoot : CS.UnityEngine.Transform
CS.Spine.Unity.SkeletonUtility.boneRoot = nil

---@field public CS.Spine.Unity.SkeletonUtility.skeletonRenderer : CS.Spine.Unity.SkeletonRenderer
CS.Spine.Unity.SkeletonUtility.skeletonRenderer = nil

---@field public CS.Spine.Unity.SkeletonUtility.skeletonAnimation : CS.Spine.Unity.ISkeletonAnimation
CS.Spine.Unity.SkeletonUtility.skeletonAnimation = nil

---@field public CS.Spine.Unity.SkeletonUtility.boneComponents : CS.System.Collections.Generic.List
CS.Spine.Unity.SkeletonUtility.boneComponents = nil

---@field public CS.Spine.Unity.SkeletonUtility.constraintComponents : CS.System.Collections.Generic.List
CS.Spine.Unity.SkeletonUtility.constraintComponents = nil

---@return CS.Spine.Unity.SkeletonUtility
function CS.Spine.Unity.SkeletonUtility()
end

---@param skeleton : CS.Spine.Skeleton
---@param skinName : CS.System.String
---@param slotName : CS.System.String
---@param attachmentName : CS.System.String
---@param parent : CS.UnityEngine.Transform
---@param isTrigger : CS.System.Boolean
---@return CS.UnityEngine.PolygonCollider2D
function CS.Spine.Unity.SkeletonUtility.AddBoundingBoxGameObject(skeleton, skinName, slotName, attachmentName, parent, isTrigger)
end

---@param name : CS.System.String
---@param box : CS.Spine.BoundingBoxAttachment
---@param slot : CS.Spine.Slot
---@param parent : CS.UnityEngine.Transform
---@param isTrigger : CS.System.Boolean
---@return CS.UnityEngine.PolygonCollider2D
function CS.Spine.Unity.SkeletonUtility.AddBoundingBoxGameObject(name, box, slot, parent, isTrigger)
end

---@param box : CS.Spine.BoundingBoxAttachment
---@param slot : CS.Spine.Slot
---@param gameObject : CS.UnityEngine.GameObject
---@param isTrigger : CS.System.Boolean
---@return CS.UnityEngine.PolygonCollider2D
function CS.Spine.Unity.SkeletonUtility.AddBoundingBoxAsComponent(box, slot, gameObject, isTrigger)
end

---@param collider : CS.UnityEngine.PolygonCollider2D
---@param slot : CS.Spine.Slot
---@param box : CS.Spine.BoundingBoxAttachment
function CS.Spine.Unity.SkeletonUtility.SetColliderPointsLocal(collider, slot, box)
end

---@param boundingBox : CS.Spine.BoundingBoxAttachment
---@param depth : CS.System.Single
---@return CS.UnityEngine.Bounds
function CS.Spine.Unity.SkeletonUtility.GetBoundingBoxBounds(boundingBox, depth)
end

---@param gameObject : CS.UnityEngine.GameObject
---@param isKinematic : CS.System.Boolean
---@param gravityScale : CS.System.Single
---@return CS.UnityEngine.Rigidbody2D
function CS.Spine.Unity.SkeletonUtility.AddBoneRigidbody2D(gameObject, isKinematic, gravityScale)
end

---@param value : CS.Spine.Unity.SkeletonUtilityDelegate
function CS.Spine.Unity.SkeletonUtility:add_OnReset(value)
end

---@param value : CS.Spine.Unity.SkeletonUtilityDelegate
function CS.Spine.Unity.SkeletonUtility:remove_OnReset(value)
end

function CS.Spine.Unity.SkeletonUtility:ResubscribeEvents()
end

---@param bone : CS.Spine.Unity.SkeletonUtilityBone
function CS.Spine.Unity.SkeletonUtility:RegisterBone(bone)
end

---@param bone : CS.Spine.Unity.SkeletonUtilityBone
function CS.Spine.Unity.SkeletonUtility:UnregisterBone(bone)
end

---@param constraint : CS.Spine.Unity.SkeletonUtilityConstraint
function CS.Spine.Unity.SkeletonUtility:RegisterConstraint(constraint)
end

---@param constraint : CS.Spine.Unity.SkeletonUtilityConstraint
function CS.Spine.Unity.SkeletonUtility:UnregisterConstraint(constraint)
end

function CS.Spine.Unity.SkeletonUtility:CollectBones()
end

---@return CS.UnityEngine.Transform
function CS.Spine.Unity.SkeletonUtility:GetBoneRoot()
end

---@param mode : CS.Spine.Unity.Mode
---@param pos : CS.System.Boolean
---@param rot : CS.System.Boolean
---@param sca : CS.System.Boolean
---@return CS.UnityEngine.GameObject
function CS.Spine.Unity.SkeletonUtility:SpawnRoot(mode, pos, rot, sca)
end

---@param mode : CS.Spine.Unity.Mode
---@param pos : CS.System.Boolean
---@param rot : CS.System.Boolean
---@param sca : CS.System.Boolean
---@return CS.UnityEngine.GameObject
function CS.Spine.Unity.SkeletonUtility:SpawnHierarchy(mode, pos, rot, sca)
end

---@param bone : CS.Spine.Bone
---@param parent : CS.UnityEngine.Transform
---@param mode : CS.Spine.Unity.Mode
---@param pos : CS.System.Boolean
---@param rot : CS.System.Boolean
---@param sca : CS.System.Boolean
---@return CS.UnityEngine.GameObject
function CS.Spine.Unity.SkeletonUtility:SpawnBoneRecursively(bone, parent, mode, pos, rot, sca)
end

---@param bone : CS.Spine.Bone
---@param parent : CS.UnityEngine.Transform
---@param mode : CS.Spine.Unity.Mode
---@param pos : CS.System.Boolean
---@param rot : CS.System.Boolean
---@param sca : CS.System.Boolean
---@return CS.UnityEngine.GameObject
function CS.Spine.Unity.SkeletonUtility:SpawnBone(bone, parent, mode, pos, rot, sca)
end
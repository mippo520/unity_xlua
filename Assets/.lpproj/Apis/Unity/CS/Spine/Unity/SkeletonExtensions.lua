---@class CS.Spine.Unity.SkeletonExtensions : CS.System.Object
CS.Spine.Unity.SkeletonExtensions = {}

---@param s : CS.Spine.Skeleton
---@return CS.UnityEngine.Color
function CS.Spine.Unity.SkeletonExtensions.GetColor(s)
end

---@param a : CS.Spine.RegionAttachment
---@return CS.UnityEngine.Color
function CS.Spine.Unity.SkeletonExtensions.GetColor(a)
end

---@param a : CS.Spine.MeshAttachment
---@return CS.UnityEngine.Color
function CS.Spine.Unity.SkeletonExtensions.GetColor(a)
end

---@param s : CS.Spine.Slot
---@return CS.UnityEngine.Color
function CS.Spine.Unity.SkeletonExtensions.GetColor(s)
end

---@param s : CS.Spine.Slot
---@return CS.UnityEngine.Color
function CS.Spine.Unity.SkeletonExtensions.GetColorTintBlack(s)
end

---@param skeleton : CS.Spine.Skeleton
---@param color : CS.UnityEngine.Color
function CS.Spine.Unity.SkeletonExtensions.SetColor(skeleton, color)
end

---@param skeleton : CS.Spine.Skeleton
---@param color : CS.UnityEngine.Color32
function CS.Spine.Unity.SkeletonExtensions.SetColor(skeleton, color)
end

---@param slot : CS.Spine.Slot
---@param color : CS.UnityEngine.Color
function CS.Spine.Unity.SkeletonExtensions.SetColor(slot, color)
end

---@param slot : CS.Spine.Slot
---@param color : CS.UnityEngine.Color32
function CS.Spine.Unity.SkeletonExtensions.SetColor(slot, color)
end

---@param attachment : CS.Spine.RegionAttachment
---@param color : CS.UnityEngine.Color
function CS.Spine.Unity.SkeletonExtensions.SetColor(attachment, color)
end

---@param attachment : CS.Spine.RegionAttachment
---@param color : CS.UnityEngine.Color32
function CS.Spine.Unity.SkeletonExtensions.SetColor(attachment, color)
end

---@param attachment : CS.Spine.MeshAttachment
---@param color : CS.UnityEngine.Color
function CS.Spine.Unity.SkeletonExtensions.SetColor(attachment, color)
end

---@param attachment : CS.Spine.MeshAttachment
---@param color : CS.UnityEngine.Color32
function CS.Spine.Unity.SkeletonExtensions.SetColor(attachment, color)
end

---@param skeleton : CS.Spine.Skeleton
---@param scale : CS.UnityEngine.Vector2
function CS.Spine.Unity.SkeletonExtensions.SetLocalScale(skeleton, scale)
end

---@param bone : CS.Spine.Bone
---@return CS.UnityEngine.Matrix4x4
function CS.Spine.Unity.SkeletonExtensions.GetMatrix4x4(bone)
end

---@param bone : CS.Spine.Bone
---@param position : CS.UnityEngine.Vector2
function CS.Spine.Unity.SkeletonExtensions.SetLocalPosition(bone, position)
end

---@param bone : CS.Spine.Bone
---@param position : CS.UnityEngine.Vector3
function CS.Spine.Unity.SkeletonExtensions.SetLocalPosition(bone, position)
end

---@param bone : CS.Spine.Bone
---@return CS.UnityEngine.Vector2
function CS.Spine.Unity.SkeletonExtensions.GetLocalPosition(bone)
end

---@param bone : CS.Spine.Bone
---@return CS.UnityEngine.Vector2
function CS.Spine.Unity.SkeletonExtensions.GetSkeletonSpacePosition(bone)
end

---@param bone : CS.Spine.Bone
---@param boneLocal : CS.UnityEngine.Vector2
---@return CS.UnityEngine.Vector2
function CS.Spine.Unity.SkeletonExtensions.GetSkeletonSpacePosition(bone, boneLocal)
end

---@param bone : CS.Spine.Bone
---@param spineGameObjectTransform : CS.UnityEngine.Transform
---@return CS.UnityEngine.Vector3
function CS.Spine.Unity.SkeletonExtensions.GetWorldPosition(bone, spineGameObjectTransform)
end

---@param bone : CS.Spine.Bone
---@param spineGameObjectTransform : CS.UnityEngine.Transform
---@param positionScale : CS.System.Single
---@return CS.UnityEngine.Vector3
function CS.Spine.Unity.SkeletonExtensions.GetWorldPosition(bone, spineGameObjectTransform, positionScale)
end

---@param bone : CS.Spine.Bone
---@return CS.UnityEngine.Quaternion
function CS.Spine.Unity.SkeletonExtensions.GetQuaternion(bone)
end

---@param bone : CS.Spine.Bone
---@return CS.UnityEngine.Quaternion
function CS.Spine.Unity.SkeletonExtensions.GetLocalQuaternion(bone)
end

---@param skeleton : CS.Spine.Skeleton
---@return CS.UnityEngine.Vector2
function CS.Spine.Unity.SkeletonExtensions.GetLocalScale(skeleton)
end

---@param bone : CS.Spine.Bone
---@param ia : CS.System.Single
---@param ib : CS.System.Single
---@param ic : CS.System.Single
---@param id : CS.System.Single
function CS.Spine.Unity.SkeletonExtensions.GetWorldToLocalMatrix(bone, ia, ib, ic, id)
end

---@param bone : CS.Spine.Bone
---@param worldPosition : CS.UnityEngine.Vector2
---@return CS.UnityEngine.Vector2
function CS.Spine.Unity.SkeletonExtensions.WorldToLocal(bone, worldPosition)
end

---@param bone : CS.Spine.Bone
---@param skeletonSpacePosition : CS.UnityEngine.Vector2
---@return CS.UnityEngine.Vector2
function CS.Spine.Unity.SkeletonExtensions.SetPositionSkeletonSpace(bone, skeletonSpacePosition)
end

---@param a : CS.Spine.Attachment
---@return CS.UnityEngine.Material
function CS.Spine.Unity.SkeletonExtensions.GetMaterial(a)
end

---@param va : CS.Spine.VertexAttachment
---@param slot : CS.Spine.Slot
---@param buffer : CS.UnityEngine.Vector2[]
---@return CS.UnityEngine.Vector2[]
function CS.Spine.Unity.SkeletonExtensions.GetLocalVertices(va, slot, buffer)
end

---@param a : CS.Spine.VertexAttachment
---@param slot : CS.Spine.Slot
---@param buffer : CS.UnityEngine.Vector2[]
---@return CS.UnityEngine.Vector2[]
function CS.Spine.Unity.SkeletonExtensions.GetWorldVertices(a, slot, buffer)
end

---@param attachment : CS.Spine.PointAttachment
---@param slot : CS.Spine.Slot
---@param spineGameObjectTransform : CS.UnityEngine.Transform
---@return CS.UnityEngine.Vector3
function CS.Spine.Unity.SkeletonExtensions.GetWorldPosition(attachment, slot, spineGameObjectTransform)
end

---@param attachment : CS.Spine.PointAttachment
---@param bone : CS.Spine.Bone
---@param spineGameObjectTransform : CS.UnityEngine.Transform
---@return CS.UnityEngine.Vector3
function CS.Spine.Unity.SkeletonExtensions.GetWorldPosition(attachment, bone, spineGameObjectTransform)
end
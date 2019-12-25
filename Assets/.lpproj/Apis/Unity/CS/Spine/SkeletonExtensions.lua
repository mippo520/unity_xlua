---@class CS.Spine.SkeletonExtensions : CS.System.Object
CS.Spine.SkeletonExtensions = {}

---@param va : CS.Spine.VertexAttachment
---@return CS.System.Boolean
function CS.Spine.SkeletonExtensions.IsWeighted(va)
end

---@param a : CS.Spine.Attachment
---@return CS.System.Boolean
function CS.Spine.SkeletonExtensions.IsRenderable(a)
end

---@param mode : CS.Spine.TransformMode
---@return CS.System.Boolean
function CS.Spine.SkeletonExtensions.InheritsRotation(mode)
end

---@param mode : CS.Spine.TransformMode
---@return CS.System.Boolean
function CS.Spine.SkeletonExtensions.InheritsScale(mode)
end

---@param skeleton : CS.Spine.Skeleton
function CS.Spine.SkeletonExtensions.SetDrawOrderToSetupPose(skeleton)
end

---@param skeleton : CS.Spine.Skeleton
function CS.Spine.SkeletonExtensions.SetSlotAttachmentsToSetupPose(skeleton)
end

---@param slot : CS.Spine.Slot
function CS.Spine.SkeletonExtensions.SetColorToSetupPose(slot)
end

---@param slot : CS.Spine.Slot
function CS.Spine.SkeletonExtensions.SetAttachmentToSetupPose(slot)
end

---@param skeleton : CS.Spine.Skeleton
---@param slotIndex : CS.System.Int32
function CS.Spine.SkeletonExtensions.SetSlotAttachmentToSetupPose(skeleton, slotIndex)
end

---@param skeleton : CS.Spine.Skeleton
---@param animationName : CS.System.String
---@param time : CS.System.Single
---@param loop : CS.System.Boolean
function CS.Spine.SkeletonExtensions.PoseWithAnimation(skeleton, animationName, time, loop)
end

---@param animation : CS.Spine.Animation
---@param skeleton : CS.Spine.Skeleton
---@param time : CS.System.Single
---@param loop : CS.System.Boolean
function CS.Spine.SkeletonExtensions.PoseSkeleton(animation, skeleton, time, loop)
end

---@param animation : CS.Spine.Animation
---@param skeleton : CS.Spine.Skeleton
function CS.Spine.SkeletonExtensions.SetKeyedItemsToSetupPose(animation, skeleton)
end

---@param trackEntry : CS.Spine.TrackEntry
function CS.Spine.SkeletonExtensions.AllowImmediateQueue(trackEntry)
end

---@param skin : CS.Spine.Skin
---@param slotName : CS.System.String
---@param skeletonData : CS.Spine.SkeletonData
---@param results : CS.System.Collections.Generic.List
function CS.Spine.SkeletonExtensions.FindNamesForSlot(skin, slotName, skeletonData, results)
end

---@param skin : CS.Spine.Skin
---@param slotName : CS.System.String
---@param skeletonData : CS.Spine.SkeletonData
---@param results : CS.System.Collections.Generic.List
function CS.Spine.SkeletonExtensions.FindAttachmentsForSlot(skin, slotName, skeletonData, results)
end
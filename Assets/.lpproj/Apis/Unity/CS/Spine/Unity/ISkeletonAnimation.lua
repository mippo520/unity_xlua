---@class CS.Spine.Unity.ISkeletonAnimation
CS.Spine.Unity.ISkeletonAnimation = {}

---@property readonly CS.Spine.Unity.ISkeletonAnimation.Skeleton : CS.Spine.Skeleton
CS.Spine.Unity.ISkeletonAnimation.Skeleton = nil

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.ISkeletonAnimation:add_UpdateLocal(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.ISkeletonAnimation:remove_UpdateLocal(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.ISkeletonAnimation:add_UpdateWorld(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.ISkeletonAnimation:remove_UpdateWorld(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.ISkeletonAnimation:add_UpdateComplete(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.ISkeletonAnimation:remove_UpdateComplete(value)
end
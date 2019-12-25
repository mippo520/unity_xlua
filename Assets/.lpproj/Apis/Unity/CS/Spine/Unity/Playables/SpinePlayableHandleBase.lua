---@class CS.Spine.Unity.Playables.SpinePlayableHandleBase : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.Playables.SpinePlayableHandleBase = {}

---@property readonly CS.Spine.Unity.Playables.SpinePlayableHandleBase.SkeletonData : CS.Spine.SkeletonData
CS.Spine.Unity.Playables.SpinePlayableHandleBase.SkeletonData = nil

---@property readonly CS.Spine.Unity.Playables.SpinePlayableHandleBase.Skeleton : CS.Spine.Skeleton
CS.Spine.Unity.Playables.SpinePlayableHandleBase.Skeleton = nil

---@param value : CS.Spine.Unity.Playables.SpineEventDelegate
function CS.Spine.Unity.Playables.SpinePlayableHandleBase:add_AnimationEvents(value)
end

---@param value : CS.Spine.Unity.Playables.SpineEventDelegate
function CS.Spine.Unity.Playables.SpinePlayableHandleBase:remove_AnimationEvents(value)
end

---@param eventBuffer : CS.Spine.ExposedList
function CS.Spine.Unity.Playables.SpinePlayableHandleBase:HandleEvents(eventBuffer)
end
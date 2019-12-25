---@class CS.Spine.Unity.WaitForSpineEvent : CS.System.Object
CS.Spine.Unity.WaitForSpineEvent = {}

---@property readwrite CS.Spine.Unity.WaitForSpineEvent.WillUnsubscribeAfterFiring : CS.System.Boolean
CS.Spine.Unity.WaitForSpineEvent.WillUnsubscribeAfterFiring = nil

---@param state : CS.Spine.AnimationState
---@param eventDataReference : CS.Spine.EventData
---@param unsubscribeAfterFiring : CS.System.Boolean
---@return CS.Spine.Unity.WaitForSpineEvent
function CS.Spine.Unity.WaitForSpineEvent(state, eventDataReference, unsubscribeAfterFiring)
end

---@param skeletonAnimation : CS.Spine.Unity.SkeletonAnimation
---@param eventDataReference : CS.Spine.EventData
---@param unsubscribeAfterFiring : CS.System.Boolean
---@return CS.Spine.Unity.WaitForSpineEvent
function CS.Spine.Unity.WaitForSpineEvent(skeletonAnimation, eventDataReference, unsubscribeAfterFiring)
end

---@param state : CS.Spine.AnimationState
---@param eventName : CS.System.String
---@param unsubscribeAfterFiring : CS.System.Boolean
---@return CS.Spine.Unity.WaitForSpineEvent
function CS.Spine.Unity.WaitForSpineEvent(state, eventName, unsubscribeAfterFiring)
end

---@param skeletonAnimation : CS.Spine.Unity.SkeletonAnimation
---@param eventName : CS.System.String
---@param unsubscribeAfterFiring : CS.System.Boolean
---@return CS.Spine.Unity.WaitForSpineEvent
function CS.Spine.Unity.WaitForSpineEvent(skeletonAnimation, eventName, unsubscribeAfterFiring)
end

---@param state : CS.Spine.AnimationState
---@param eventDataReference : CS.Spine.EventData
---@param unsubscribeAfterFiring : CS.System.Boolean
---@return CS.Spine.Unity.WaitForSpineEvent
function CS.Spine.Unity.WaitForSpineEvent:NowWaitFor(state, eventDataReference, unsubscribeAfterFiring)
end

---@param state : CS.Spine.AnimationState
---@param eventName : CS.System.String
---@param unsubscribeAfterFiring : CS.System.Boolean
---@return CS.Spine.Unity.WaitForSpineEvent
function CS.Spine.Unity.WaitForSpineEvent:NowWaitFor(state, eventName, unsubscribeAfterFiring)
end
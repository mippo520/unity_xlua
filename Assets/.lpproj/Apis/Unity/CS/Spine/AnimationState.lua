---@class CS.Spine.AnimationState : CS.System.Object
CS.Spine.AnimationState = {}

---@property readwrite CS.Spine.AnimationState.TimeScale : CS.System.Single
CS.Spine.AnimationState.TimeScale = nil

---@property readwrite CS.Spine.AnimationState.Data : CS.Spine.AnimationStateData
CS.Spine.AnimationState.Data = nil

---@property readonly CS.Spine.AnimationState.Tracks : CS.Spine.ExposedList
CS.Spine.AnimationState.Tracks = nil

---@param data : CS.Spine.AnimationStateData
---@return CS.Spine.AnimationState
function CS.Spine.AnimationState(data)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.AnimationState:add_Start(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.AnimationState:remove_Start(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.AnimationState:add_Interrupt(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.AnimationState:remove_Interrupt(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.AnimationState:add_End(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.AnimationState:remove_End(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.AnimationState:add_Dispose(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.AnimationState:remove_Dispose(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.AnimationState:add_Complete(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.AnimationState:remove_Complete(value)
end

---@param value : CS.Spine.TrackEntryEventDelegate
function CS.Spine.AnimationState:add_Event(value)
end

---@param value : CS.Spine.TrackEntryEventDelegate
function CS.Spine.AnimationState:remove_Event(value)
end

---@param delta : CS.System.Single
function CS.Spine.AnimationState:Update(delta)
end

---@param skeleton : CS.Spine.Skeleton
---@return CS.System.Boolean
function CS.Spine.AnimationState:Apply(skeleton)
end

function CS.Spine.AnimationState:ClearTracks()
end

---@param trackIndex : CS.System.Int32
function CS.Spine.AnimationState:ClearTrack(trackIndex)
end

---@param trackIndex : CS.System.Int32
---@param animationName : CS.System.String
---@param loop : CS.System.Boolean
---@return CS.Spine.TrackEntry
function CS.Spine.AnimationState:SetAnimation(trackIndex, animationName, loop)
end

---@param trackIndex : CS.System.Int32
---@param animation : CS.Spine.Animation
---@param loop : CS.System.Boolean
---@return CS.Spine.TrackEntry
function CS.Spine.AnimationState:SetAnimation(trackIndex, animation, loop)
end

---@param trackIndex : CS.System.Int32
---@param animationName : CS.System.String
---@param loop : CS.System.Boolean
---@param delay : CS.System.Single
---@return CS.Spine.TrackEntry
function CS.Spine.AnimationState:AddAnimation(trackIndex, animationName, loop, delay)
end

---@param trackIndex : CS.System.Int32
---@param animation : CS.Spine.Animation
---@param loop : CS.System.Boolean
---@param delay : CS.System.Single
---@return CS.Spine.TrackEntry
function CS.Spine.AnimationState:AddAnimation(trackIndex, animation, loop, delay)
end

---@param trackIndex : CS.System.Int32
---@param mixDuration : CS.System.Single
---@return CS.Spine.TrackEntry
function CS.Spine.AnimationState:SetEmptyAnimation(trackIndex, mixDuration)
end

---@param trackIndex : CS.System.Int32
---@param mixDuration : CS.System.Single
---@param delay : CS.System.Single
---@return CS.Spine.TrackEntry
function CS.Spine.AnimationState:AddEmptyAnimation(trackIndex, mixDuration, delay)
end

---@param mixDuration : CS.System.Single
function CS.Spine.AnimationState:SetEmptyAnimations(mixDuration)
end

---@param trackIndex : CS.System.Int32
---@return CS.Spine.TrackEntry
function CS.Spine.AnimationState:GetCurrent(trackIndex)
end

function CS.Spine.AnimationState:ClearListenerNotifications()
end

---@return CS.System.String
function CS.Spine.AnimationState:ToString()
end
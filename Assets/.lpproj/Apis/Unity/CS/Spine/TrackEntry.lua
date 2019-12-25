---@class CS.Spine.TrackEntry : CS.System.Object
CS.Spine.TrackEntry = {}

---@property readonly CS.Spine.TrackEntry.TrackIndex : CS.System.Int32
CS.Spine.TrackEntry.TrackIndex = nil

---@property readonly CS.Spine.TrackEntry.Animation : CS.Spine.Animation
CS.Spine.TrackEntry.Animation = nil

---@property readwrite CS.Spine.TrackEntry.Loop : CS.System.Boolean
CS.Spine.TrackEntry.Loop = nil

---@property readwrite CS.Spine.TrackEntry.Delay : CS.System.Single
CS.Spine.TrackEntry.Delay = nil

---@property readwrite CS.Spine.TrackEntry.TrackTime : CS.System.Single
CS.Spine.TrackEntry.TrackTime = nil

---@property readwrite CS.Spine.TrackEntry.TrackEnd : CS.System.Single
CS.Spine.TrackEntry.TrackEnd = nil

---@property readwrite CS.Spine.TrackEntry.AnimationStart : CS.System.Single
CS.Spine.TrackEntry.AnimationStart = nil

---@property readwrite CS.Spine.TrackEntry.AnimationEnd : CS.System.Single
CS.Spine.TrackEntry.AnimationEnd = nil

---@property readwrite CS.Spine.TrackEntry.AnimationLast : CS.System.Single
CS.Spine.TrackEntry.AnimationLast = nil

---@property readonly CS.Spine.TrackEntry.AnimationTime : CS.System.Single
CS.Spine.TrackEntry.AnimationTime = nil

---@property readwrite CS.Spine.TrackEntry.TimeScale : CS.System.Single
CS.Spine.TrackEntry.TimeScale = nil

---@property readwrite CS.Spine.TrackEntry.Alpha : CS.System.Single
CS.Spine.TrackEntry.Alpha = nil

---@property readwrite CS.Spine.TrackEntry.EventThreshold : CS.System.Single
CS.Spine.TrackEntry.EventThreshold = nil

---@property readwrite CS.Spine.TrackEntry.AttachmentThreshold : CS.System.Single
CS.Spine.TrackEntry.AttachmentThreshold = nil

---@property readwrite CS.Spine.TrackEntry.DrawOrderThreshold : CS.System.Single
CS.Spine.TrackEntry.DrawOrderThreshold = nil

---@property readonly CS.Spine.TrackEntry.Next : CS.Spine.TrackEntry
CS.Spine.TrackEntry.Next = nil

---@property readonly CS.Spine.TrackEntry.IsComplete : CS.System.Boolean
CS.Spine.TrackEntry.IsComplete = nil

---@property readwrite CS.Spine.TrackEntry.MixTime : CS.System.Single
CS.Spine.TrackEntry.MixTime = nil

---@property readwrite CS.Spine.TrackEntry.MixDuration : CS.System.Single
CS.Spine.TrackEntry.MixDuration = nil

---@property readwrite CS.Spine.TrackEntry.MixBlend : CS.Spine.MixBlend
CS.Spine.TrackEntry.MixBlend = nil

---@property readonly CS.Spine.TrackEntry.MixingFrom : CS.Spine.TrackEntry
CS.Spine.TrackEntry.MixingFrom = nil

---@property readonly CS.Spine.TrackEntry.MixingTo : CS.Spine.TrackEntry
CS.Spine.TrackEntry.MixingTo = nil

---@property readwrite CS.Spine.TrackEntry.HoldPrevious : CS.System.Boolean
CS.Spine.TrackEntry.HoldPrevious = nil

---@return CS.Spine.TrackEntry
function CS.Spine.TrackEntry()
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntry:add_Start(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntry:remove_Start(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntry:add_Interrupt(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntry:remove_Interrupt(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntry:add_End(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntry:remove_End(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntry:add_Dispose(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntry:remove_Dispose(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntry:add_Complete(value)
end

---@param value : CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntry:remove_Complete(value)
end

---@param value : CS.Spine.TrackEntryEventDelegate
function CS.Spine.TrackEntry:add_Event(value)
end

---@param value : CS.Spine.TrackEntryEventDelegate
function CS.Spine.TrackEntry:remove_Event(value)
end

function CS.Spine.TrackEntry:Reset()
end

function CS.Spine.TrackEntry:ResetRotationDirections()
end

---@return CS.System.String
function CS.Spine.TrackEntry:ToString()
end
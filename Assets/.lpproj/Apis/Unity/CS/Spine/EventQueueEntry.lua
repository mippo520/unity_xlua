---@class CS.Spine.EventQueueEntry : CS.System.ValueType
CS.Spine.EventQueueEntry = {}

---@field public CS.Spine.EventQueueEntry.type : CS.Spine.EventType
CS.Spine.EventQueueEntry.type = nil

---@field public CS.Spine.EventQueueEntry.entry : CS.Spine.TrackEntry
CS.Spine.EventQueueEntry.entry = nil

---@field public CS.Spine.EventQueueEntry.e : CS.Spine.Event
CS.Spine.EventQueueEntry.e = nil

---@param eventType : CS.Spine.EventType
---@param trackEntry : CS.Spine.TrackEntry
---@param e : CS.Spine.Event
---@return CS.Spine.EventQueueEntry
function CS.Spine.EventQueueEntry(eventType, trackEntry, e)
end
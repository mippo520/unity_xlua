---@class CS.Spine.Event : CS.System.Object
CS.Spine.Event = {}

---@property readonly CS.Spine.Event.Data : CS.Spine.EventData
CS.Spine.Event.Data = nil

---@property readonly CS.Spine.Event.Time : CS.System.Single
CS.Spine.Event.Time = nil

---@property readwrite CS.Spine.Event.Int : CS.System.Int32
CS.Spine.Event.Int = nil

---@property readwrite CS.Spine.Event.Float : CS.System.Single
CS.Spine.Event.Float = nil

---@property readwrite CS.Spine.Event.String : CS.System.String
CS.Spine.Event.String = nil

---@property readwrite CS.Spine.Event.Volume : CS.System.Single
CS.Spine.Event.Volume = nil

---@property readwrite CS.Spine.Event.Balance : CS.System.Single
CS.Spine.Event.Balance = nil

---@param time : CS.System.Single
---@param data : CS.Spine.EventData
---@return CS.Spine.Event
function CS.Spine.Event(time, data)
end

---@return CS.System.String
function CS.Spine.Event:ToString()
end
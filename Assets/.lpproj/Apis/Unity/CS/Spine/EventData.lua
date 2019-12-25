---@class CS.Spine.EventData : CS.System.Object
CS.Spine.EventData = {}

---@property readonly CS.Spine.EventData.Name : CS.System.String
CS.Spine.EventData.Name = nil

---@property readwrite CS.Spine.EventData.Int : CS.System.Int32
CS.Spine.EventData.Int = nil

---@property readwrite CS.Spine.EventData.Float : CS.System.Single
CS.Spine.EventData.Float = nil

---@property readwrite CS.Spine.EventData.String : CS.System.String
CS.Spine.EventData.String = nil

---@property readwrite CS.Spine.EventData.AudioPath : CS.System.String
CS.Spine.EventData.AudioPath = nil

---@property readwrite CS.Spine.EventData.Volume : CS.System.Single
CS.Spine.EventData.Volume = nil

---@property readwrite CS.Spine.EventData.Balance : CS.System.Single
CS.Spine.EventData.Balance = nil

---@param name : CS.System.String
---@return CS.Spine.EventData
function CS.Spine.EventData(name)
end

---@return CS.System.String
function CS.Spine.EventData:ToString()
end
local Storage = class("Storage")

local savePath = Unity.Application.persistentDataPath .. "/donotopenit.txt"
local File = CS.System.IO.File

local function _update(self, dt)
	if self.needWrite then
		File.WriteAllText(savePath, RapidJson.encode(self.data))
	end	
end

function Storage:ctor()
    self.data = {}
	self.needWrite = false
    local text = ""
    if File.Exists(savePath) then
        text = File.ReadAllText(savePath)
    else
        File.WriteAllText(savePath, "")
    end

    if "" ~= text then
        self.data = RapidJson.decode(text)
        if nil == self.data then
            self.data = {}
        end
    end
	
	EventManagerInst:registEvent(Event.FrameUpdate, self, _update)
end

function Storage:set(key, value)
    self.data[key] = value
	self.needWrite = true
end

function Storage:get(key)
    return self.data[key]
end

if not _StorageInst then
    _StorageInst = Storage.new()
end
return _StorageInst

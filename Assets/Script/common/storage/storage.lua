local Storage = class("Storage")

local savePath = Unity.Application.persistentDataPath .. "/donotopenit.txt"
local File = CS.System.IO.File

function Storage:ctor()
    self.data = {}
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
end

function Storage:set(key, value)
    self.data[key] = value
    File.WriteAllText(savePath, RapidJson.encode(self.data))
end

function Storage:get(key)
    return self.data[key]
end

if not _StorageInst then
    _StorageInst = Storage.new()
end
return _StorageInst

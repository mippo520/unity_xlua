local Net = CS.Assets.Common.Net.NetManager
local EndianType = CS.Assets.Common.Net.EndianType
local NetState = CS.Assets.Common.Net.NetState

local NetManager = class("NetManager")

local sInstance = nil

function NetManager.GetInstance()
    if nil == sInstance then
        sInstance = NetManager.new()
    end
    return sInstance
end

function NetManager:ctor()
end


function NetManager:init()
    Net.GetInstance():Init(EndianType.Big, 4, CS.Assets.Common.Net.FirstPackageCreator())
    self:connect("192.168.3.192", 9101)
end

local function receiveCallback(self, data, state)
    if NetState.Connected == state then
        Info.Debug("receive data : " .. data)
    else
        EventManager:FireEvent(Event.Disconnect)
    end
end

local function connectCallback(self, state)
    if NetState.Connected == state then
        EventManager:FireEvent(Event.ConnectSuccess)
        Net.GetInstance():Receive(handler(self, receiveCallback))
    else
        EventManager:FireEvent(Event.ConnectFailed)
    end
end

function NetManager:connect(ip, port)
    Net.GetInstance():Connect("192.168.3.192", 9101, handler(self, connectCallback))
end

function NetManager:release()
    Net.DelInstance()
end


return NetManager
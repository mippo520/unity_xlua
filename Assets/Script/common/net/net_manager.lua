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
    self.mapIdMsg = {}
    self.mapMsgId = {}
    self.mapPairMsg = {}
end


function NetManager:init()
    Net.GetInstance():Init(EndianType.Big, 4, CS.Assets.Common.Net.FirstPackageCreator())
end

local function receiveCallback(self, data, state)
    if NetState.Connected == state then
        Info.Debug("receive data : " .. data)
        local id = string.unpack(">I4", data)
        local msg = self.mapIdMsg[id]
        if msg then
            local pb = assert(PB.decode(msg, string.sub( data, 5)))
            EventManager.GetInstance():fireEvent(msg, pb)
        else
            Info.Error("receive message error! id = " .. id)
        end
    elseif NetState.Closed == state then
        EventManager.GetInstance():fireEvent(Event.Closed)
    else
        EventManager.GetInstance():fireEvent(Event.Disconnect)
    end
end

local function connectCallback(self, state)
    if NetState.Connected == state then
        EventManager.GetInstance():fireEvent(Event.ConnectSuccess)
        Net.GetInstance():Receive(handler(self, receiveCallback))
    else
        EventManager.GetInstance():fireEvent(Event.ConnectFailed)
    end
end

local function addMsgInfo(self, msg)
    if not self.mapMsgId[msg] then
        local id = Tools.Hash(msg)
        self.mapIdMsg[id] = msg
        self.mapMsgId[msg] = id
    end
end

function NetManager:connect(ip, port)
    Net.GetInstance():Connect(ip, port, handler(self, connectCallback))
end

function NetManager:release()
    Net.DelInstance()
end

function NetManager:registMessage(msg, obj, callback)
    addMsgInfo(self, msg)

    EventManager.GetInstance():registEvent(msg, obj, callback)
end

function NetManager:unregistMessage(obj)
    EventManager.GetInstance():delObject(obj)
end

function NetManager:send(msg, data)
    addMsgInfo(self, msg)
    local id = self.mapMsgId[msg]
    if not id then
        Info.Error("NetManager:send error! message type is " .. msg)
        return
    end

    local bytes = assert(PB.encode(msg, data))
    local id_byte = string.pack(">I4", id)
    Net.GetInstance():Send(id_byte .. bytes)
end

function NetManager:registPairMessage(sendMsg, recvMsg)
    if self.mapPairMsg[sendMsg] then
        Info.Error("NetManager:registPairMessage error! pair " .. sendMsg .. " and " .. recvMsg .. " is already registed!")
    end
    self.mapPairMsg[sendMsg] = recvMsg
end

function NetManager:close()
    Net.GetInstance():Close(false)
end

return NetManager
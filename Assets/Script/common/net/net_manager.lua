local Net = CS.Assets.Common.Net.NetManager
local EndianType = CS.Assets.Common.Net.EndianType
local NetState = CS.Assets.Common.Net.NetState

local NetManager = class("NetManager")

local sInstance = nil
local MsgWaitData = require("common.net.msg_wait_data")

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
    self.arrWaitReceive = {}
    self.connectCount = 0
    self.reconnectTimerId = 0
end

local function _clearWaitData(self)
    for i, v in ipairs(self.arrWaitReceive) do
        v:release()
    end
    self.arrWaitReceive = {}
end

local function _messageTimeout(self, msg)
    Net.GetInstance():Close()
end

local function _reconnectTimer(self)
    self.reconnectTimerId = 0
    self.connectCount = self.connectCount + 1
    Info.Debug("net reconnect ! count is " .. self.connectCount)
    Net.GetInstance():Reconnect()
end

local function _resetConnectData(self)
    self.connectCount = 0
end

local function _reconnect(self)
    if self.connectCount >= NetReconnectCount then
        EventManager.GetInstance():fireEvent(Event.Closed)
        _resetConnectData(self)
        return
    end
    self.reconnectTimerId = TimeManager.GetInstance():onceTimer(NetReconnectWaitTime, self, _reconnectTimer)
end

function NetManager:init()
    Net.GetInstance():Init(EndianType.Big, 4, CS.Assets.Common.Net.FirstPackageCreator())
    EventManager.GetInstance():registEvent(Event.MessageTimeout, self, _messageTimeout)
end

local function receiveCallback(self, data, state)
    if NetState.Connected == state then
        local id = string.unpack(">I4", data)
        local msg = self.mapIdMsg[id]
        Info.Debug("receive msg : " .. msg)
        if msg then
            local pb = assert(PB.decode(msg, string.sub( data, 5)))
            EventManager.GetInstance():fireEvent(msg, pb)

            if #self.arrWaitReceive > 0 then
                local waitData = self.arrWaitReceive[1]
                if waitData.msg == msg then
                    waitData:release()
                    table.remove(self.arrWaitReceive, 1)
                    if #self.arrWaitReceive > 0 then
                        self.arrWaitReceive[1]:start()
                    end
                end
            end
        else
            Info.Error("receive message error! id = " .. id)
        end
    elseif NetState.Closed == state then
        EventManager.GetInstance():fireEvent(Event.Closed)
        _clearWaitData(self)
    else
        EventManager.GetInstance():fireEvent(Event.Disconnect)
        _clearWaitData(self)
        _reconnect(self)
    end
end

local function connectCallback(self, state)
    if NetState.Connected == state then
        EventManager.GetInstance():fireEvent(Event.ConnectSuccess)
        Net.GetInstance():Receive(handler(self, receiveCallback))
        _resetConnectData(self)
    else
        EventManager.GetInstance():fireEvent(Event.ConnectFailed)
        _reconnect(self)
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
    if self.reconnectTimerId > 0 then
        _resetConnectData(self)
        TimeManager.GetInstance():unregistTimer(self.reconnectTimerId)
        self.reconnectTimerId = 0
    end
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

    local waitMsg = self.mapPairMsg[msg]
    if waitMsg then
        local data = MsgWaitData.new(waitMsg)
        table.insert(self.arrWaitReceive, data)
        if 1 == #self.arrWaitReceive then
            data:start()
        end
    end
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
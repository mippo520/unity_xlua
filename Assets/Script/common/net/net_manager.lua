local Net = CSCommon.Net.NetManager
local EndianType = CSCommon.Net.EndianType
local NetState = CSCommon.Net.NetState
local MsgWaitData = require("common.net.msg_wait_data")

local NetManager = class("NetManager")

function NetManager:ctor()
    self.mapIdMsg = {}
    self.mapMsgId = {}
    self.mapPairMsg = {}
    self.arrWaitReceive = {}
    self.connectCount = 0
    self.reconnectTimerId = 0
    self.isConnected = false
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
        EventManagerInst:fireEvent(Event.NetClosed)
        _resetConnectData(self)
        return
    end
    self.reconnectTimerId = TimeManagerInst:onceTimer(NetReconnectWaitTime, self, _reconnectTimer)
end

function NetManager:init()
    Net.GetInstance():Init(EndianType.Big, 4, CSCommon.Net.FirstPackageCreator())
    EventManagerInst:registEvent(Event.MessageTimeout, self, _messageTimeout)
end

local function receiveCallback(self, data, state)
    if NetState.Connected == state then
        local id = string.unpack(">I4", data)
        local msg = self.mapIdMsg[id]
        if msg then
            Info.Debug("receive msg : " .. msg)
            local pb = assert(PB.decode(msg, string.sub( data, 5)))
            EventManagerInst:fireEvent(msg, pb)

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
        EventManagerInst:fireEvent(Event.NetClosed)
        _clearWaitData(self)
        self.isConnected = false
    else
        EventManagerInst:fireEvent(Event.NetDisconnect)
        _clearWaitData(self)
        -- _reconnect(self)
        self.isConnected = false
    end
end

local function connectCallback(self, state)
    if NetState.Connected == state then
        Net.GetInstance():Receive(handler(self, receiveCallback))
        _resetConnectData(self)
    elseif NetState.Finished == state then
        EventManagerInst:fireEvent(Event.NetConnectSuccess)
    else
        EventManagerInst:fireEvent(Event.NetConnectFailed)
        -- _reconnect(self)
        self.isConnected = false
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
    if self.isConnected then
        Info.Error("NetManager:connect error! socket is connected!")
        return
    end
    if self.reconnectTimerId > 0 then
        _resetConnectData(self)
        TimeManagerInst:stopTimer(self.reconnectTimerId)
        self.reconnectTimerId = 0
    end
    Net.GetInstance():Connect(ip, port, handler(self, connectCallback))
    self.isConnected = true
end

function NetManager:reconnect()
    if self.isConnected then
        Info.Error("NetManager:reconnect error! socket is connected!")
        return
    end
    Net.GetInstance():Reconnect()
    self.isConnected = true
end

function NetManager:release()
    Net.DelInstance()
end

function NetManager:registMessage(msg, obj, callback)
    addMsgInfo(self, msg)

    EventManagerInst:registEvent(msg, obj, callback)
end

function NetManager:unregistMessage(obj)
    EventManagerInst:delObject(obj)
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

if not _NetManagerInst then
    _NetManagerInst = NetManager.new()
end
return _NetManagerInst

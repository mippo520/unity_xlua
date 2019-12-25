local Net = CSCommon.Net.TcpManager
local EndianType = CSCommon.Net.EndianType
local NetState = CSCommon.Net.NetState
local MsgWaitData = require("common.net.msg_wait_data")
local NetManager = require("common.net.net_manager")

local TcpManager = class("TcpManager", NetManager)

function TcpManager:ctor()
	NetManager.ctor(self)
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

function TcpManager:init()
    Net.GetInstance():Init(EndianType.Big, 4, CSPackageCreator.FirstPackageCreator())
    EventManagerInst:registEvent(Event.MessageTimeout, self, _messageTimeout)
end

local function receiveCallback(self, data, size, state)
    if NetState.Connected == state then
		local pb = self:pbUnpack(data, size)
		if pb then
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

function TcpManager:connect(ip, port)
    if self.isConnected then
        Info.Error("TcpManager:connect error! socket is connected!")
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

function TcpManager:reconnect()
    if self.isConnected then
        Info.Error("TcpManager:reconnect error! socket is connected!")
        return
    end
    Net.GetInstance():Reconnect()
    self.isConnected = true
end

function TcpManager:release()
    Net.DelInstance()
end

function TcpManager:registMessage(msg, obj, callback)
    self:addMsgInfo(self, msg)

    EventManagerInst:registEvent(msg, obj, callback)
end

function TcpManager:unregistMessage(obj)
    EventManagerInst:delObject(obj)
end

function TcpManager:send(msg, data)
    self:addMsgInfo(self, msg)
	local pack = self:pbPack(msg, data)
	if pack then
		Net.GetInstance():Send(pack)

		local waitMsg = self.mapPairMsg[msg]
		if waitMsg then
			local data = MsgWaitData.new(waitMsg)
			table.insert(self.arrWaitReceive, data)
			if 1 == #self.arrWaitReceive then
				data:start()
			end
		end
	end
end

function TcpManager:registPairMessage(sendMsg, recvMsg)
    if self.mapPairMsg[sendMsg] then
        Info.Error("TcpManager:registPairMessage error! pair " .. sendMsg .. " and " .. recvMsg .. " is already registed!")
    end
    self.mapPairMsg[sendMsg] = recvMsg
end

function TcpManager:close()
    Net.GetInstance():Close(false)
end

if not _TcpManagerInst then
    _TcpManagerInst = TcpManager.new()
end
return _TcpManagerInst

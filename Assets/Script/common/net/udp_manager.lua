local UDP = CSCommon.Net.UdpManager
local EndianType = CSCommon.Net.EndianType
local NetState = CSCommon.Net.NetState
local NetManager = require("common.net.net_manager")

local UdpManager = class("UdpManager", NetManager)

local function _onReceive(self, data, size, state)
	if NetState.Connected == state then
		local msg, pb = self:pbUnpack(data, size)
		if msg and pb then
			EventManagerInst:fireEvent(msg, pb)
			Info.Debug("udp manager receive account_id = " .. pb.account_id .. " token = " .. pb.token)
		end
	elseif NetState.Closed == state then
		EventManagerInst:fireEvent(Event.NetClosed)
		
	else
		EventManagerInst:fireEvent(Event.NetDisconnect)
		
	end
end

function UdpManager:ctor()
	NetManager.ctor(self)
end

function UdpManager:init(ip, port)
	UDP.GetInstance():Init(EndianType.Big, ip, port, CSPackageCreator.UdpPackageCreator())
	UDP.GetInstance():Receive(handler(self, _onReceive))
end

function UdpManager:send(msg, data)
	self:addMsgInfo(self, msg)
	local pack = self:pbPack(msg, data)
	if pack then
		UDP.GetInstance():Send(pack)
	end
end

function UdpManager:release()
	UDP.DelInstance()
end

if not _UdpManagerInst then
	_UdpManagerInst = UdpManager.new()
end
return _UdpManagerInst

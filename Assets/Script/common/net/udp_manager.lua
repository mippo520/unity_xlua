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
		end
		
		local waitMsg = self.pairWaitList[msg]
		if waitMsg then
			self.pairWaitList[msg] = nil
			self.pairMsgList[waitMsg] = nil
		end
	elseif NetState.Closed == state then
		EventManagerInst:fireEvent(Event.NetClosed)
	else
		EventManagerInst:fireEvent(Event.NetDisconnect)
	end
end

local function _resend(self)
	for msg, pack in pairs(self.pairMsgList) do
		UDP.GetInstance():Send(pack)
	end
end

function UdpManager:ctor()
	NetManager.ctor(self)
	self.pairMsgList = {}
	self.pairWaitList = {}
	self.resendTimerId = 0
end

function UdpManager:init(ip, port)
	if Tools.IsNumberEqual(0, self.resendTimerId) then
		self.resendTimerId = TimeManagerInst:loopTimer(500, 500, self, _resend, "forever")
	end

	local succ = UDP.GetInstance():Init(EndianType.Big, ip, port, CSPackageCreator.UdpPackageCreator())
	if succ then
		UDP.GetInstance():Receive(handler(self, _onReceive))
	end
	return succ
end

function UdpManager:send(msg, data)
	self:addMsgInfo(msg)
	local pack = self:pbPack(msg, data)
	if pack then
		UDP.GetInstance():Send(pack)
		
		local waitMsg = self.mapPairMsg[msg]
		if waitMsg then
			self.pairMsgList[msg] = pack
			self.pairWaitList[waitMsg] = msg
		end
	end
end

function UdpManager:release()
	UDP.DelInstance()
end

if not _UdpManagerInst then
	_UdpManagerInst = UdpManager.new()
end
return _UdpManagerInst

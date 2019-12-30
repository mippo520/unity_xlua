local PBManager = class("PBManager")

local function _registPairMessage()
	UdpManagerInst:registPairMessage(c_gs.C2S_Auth, c_gs.S2C_Auth)
	UdpManagerInst:registPairMessage(c_gs.C2S_Ready, c_gs.S2C_Ready)
end

local function _registMessage()
	UdpManagerInst:addMsgInfo(c_gs.CMD_Move)
end

function PBManager:init()
	_registMessage()
	_registPairMessage()
end

if not _PBManagerInst then
    _PBManagerInst = PBManager.new()
end
return _PBManagerInst

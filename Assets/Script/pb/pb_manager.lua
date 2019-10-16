local PBManager = class("PBManager")

function PBManager:registPairMessage()
    NetManagerInst:registPairMessage(c_gs.C2S_Login, c_gs.S2C_Login)
    NetManagerInst:registPairMessage(c_gs.C2S_CreateCharacter, c_gs.S2C_CreateCharacter)
end

if not _PBManagerInst then
    _PBManagerInst = PBManager.new()
end
return _PBManagerInst

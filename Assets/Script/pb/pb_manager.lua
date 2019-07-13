local PBManager = class("PBManager")

local sInstance = nil

function PBManager.GetInstance()
    if nil == sInstance then
        sInstance = PBManager.new()
    end
    return sInstance
end

function PBManager:registPairMessage()
    NetManagerInst:registPairMessage(c_gs.C2S_Login, c_gs.S2C_Login)
end


return PBManager
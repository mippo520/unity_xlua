local CreatePlayerController = class("CreatePlayerController")

local _s2c_create_player = function (self, msg)
    Progress:enterGame()
end

function CreatePlayerController:ctor()
    NetManagerInst:registMessage(c_gs.S2C_CreateCharacter, self, _s2c_create_player)

end

function CreatePlayerController:create(name, head)
    NetManagerInst:send(c_gs.C2S_CreateCharacter, {
        name = name,
        head = head, 
    })
end


return CreatePlayerController

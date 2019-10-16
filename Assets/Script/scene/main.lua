
local main = class("main", Behaviour)


function main:_awake()
    ConfigManager:init()
    PlayerControllerInst:init()
    VipControllerInst:init()
    HeroControllerInst:init()
end

function main:_start()
    DialogManagerInst:open(DialogType.Login)
end


return main

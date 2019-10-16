local ConfigManager = class("ConfigManager")

CfgSeat = require("game.seat.cfg_seat")

function ConfigManager:init()
    CfgSeat:init()
end


if not _ConfigManagerInst then
    _ConfigManagerInst = ConfigManager.new()
end

return _ConfigManagerInst
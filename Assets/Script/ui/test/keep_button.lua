
local TouchLongKeep = require("ui.common.touch_long_keep")
local KeepButton = class("KeepButton", TouchLongKeep)

function KeepButton:onLongKeep()
    Info.Debug("KeepButton:onLongKeep ==============> ")
end

return KeepButton
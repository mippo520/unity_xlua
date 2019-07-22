local OutMachine = class("OutMachine")
local ScaleFadeDefine = require("animate.ui.scale_fade.define")

function OutMachine:onStateExit(animator, stateInfo, layerIndex)
    local luaBehaviour = Behaviour.getLuaBehaviour(animator.gameObject)
    luaBehaviour:closeComplete()
end

return OutMachine

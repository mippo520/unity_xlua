local BlinkMachine = class("BlinkMachine")


function BlinkMachine:onStateExit(animator, stateInfo, layerIndex)
    local luaBehaviour = Behaviour.getLuaBehaviour(animator.transform.parent.parent.gameObject)
    luaBehaviour:reset()
end

return BlinkMachine



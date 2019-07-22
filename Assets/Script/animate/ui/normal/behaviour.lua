local NoneEffectBG = class("NoneEffectBG", Behaviour)

function NoneEffectBG:close()
    local rootLuaBehaviour = Behaviour.getLuaBehaviour(self.gameObject.transform.parent.gameObject)
    rootLuaBehaviour:closeComplete()
end

return NoneEffectBG
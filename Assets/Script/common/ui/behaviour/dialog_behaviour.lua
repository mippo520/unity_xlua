local DialogBehaviour = class("DialogBehaviour", Behaviour)

function DialogBehaviour:ctor()
    Behaviour.ctor(self)
    self.wrap = nil
end

function DialogBehaviour:awakeLogic()
    Behaviour.awakeLogic(self)
    self.wrap = self.behaviourObject.gameObject.transform:Find("wrap").gameObject
end

function DialogBehaviour:close()
    local luaWrapBehaviour = self.wrap:GetComponent(typeof(CSLuaBehaviour))
    local luaWrap = BehaviourManager.getBehaviour(luaWrapBehaviour.id)
    luaWrap:close()
end

function DialogBehaviour:closeComplete()
    local dialog = DialogManagerInst:get(self.id)
    dialog:closeComplete()
end

return DialogBehaviour

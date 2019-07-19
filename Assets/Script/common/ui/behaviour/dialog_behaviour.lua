local DialogBehaviour = class("DialogBehaviour", Behaviour)

function DialogBehaviour:ctor()
    Behaviour.ctor(self)
    self.wrap = nil
end


function DialogBehaviour:awakeLogic()
    Behaviour.awakeLogic(self)
    self.wrap = self.behaviourObject.gameObject.transform:Find("wrap").gameObject
end

return DialogBehaviour

local ImpassableBG = class("ImpassableBG", Behaviour)

function ImpassableBG:ctor()
    Behaviour.ctor(self)
    self.isInClose = false
end

function ImpassableBG:onPointerClick(eventData)
    if self.clickClose and not self.isInClose then
        Info.Debug("bg click!")
        local parentLua = Behaviour.getLuaBehaviour(self.gameObject.transform.parent.gameObject)
        parentLua:closeSelf()
        self.isInClose = true
    end
end

return ImpassableBG
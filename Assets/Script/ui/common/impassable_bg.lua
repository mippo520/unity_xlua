local ImpassableBG = class("ImpassableBG", Behaviour)

function ImpassableBG:ctor()
    Behaviour.ctor(self)
    self.isInClose = false
end

function ImpassableBG:onPointerClick(eventData)
    if self.clickClose and not self.isInClose then
		self.isInClose = true
        local parentLua = Behaviour.getLuaBehaviour(self.gameObject.transform.parent.gameObject)
        parentLua:closeSelf()
		self:close()
    end
end

function ImpassableBG:close()
	local imgComponent = self.gameObject:GetComponent(typeof(UnityUI.Image))
	imgComponent.color = Unity.Color.clear
	imgComponent.raycastTarget = false
end

return ImpassableBG
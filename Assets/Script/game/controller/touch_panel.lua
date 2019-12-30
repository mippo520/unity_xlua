local TouchPanel = class("TouchPanel", Behaviour)

function TouchPanel:ctor()
	Behaviour.ctor(self)
	self.ctrlLua = nil
end

function TouchPanel:_awake()
	self.ctrlLua = Behaviour.getLuaBehaviour(self.ctrl)
end

function TouchPanel:onPointerDown(eventData)
	self.ctrlLua:touchDown(eventData.position)
end

function TouchPanel:onPointerUp()
	self.ctrlLua:touchUp()
end

function TouchPanel:onDrag(eventData)
	self.ctrlLua:touchMove(eventData.position)
end

return TouchPanel
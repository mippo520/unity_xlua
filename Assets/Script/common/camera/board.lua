local Board = class("Board", Behaviour)

function Board:ctor()
	Behaviour.ctor(self)
end

function Board:_start()
	self:updateView()
end

function Board:updateView()
	self.gameObject.transform:LookAt(self.gameObject.transform.position + CameraManagerInst:lookAtDir())
	local rot = self.gameObject.transform.localEulerAngles
	rot.z = Unity.Camera.main.transform.localEulerAngles.z
	self.gameObject.transform.localEulerAngles = rot
end

return Board
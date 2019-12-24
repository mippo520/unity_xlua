local Camera = class("Camera", Behaviour)

local function _updateLookAt(self)
	self.lookDir = self.gameObject.transform.rotation * self.originDir
end

function Camera:ctor()
	Behaviour.ctor(self)
	self.originDir = Unity.Vector3(0, 0, 1)
	self.lookDir = self.originDir
end

function Camera:_awake()
	_updateLookAt(self)
end


return Camera
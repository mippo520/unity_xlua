local scene = class("scene", Behaviour)

function scene:_awake()
	SceneManagerInst:setCurrent(self)
end

return scene

local SceneManager = class("SceneManager")

function SceneManager:ctor()
	self.curScene = nil
end

function SceneManager:setCurrent(scene)
	if not self.curScene or self.curScene.name ~= scene.name then
		local oldScene = "none"
		if self.curScene then
			oldScene = self.curScene.name
		end
		self.curScene = scene
		EventManagerInst:fireEvent(Event.ChangeScene, oldScene, scene.name)
	end
end

function SceneManager:getCurrent()
	if not self.curScene then
		Info.Error("SceneManager getCurrent Error! Do not set current scene!")
	end
	
	return self.curScene
end

if not _SceneManangerInst then
	_SceneManangerInst = SceneManager.new()
end

return _SceneManangerInst
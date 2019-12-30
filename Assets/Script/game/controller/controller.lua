local Controller = class("Controller", DialogBehaviour)

local HatMaxDistance = 200

function Controller:ctor()
	DialogBehaviour.ctor(self)
	self.joyOriginPos = nil
	self.isKeep = false
end

function Controller:_start()
	self.joyOriginPos = self.joy.anchoredPosition
end

function Controller:touchDown(pos)
	if pos.x <= 600 then
		self.joy.anchoredPosition = pos
		self.isKeep = true
	end
end

function Controller:touchUp()
	self.isKeep = false
	self.joy.anchoredPosition = self.joyOriginPos
	self.hat.anchoredPosition = Unity.Vector2.zero
	GameInfoInst:refreshJoy(nil, 0)
end

function Controller:touchMove(pos)
	if self.isKeep then
		local movePos = pos - self.joy.anchoredPosition
		local dir = movePos.normalized
		local dis = movePos.magnitude
		if dis > HatMaxDistance then
			dis = HatMaxDistance
			movePos = dir * HatMaxDistance
		end

		self.hat.anchoredPosition = movePos
		GameInfoInst:refreshJoy(dir, dis / HatMaxDistance)
	end
end


return Controller
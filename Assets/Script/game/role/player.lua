local Player = class("PLayer")

local LimitAngle = 9

local function _logicMove()
	if GameInfoInst.joyPercent > 0.1 then
		UdpManagerInst:send(c_gs.CMD_Move, {
				x = GameInfoInst.joyDir.x, 
				y = GameInfoInst.joyDir.y
				})
	end
end

local function _updateMove(self)
	-- not touch
	if not GameInfoInst.joyDir and self.lastDir then
		UdpManagerInst:send(c_gs.CMD_Move, {
				x = 0,
				y = 0
			})

		self.lastDir = nil
		return
	end
	--if not GameInfoInst.joyDir then
		--self.lastDir = nil
		--return
	--end
	-- not enough touch
	if GameInfoInst.joyPercent <= 0.1 then
		return 
	end	
	
	-- not enough touch
	if self.lastDir then
		local angle = Unity.Vector2.Angle(self.lastDir, GameInfoInst.joyDir)
		if angle > 180 then
			angle = angle - 180
		end
		
		if angle <= LimitAngle then
			return
		end
	end
	
	UdpManagerInst:send(c_gs.CMD_Move, {
			x = GameInfoInst.joyDir.x,
			y = GameInfoInst.joyDir.y
		})
	self.lastDir = GameInfoInst.joyDir
end

function Player:ctor()
	self.lastDir = nil
end

function Player:update(dt)
	_updateMove(self)
end

function Player:logicUpdate(dt)
	_logicMove()
end

return Player

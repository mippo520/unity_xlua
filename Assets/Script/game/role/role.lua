local Role = class("Role")

local MoveSpeedPerSecond = 50000

local function _move(self, data)
	self.moveDir = Unity.Vector3(data.x, 0, data.y)
	local move = self.moveDir * MoveSpeedPerSecond * 0.1
	move.x = math.floor(move.x)
	move.z = math.floor(move.z)
	self.curPos = self.curPos + move
	self.moveEnd = self.curPos / 10000
end

function Role:ctor()
	self.model = nil
	self.moveEnd = nil
	self.moveDir = nil
	self.curPos = nil
	self.posY = 0
	self.actions = {
		[c_gs.CMD_Move] = _move, 
		}
end

function Role:init()
	self.model = Unity.Object.Instantiate(ResourcesManagerInst:LoadAsset("Assets/Prefabs/Role.prefab"))
	self.posY = self.model.transform.position.y
end

function Role:setStatus(status)
	self.model.transform.position = Unity.Vector3(status.x / 10000, self.posY, status.y / 10000)
	self.curPos = Unity.Vector3(status.x, self.posY * 10000, status.y)
end

function Role:doAction(action)
	local func = self.actions[action.msg]
	if func then
		func(self, action.data)
	else
		Info.Warn("Role:doAction Error! Can not found this action! action is " .. action.msg)
	end
end

function Role:update(dt)
	-- move
	if self.moveEnd and self.moveDir then
		local curPos = self.model.transform.position
		local moveDis = MoveSpeedPerSecond / 10000 * dt / 1000
		local disToEnd = Unity.Vector3.Distance(curPos, self.moveEnd)
		if disToEnd < moveDis or Tools.IsNumberEqual(disToEnd, moveDis) then
			self.model.transform.position = self.moveEnd
			--Info.Debug("Role:update ===> self.moveEnd x = " .. self.moveEnd.x .. ", y = " .. self.moveEnd.y)
			self.moveEnd = nil
			self.moveDir = nil
		else
			self.model.transform.position = curPos + self.moveDir * moveDis
		end
	end
end

function Role:stop()
	self.moveEnd = nil
	self.moveDir = nil
end

return Role
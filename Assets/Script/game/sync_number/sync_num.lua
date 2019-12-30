local SyncNum = class("SyncNum", DialogBehaviour)

local limitTime = 100

local function _frameUpdate(self, dt)
	self.showNum:set(self.showNum.value + dt * self.speed)
end

local function _move(self, data)
	self.num = self.num + data.x
	self.speed = data.x / limitTime
end

function SyncNum:ctor()
	DialogBehaviour.ctor(self)
	self.num = 0
	self.showNum = BindProperty.new(0)

	self.speed = 0
	self.actionFunc = {
		[c_gs.CMD_Move] = _move
		}
end

function SyncNum:_awake()
	local gameScene = SceneManagerInst:getCurrent()
	self:registSimpleEvent(gameScene.gcLuaObj.onFrame, _frameUpdate)
	self:DoBindProperty(self.showNum, function (self, old, cur)
			self.numText.text = cur.value
		end)
end

function SyncNum:init(num)
	self.num = num
	self.showNum:set(num)
end

function SyncNum:action(action)
	self.actionFunc[action.msg](self, action.data)
end

return SyncNum
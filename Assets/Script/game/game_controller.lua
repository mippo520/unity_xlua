local Player = require("game.role.player")

local GameController = class("GameController", Behaviour)

local LogicInterval = 50
local MaxScale = 6
local ServerTag = "battle_server"

local function _login()
	UdpManagerInst:send(c_gs.C2S_Auth, { player_id = 2, token = "" })
end

local function _heartbeat(self, msg)
	local curTime = ServerTime(ServerTag).time
	local lag = curTime - msg.ts
	local timeOffset = lag / 2 + LogicInterval / 2
	self.delayFrame = math.floor(timeOffset / LogicInterval)
	local fpsId = SceneManagerInst:getCurrent().fpsId
	local dialog = DialogManagerInst:get(fpsId)
	if dialog then
		local luaObj = Behaviour.getLuaBehaviour(dialog.res)
		luaObj:setDelay(math.floor(lag))
	end
end

local function _heartbeatTimer()
	local curTime = ServerTime(ServerTag).time
	UdpManagerInst:send(c_gs.C2S_Heartbeat, { ts = curTime })
end

local function _logicFrame(self)
	local now = ServerTime(ServerTag).time
	if now >= self.frameFinishTime then
		local frame = FrameInfoInst:pop_front()
		if frame then
			self.frameFunc[frame.__cname](self, frame)
			self.onLogicFrame:invoke(LogicInterval)			
			self.lastFrame = frame
			self.frameFinishTime = frame.ts + LogicInterval
		end
	end
	return frame
end

local function _frameUpdate(self, dt)
	local dtTmp = dt * self.frameScale
	--Info.Debug("_frameUpdate dtTmp = " .. dtTmp)
	if dtTmp > LogicInterval then
		dtTmp = LogicInterval
	end
	self.onFrame:invoke(dtTmp)
	
	if self.start then
		_logicFrame(self)
	end
	
	-- 计算是否断线
	if self.receiveFrameTime > 0 and ServerTime(ServerTag).time - self.receiveFrameTime > 5000 then
		_login()
	end
end


local function _initState(self)
	self.start = true
end

local function _syncFrame(self, msg)
	local lastFrameIdx = FrameInfoInst:parseFrames(msg)
	if lastFrameIdx >= 0 then
		UdpManagerInst:send(c_gs.Ack, { idx = lastFrameIdx })
		self.receiveFrameTime = ServerTime(ServerTag).time
	else
		Info.Warn("GameController _syncFrame Error!")
	end
end

local function _initUdp()
	--local succ = UdpManagerInst:init("116.62.45.38", 9201)
	--local succ = UdpManagerInst:init("45.79.80.134", 9201)
	local succ = UdpManagerInst:init("192.168.1.31", 9201)
	
	if succ then
		_login()
	else
		DialogManagerInst:open(DialogType.Tips, nil, _initUdp, "init udp failed!")
	end
	
end

local function _statusFrame(self, frame)
	RoleManagerInst:stop()
	RoleManagerInst:setRoleStatus(frame)
	if self.isFirstStatus then
		self.isFirstStatus = false
		TimeManagerInst:setServerTime(frame.ts, 0, ServerTag)
	end
end

local function _actionFrame(self, frame)
	RoleManagerInst:doAction(frame)
	-- 计算追帧还是延迟帧
	if frame.id > self.lastFrame.id + self.delayFrame then
		local timeOffset = LogicInterval - (ServerTime(ServerTag).time - frame.ts)
		if timeOffset < 0 or Tools.IsNumberEqual(timeOffset, 0) then
			self.frameScale = MaxScale
		else
			self.frameScale = LogicInterval / timeOffset
			if self.frameScale > MaxScale then
				self.frameScale = MaxScale
			end
		end
	else
		self.frameScale = 1
	end
end

local function _authRequest(self, msg)
	self.player.id = msg.scene_obj_id
	UdpManagerInst:send(c_gs.C2S_Ready, {})
end

function GameController:ctor()
	Behaviour.ctor(self)
	self.frameScale = 1
	self.start = fasle
	self.onFrame = SimpleEvent.new()
	self.onLogicFrame = SimpleEvent.new()
	self.frameFunc = {
			[StatusFrame.__cname] = _statusFrame, 
			[ActionFrame.__cname] = _actionFrame, 
		}
	self.player = Player.new()
	
	self.isFirstStatus = true -- 是否第一个状态包
	self.delayFrame = 0		-- 延迟帧编号
	self.lastFrame = 0		-- 上一帧
	self.frameFinishTime = 0	-- 这一帧结束时间
	self.receiveFrameTime = 0	-- 上一次收到帧的时间
end

function GameController:_awake()
	self:registEvent(Event.FrameUpdate, _frameUpdate)
	self:loopTimer(0, 1000, _heartbeatTimer, "forever")
	self:registUdpMessage(c_gs.FrameArray, _syncFrame)
	self:registUdpMessage(c_gs.S2C_Auth, _authRequest)
	self:registUdpMessage(c_gs.S2C_Heartbeat, _heartbeat)
	self.onFrame:addListener(self.player, Player.update)
	self.onLogicFrame:addListener(self.player, Player.logicUpdate)
	TimeManagerInst:setServerTime(Now(), 0, ServerTag)
end

function GameController:_start()
	_initUdp()
end

return GameController
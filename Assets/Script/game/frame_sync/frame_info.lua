local Action = require("game.frame_sync.action")
local FrameInfo = class("FrameInfo", Vector)

local function _parseStatus(msg)
	local status = StatusFrame.new()
	status.id = msg.idx
	status.ts = msg.ts
	if msg.objs and #msg.objs > 0 then
		for i, msgStatus in ipairs(msg.objs) do
			status:push_back(msgStatus)
		end
	end
	return status
end

local function _parseFrame(msg)
	local frame = ActionFrame.new()
	frame.id = msg.idx
	frame.ts = msg.ts
	if msg.acts and #msg.acts > 0 then
		for i, msgAction in ipairs(msg.acts) do
			local act = Action.new()
			act.objId = msgAction.scene_obj_id
			act.msg, act.data = UdpManagerInst:_PbUnpack(msgAction.cmd_id, msgAction.cmd)
			frame:push_back(act)
		end
	end
	return frame
end

function FrameInfo:parseFrames(msg)
	local idx = -1
	if msg.status then
		local status = _parseStatus(msg.status)
		self:clear()
		self:push_back(status)
		idx = msg.status.idx
	end

	if msg.frames and #msg.frames > 0 then
		local lastFrame = self:last()
		for i, msgFrame in ipairs(msg.frames) do
			if not lastFrame or lastFrame.id < msgFrame.idx then
				local frame = _parseFrame(msgFrame)
				self:push_back(frame)
				idx = msgFrame.idx
			end
		end
	end
	return idx
end

if not _FrameInfoInst then
	_FrameInfoInst = FrameInfo.new()
end

return _FrameInfoInst

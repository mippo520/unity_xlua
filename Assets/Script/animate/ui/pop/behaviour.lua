local Pop = class("Pop", Behaviour)

local PopDefine = require("animate.ui.pop.define")

local function _update(self, dt)
	if self.rectTransform then
		if self.state == PopDefine.State.In then
			self.timeTmp = self.timeTmp + dt
			local p = self.timeTmp / self.time
			if p >= 1.0 then
				p = 1.0
				self.state = PopDefine.State.Idle
			end
			self.rectTransform.anchoredPosition = Unity.Vector2.Lerp(self.orignPos, Unity.Vector2(0, 0), p)
		elseif self.state == PopDefine.State.Out then
			self.timeTmp = self.timeTmp + dt
			local p = self.timeTmp / self.time
			if p >= 1.0 then
				p = 1.0
				self:closeComplete()
			end
			self.rectTransform.anchoredPosition = Unity.Vector2.Lerp(Unity.Vector2(0, 0), self.orignPos, p)
		end
	end
end

function Pop:ctor()
	Behaviour.ctor(self)
	self.state = PopDefine.State.In
	self.timeTmp = 0
	self.orignPos = nil
	self.rectTransform = nil
end

function Pop:_awake()
	self:registEvent(Event.FrameUpdate, _update)
end

function Pop:_start()
	local s = Unity.Screen.safeArea
	self.rectTransform = self.gameObject:GetComponent(typeof(Unity.RectTransform))
	if self.dir == PopDefine.Dir.TopToBottom then
		self.orignPos = Unity.Vector2(self.rectTransform.anchoredPosition.x, self.rectTransform.anchoredPosition.y + s.height / ApplicationInst.deviceScale)
	elseif self.dir == PopDefine.Dir.BottomToTop then
		self.orignPos = Unity.Vector2(self.rectTransform.anchoredPosition.x, self.rectTransform.anchoredPosition.y - s.height / ApplicationInst.deviceScale)
	elseif self.dir == PopDefine.Dir.LeftToRight then
		self.orignPos = Unity.Vector2(self.rectTransform.anchoredPosition.x - 720, self.rectTransform.anchoredPosition.y)
	elseif self.dir == PopDefine.Dir.RightToLeft then
		self.orignPos = Unity.Vector2(self.rectTransform.anchoredPosition.x + 720, self.rectTransform.anchoredPosition.y)
	else
		self.state = PopDefine.State.Idle
		Info.Error("Pop:_start Error! Please set move direction!")
	end
	self.rectTransform.anchoredPosition = self.orignPos
end

function Pop:close()
	self.state = PopDefine.State.Out
	self.timeTmp = 0
	self.rectTransform.anchoredPosition = Unity.Vector2(0, 0)
end

function Pop:closeComplete()
    local rootLuaBehaviour = Behaviour.getLuaBehaviour(self.gameObject.transform.parent.gameObject)
    rootLuaBehaviour:closeComplete()
end


return Pop
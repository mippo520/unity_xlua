local ScaleTo = class("ScaleTo", Behaviour)

local function _update(self, dt)
	if self.isRun then
		self.timeAdd = self.timeAdd + dt
		if self.timeAdd >= self.time then
			self.timeAdd = self.time
			self.isRun = false
		end

		local percent = (1 - self.timeAdd / self.time)
		local scale = percent * self.beginScale + (1 - percent) * self.endScale
		self.rectTransform.localScale = Unity.Vector3(scale, scale, scale)

		if not self.isRun and self.callback then
			self.callback()
		end
	end
end

function ScaleTo:ctor()
	Behaviour.ctor(self)
	self.time = 0
	self.isRun = false
	self.timeAdd = 0
end

function ScaleTo:_awake()
	self.rectTransform = self.gameObject:GetComponent(typeof(Unity.RectTransform))
	self:registEvent(Event.FrameUpdate, _update)
end

function ScaleTo:zoom(beginScale, endScale, callback)
	if not self.time or self.time <= 0 then
		Info.Error("ScaleTo run error! Please set move time!")
		return
	end
	
	if beginScale then
		self.beginScale = beginScale
	end
	
	if endScale then
		self.endScale = endScale
	end

	self.isRun = true
	self.timeAdd = 0

	if beginPos then
		self.rectTransform.scale = Unity.Vector3(self.beginScale, self.beginScale, self.beginScale)
	end
	self.callback = callback
end

return ScaleTo
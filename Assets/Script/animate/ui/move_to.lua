local MoveTo = class("MoveTo", Behaviour)

local moveFunc = {
		Line = function (self, beginPos, endPos, time, dt)
			self.timeAdd = self.timeAdd + dt
			local t = self.timeAdd / time
			if t > 1 then
				t = 1
			end
			local result = (1 - t) * beginPos + t * endPos;
	
			if t < 1 then
				return result, true
			else
				return result, false
			end
		end, 
		
		Bezier = function (self, beginPos, endPos, time, dt)
			self.timeAdd = self.timeAdd + dt
			local t = self.timeAdd / time
			if t > 1 then
				t = 1
			end
	
			local p0p1 = (1 - t) * self.p0 + t * self.p1;
			local p1p2 = (1 - t) * self.p1 + t * self.p2;
			local result = (1 - t) * p0p1 + t * p1p2;
			if t < 1 then
				return result, true
			else
				return result, false
			end
		end
	}


local function _update(self, dt)
	if self.isMove then	
		self.rectTransform.anchoredPosition, self.isMove = self:moveFunc(self.rectTransform.anchoredPosition, self.endPos, self.moveTime, dt)
		if not self.isMove and self.callback then
			self.callback()
		end
	end
end

local function _randomP1(p0, p2)
	local a1 = CSEngineExt.RandomInt(0, 2)
	local dis = CSEngineExt.RandomInt(150, 250)
	local p1 = p0 + Unity.Vector2((1 - a1) * -dis, a1 * -dis)
	local poffset = (p2 - p0) * Unity.Random.Range(0.4, 1.0)
	p1 = p1 + poffset
	return p1
end

function MoveTo:ctor()
	Behaviour.ctor(self)
	self.endPos = nil
	self.isMove = false
	self.moveFunc = moveFunc.Bezier
	self.callback = nil
	self.timeAdd = 0
	self.moveTime = 0
	self.p0 = nil
	self.p1 = nil
	self.p2 = nil
end

function MoveTo:_awake()
	self.rectTransform = self.gameObject:GetComponent(typeof(Unity.RectTransform))
	self:registEvent(Event.FrameUpdate, _update)
end

function MoveTo:move(beginPos, endPos, callback)
	if not self.moveTime or self.moveTime <= 0 then
		Info.Error("MoveTo move error! Please set move time!")
		return
	end

	self.p0 = beginPos
	self.p1 = _randomP1(beginPos, endPos)
	self.p2 = endPos
	self.isMove = true
	self.timeAdd = 0

	if beginPos then
		self.rectTransform.anchoredPosition = beginPos
	end
	
	if endPos then
		self.endPos = endPos
	else
		Info.Error("MoveTo:move Error! Do not set a end position!")
	end
	self.callback = callback
end

return MoveTo
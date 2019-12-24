local DotDot = class("DotDot", Behaviour)

local function _dot(self)
	self.text.text = self.originText .. self.dots[self.index % self.count + 1]
	self.index = self.index + 1
end

local function _languageChange(self, language)
	self.originText = self.text.text
end

function DotDot:ctor()
	Behaviour.ctor(self)
	self.dots = {
		".",
		"..",
		"...",
		"....",
		".....",
		"......",
		}
	self.index = 0
	self.count = #self.dots
	self.originText = ""
end

function DotDot:_awake()
	self:registEvent(Event.LanguageChange, _languageChange)
	self:registEvent(Event.LanguageInit, _languageChange)
end

function DotDot:_start()
	self.originText = self.text.text
	self:loopTimer(100, 100, _dot, "forever")
end

function DotDot:destroy()
	Behaviour.destroy(self)
end

return DotDot

local GameInfo = class("GameInfo")

function GameInfo:ctor()
	self.joyDir = nil
	self.joyPercent = 0
end

function GameInfo:refreshJoy(dir, percent)
	self.joyDir = dir
	self.joyPercent = percent
end

if not _GameInfoInst then
	_GameInfoInst = GameInfo.new()
end

return _GameInfoInst

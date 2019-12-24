local Application = class("Application")

function Application:ctor()
	self.deviceScale = 1
end

function Application:deviceZoom()
	local s = Unity.Screen.safeArea
	self.deviceScale = s.width / BaseWidth
end

if not _ApplicationInst then
	_ApplicationInst = Application.new()
end

return _ApplicationInst
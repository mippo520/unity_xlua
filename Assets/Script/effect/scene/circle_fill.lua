local CircleFill = class("CircleFill", Behaviour)

function CircleFill:_awake()
	local percent = 0
	local limit = 1
end

function CircleFill:_start()
	self.renderer.material = Unity.Material(self.renderer.material)
end

function CircleFill:setPercent(percent)
	self.renderer.material:SetFloat("_Percent", percent)
	local slope = 0
	if Tools.IsNumberEqual(0, percent) then
		slope = 0
	elseif Tools.IsNumberEqual(0.5, percent) then
		slope = 0
	elseif percent <= 0.25 then
		slope = math.tan(math.pi * (0.5 - 2 * percent))
	elseif percent < 0.5 then
		slope = -math.tan(math.pi * (2 * percent - 0.5))
	elseif percent <= 0.75 then
		slope = math.tan(math.pi * (1.5 - 2 * percent))
	else
		slope = -math.tan(math.pi * (2 * percent - 1.5))
	end
	self.renderer.material:SetFloat("_Slope", slope)
end

return CircleFill
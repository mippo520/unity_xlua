local Frame = class("Frame", Vector)

function Frame:ctor()
	Vector.ctor(self)
	self.id = 0
	self.ts = 0
end

return Frame
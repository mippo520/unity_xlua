local Action = class("Action")

function Action:ctor()
	self.msg = nil
	self.data = nil
	self.objId = 0
end

return Action
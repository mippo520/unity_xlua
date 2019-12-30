local Frame = require("game.frame_sync.frame")

local ActionFrame = class("ActionFrame", Frame)

function ActionFrame:ctor()
	Frame.ctor(self)
end

return ActionFrame

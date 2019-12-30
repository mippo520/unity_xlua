local Frame = require("game.frame_sync.frame")

local StatusFrame = class("StatusFrame", Frame)

function StatusFrame:ctor()
	Frame.ctor(self)
end

return StatusFrame

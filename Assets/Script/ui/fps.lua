local FPS = class("FPS", DialogBehaviour)

local function _update(self, dt)
    self.frame = self.frame + 1
    self.dt = self.dt + dt
    if self.dt >= 1000 then
        local fps = self.frame * 1000 / self.dt
        self.fpsText.text = "fps:" .. fps
        self.frame = 0
        self.dt = 0
    end
end

function FPS:ctor()
    DialogBehaviour.ctor(self)
    self.dt = 0
    self.frame = 0
end

function FPS:_awake()
    self:registEvent(Event.FrameUpdate, _update)
end

function FPS:_start()
    self.fpsText.text = "fps:" .. self.frame
	self:setDelay(0)
end

function FPS:setDelay(delay)
	self.delayText.text = "lag:" .. delay .. "ms"
end

return FPS
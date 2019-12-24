local Preload = class("Preload", DialogBehaviour)

local valuePerFrame = 1 / 2000

function Preload:ctor()
    DialogBehaviour.ctor(self)
    self.value = 0
    self.isFinish = false
	self.finishEvent = SimpleEvent.new()
end

function Preload:_awake()
    self:registEvent(Event.FrameUpdate, Preload.frameUpdate)
    self.progress.value = 0
end


function Preload:frameUpdate(dt)
    if not self.isFinish and self.progress.value < self.value then
        self.progress.value = self.progress.value + dt * valuePerFrame
        if self.progress.value >= 1 then
			self.progress.value = 1
            self.isFinish = true
            self:onceTimer(500, self.finish)
        elseif self.progress.value > self.value then
            self.progress.value = self.value
        end
    end
end

function Preload:finish()
	self.finishEvent:invoke()
    self:closeSelf()
end

return Preload
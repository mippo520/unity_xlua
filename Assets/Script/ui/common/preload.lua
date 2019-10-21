local Preload = class("Preload", DialogBehaviour)

local valuePerFrame = 1 / 1000

function Preload:ctor()
    DialogBehaviour.ctor(self)
    self.value = 0
end

function Preload:_awake()
    self:registEvent(Event.FrameUpdate, Preload.frameUpdate)
    self.progress.value = 0
end


function Preload:frameUpdate(dt)
    if self.progress.value < self.value then
        self.progress.value = self.progress.value + dt * valuePerFrame

        if self.progress.value >= 1 then
            self:finish()
            EventManagerInst:unregistEvent(Event.FrameUpdate, self)
        elseif self.progress.value > self.value then
            self.progress.value = self.value
        end
    end
end

function Preload:finish()
    Info.Debug("Preload:finish !")
    self:closeSelf()
end

return Preload
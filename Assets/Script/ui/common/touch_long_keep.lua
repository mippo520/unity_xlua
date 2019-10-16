local TouchLongKeep = class("TouchLongKeep", Behaviour)

local keepCancelDistance = 40

function TouchLongKeep:ctor()
    Behaviour.ctor(self)
    self.inKeepTime = 1000
    self.inKeepStepTime = 100

    self.keepTime = 0
    self.point = nil
    self.doKeep = false
    self.timerId = 0
end

function TouchLongKeep:onPointerClick()
    if not self.doKeep then
        self:onClick()
    end
    return false
end

function TouchLongKeep:onPointerUp()
    if self.timerId > 0 then
        self:stopTimer(self.timerId)
        self.timerId = 0
    end

    return false
end

function TouchLongKeep:onPointerDown(eventData)
    self.keepTime = Now()
    self.point = eventData.position
    self.doKeep = false
    self.timerId = self:loopTimer(self.inKeepTime, self.inKeepStepTime, self.onTimer, "forever")
    return false
end

function TouchLongKeep:onDrag(eventData)
    if not self.doKeep and self.point and Unity.Vector2.Distance(self.point, eventData.position) > keepCancelDistance then
        self.keepTime = 0
        if self.timerId > 0 then
            self:stopTimer(self.timerId)
            self.timerId = 0
        end
    end
    return false
end

function TouchLongKeep:onBeginDrag()
    return false
end

function TouchLongKeep:onEndDrag()
    return false
end

function TouchLongKeep:onKeep()
    Info.Error("Please override onKeep function to do sth.")
end

function TouchLongKeep:onLongKeep()
    Info.Error("Please override onLongKeep function to do sth.")
end

function TouchLongKeep:onClick()
    Info.Error("Please override onClick function to do sth.")
end

function TouchLongKeep:onTimer()
    if not self.doKeep then
        self:onKeep()
        self.keepTime = 0
        self.doKeep = true
    else
        self:onLongKeep()
    end
end

return TouchLongKeep
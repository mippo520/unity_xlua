local TouchLongKeep = class("TouchLongKeep", Behaviour)

local keepDuration = 1000
local keepCancelDistance = 40

function TouchLongKeep:ctor()
    Behaviour.ctor(self)
    self.keepTime = 0
    self.inKeep = false
    self.point = nil
end

function TouchLongKeep:onPointerClick()

    return false
end

function TouchLongKeep:onPointerUp()
    if self.inKeep then
        self.inKeep = false
        self.keepTime = 0
    end
    return false
end

function TouchLongKeep:onPointerDown(eventData)
    self.keepTime = Now()
    self.inKeep = true
    self.point = eventData.position
    return false
end

function TouchLongKeep:onDrag(eventData)
    if self.inKeep and self.point and Unity.Vector2.Distance(self.point, eventData.position) > keepCancelDistance then
        self.inKeep = false
    end
    return false
end

function TouchLongKeep:onBeginDrag()
    return false
end

function TouchLongKeep:onEndDrag()
    return false
end

function TouchLongKeep:onLongKeep()
    Info.Error("Please override onLongKeep function to do sth.")
end

function TouchLongKeep:_update()
    if self.inKeep and self.keepTime > 0 and Now() - self.keepTime > keepDuration then
        self.inKeep = false
        self.keepTime = 0
        if self.onLongKeep then
            self:onLongKeep()
        end
    end
end

return TouchLongKeep
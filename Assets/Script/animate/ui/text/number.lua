local Number = class("Number")
local interval = 30

function Number:ctor()
    self.completeFunc = nil
    self.runningTimer = 0
end

function Number:init(text, value, completeFunc, time)
    Tools.Assert("number" == type(value), "Number.Roll error! value is not a number!")
    local num = tonumber(text.text)
    if not num then
        text.text = 0
        return
    end
    if Tools.IsNumberEqual(value, num) then
        return
    end
    if self.runningTimer > 0 then
        TimeManagerInst:stopTimer(self.runningTimer)
        self.completeFunc()
    end

    local numOffset = value - num
    local count = time / interval
    local numStep = numOffset / count
    self.runningTimer = TimeManagerInst:loopTimer(0, interval, nil, function (_, timer)
        if timer:getCount() <= 0 then
            text.text = tostring(value)
            self.runningTimer = 0
            self.completeFunc()
        else
            num = num + numStep
            text.text = tostring(math.floor(num))
        end
    end, count)
    self.completeFunc = completeFunc
end

function Number:stop()
    TimeManagerInst:stopTimer(self.runningTimer)
    self.runningTimer = 0
end

return Number
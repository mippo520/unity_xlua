local Number = class("Number")

local interval = 30

local TextInAnimate = {}

function Number.Roll(text, value, time)
    Tools.Assert("number" == type(value), "Number.Roll error! value is not a number!")
    local num = tonumber(text.text)
    if not num then
        text.text = 0
        return
    end
    if Tools.IsNumberEqual(value, num) then
        return
    end
    local numOffset = value - num
    local timerId = TextInAnimate[text]
    if timerId then
        TimeManagerInst:stopTimer(timerId)
    end

    local count = time / interval
    local numStep = math.floor(numOffset / count)
    TextInAnimate[text] = TimeManagerInst:loopTimer(0, interval, nil, function (_, timer)
        if timer:getCount() <= 0 then
            text.text = tostring(value)
            TextInAnimate[text] = nil
        else
            num = num + numStep
            text.text = tostring(num)
        end
    end, count)
end

return Number
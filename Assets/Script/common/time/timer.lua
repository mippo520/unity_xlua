local Timer = class("Timer")

function Timer:ctor(id, time, obj, func, interval, count)
    self._id = id
    self._time = time
    self._obj = obj
    self._func = func
    self._interval = interval
    self._count = count
    self._handler = handler(obj, func)
end

function Timer:call()
    self._handler()
end

function Timer:updateTime()
    if not self._interval or not self._count or 0 == self._count then
        return false
    else
        self._time = self._time + self._interval
        if "number" == type(self._count) and self._count > 0 then
            self._count = self._count - 1
        end
        return true
    end
end

return Timer

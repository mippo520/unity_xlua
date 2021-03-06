local Timer = class("Timer")

function Timer:ctor(id, time, obj, func, interval, count, ...)
    self._id = id
    self._time = time
    self._obj = obj
    self._func = func
    self._interval = interval
    if "number" ~= type(count) then
        count = -1
    else
        count = math.floor(count)
        if count <= 0 then
            count = -1
        else
            count = count - 1
        end
    end
    self._count = count
    self._handler = handler(obj, func)
    self._args = {...}
end

function Timer:call()
    self._handler(self, table.unpack(self._args))
end

function Timer:updateTime()
    if not self._interval or self._interval <= 0 or not self._count or 0 == self._count then
        return false
    else
        self._time = self._time + self._interval
        if "number" == type(self._count) and self._count > 0 then
            self._count = self._count - 1
        end
        return true
    end
end

function Timer:getCount()
	if self._count < 0 then
		return 1
	end
    return self._count
end

return Timer

local Timer = class("Timer")

function Timer:ctor(id, time, obj, func)
    self._id = id
    self._time = time
    self._obj = obj
    self._handler = handler(obj, func)
end

function Timer:getTime()
    return self._time
end

function Timer:getObj()
    return self._obj
end

function Timer:getId()
    return self._id
end

function Timer:call()
    self._handler()
end

return Timer

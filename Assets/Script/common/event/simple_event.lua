local SimpleEvent = class("SimpleEvent")

function SimpleEvent:ctor()
    self.mapListeners = {}
end

function SimpleEvent:addListener(obj, func)
    if self.mapListeners[obj] then
        Info.Error("SimpleEvent:addListener error! obj " .. tostring(obj) .. " is already added!")
    else
        self.mapListeners[obj] = handler(obj, func)
    end
end

function SimpleEvent:removeListener(obj)
    if not self.mapListeners[obj] then
        Info.Error("SimpleEvent:removeListener error! obj " .. tostring(obj) .. " is not added!")
    else
        self.mapListeners[obj] = nil
    end
end

function SimpleEvent:Invoke(...)
    for _, v in pairs(self.mapListeners) do
        v(...)
    end
end

return SimpleEvent
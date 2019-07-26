local BindProperty = class("BindProperty")

function BindProperty:ctor(value)
    self.type = type(value)
    self.value = value
    self.mapListeners = {}
end

function BindProperty:set(value)
    Tools.Assert(self.type == type(value), "BindProperty set value type error! Object type is " .. self.type .. ", value type is " .. type(value))
    local bChanged = self.value ~= value
    if bChanged then
        local old = self.value
        self.value = value
        for _, handler in pairs(self.mapListeners) do
            handler(old, self.value)
        end
    end
end

function BindProperty:setRawly(value)
    self.value = value
end

function BindProperty:get()
    return self.value
end

function BindProperty:bind(obj, func)
    if not self.mapListeners[obj] then
        self.mapListeners[obj] = handler(obj, func)
    else
        Info.Error(obj.class.__cname .. " is already bind!")
    end
end

function BindProperty:unbind(obj)
    if self.mapListeners[obj] then
        self.mapListeners[obj] = nil
    end
end

return BindProperty

local BindProperty = class("BindProperty")

function BindProperty:ctor(value)
    self.type = type(value)
    self.value = value
    self.mapListeners = {}
end

function BindProperty:set(value)
    if type(nil) ~= self.type then
        Tools.Assert(self.type == type(value), "BindProperty set value type error! Object type is " .. self.type .. ", value type is " .. type(value))
    end
    local bChanged = false
    if "number" == self.type then
        bChanged = not Tools.IsNumberEqual(self.value, value)
    else
        bChanged = self.value ~= value
    end
    
    if bChanged then
        local old = clone(self)
        self.value = value
        self:fire(old, self)
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
        self.mapListeners[obj] = {}
    end
    if not self.mapListeners[obj][func] then
        local handler = handler(obj, func)
        self.mapListeners[obj][func] = handler
        handler(self, self)
    else
        Info.Error(obj.class.__cname .. " is already bind!")
    end
end

function BindProperty:unbind(obj)
    if self.mapListeners[obj] then
        self.mapListeners[obj] = nil
    end
end

function BindProperty:fire(old, cur)
    for _, listener in pairs(self.mapListeners) do
        for _, handler in pairs(listener) do
            handler(old, cur)
        end
    end
end

return BindProperty

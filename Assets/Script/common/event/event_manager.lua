local EventManager = class("EventManager")

local sInstance = nil

function EventManager.GetInstance()
    if nil == sInstance then
        sInstance = EventManager.new()
    end
    return sInstance
end

function EventManager:ctor()
    self.mapOjbEvent = {}
    self.mapEventFunc = {}
    self.mapFireEvent = {}
    self.mapDelObjEvent = {}
    self.mapDelObj = {}
end

function EventManager:RegistEvent(event, obj, method)
    if not obj or not method then
        Info.Error("EventManager:AddEvent error! ", obj, method)
        return
    end
    if self.mapOjbEvent[obj] and self.mapOjbEvent[obj][event] then
        Info.Error(obj.class.__cname .. " is already Added event " .. event)
        return
    end

    local mapEvent = self.mapOjbEvent[obj]
    if not mapEvent then
        mapEvent = {}
        self.mapOjbEvent[obj] = mapEvent
    end
    self.mapOjbEvent[obj][event] = 1

    local mapFunc = self.mapEventFunc[event]
    if not mapFunc then
        mapFunc = {}
        self.mapEventFunc[event] = mapFunc
    end
    mapFunc[obj] = handler(obj, method)
end

function EventManager:UnregistEvent(event, obj)
    if not obj then
        Info.Error("EventManager:DelEvent error! ", obj)
        return
    end

    if self.mapOjbEvent[obj] and self.mapOjbEvent[obj][event] then
        self.mapOjbEvent[obj][event] = nil
    end

    if self.mapEventFunc[event] and self.mapEventFunc[event][obj] then
        self.mapEventFunc[event][obj] = nil
    end

    if not self.mapDelObjEvent[obj] then
        self.mapDelObjEvent[obj] = {}
    end
    self.mapDelObjEvent[obj][event] = 1
end

function EventManager:DelObject(obj)
    if not obj then
        Info.Error("EventManager:DelObject error! ", obj)
        return
    end

    local mapObjEvent = self.mapOjbEvent[obj]
    if mapObjEvent then
        for k, v in pairs(mapObjEvent) do
            if self.mapEventFunc[k] and self.mapEventFunc[k][obj] then
                self.mapEventFunc[k][obj] = nil
            end
        end
        self.mapOjbEvent[obj] = nil
    end
    self.mapDelObj[obj] = 1
end

function EventManager:FireEvent(event, ...)
    if not self.mapFireEvent[event] then
        self.mapFireEvent[event] = {...}
    end
end

function EventManager:Update()
    local mapFireEvent = self.mapFireEvent
    self.mapFireEvent = {}
    for event, args in pairs(mapFireEvent) do
        local mapHandler = self.mapEventFunc[event]
        for obj, handler in pairs(mapHandler) do
            if not self.mapDelObj[obj] and (not self.mapDelObjEvent[obj] or not self.mapDelObjEvent[obj][event]) then
                handler(table.unpack(args))
            end
        end
    end

    self.mapDelObjEvent = {}
    self.mapDelObj = {}
end

return EventManager
--[[ 自动管理事件的对象,该对象注册的事件会在该对象destroy调用时被注销 ]]

local AutoObject = class("AutoObject")

function AutoObject:ctor()
    self.registedEvent = {}
    self.arrBindpropertys = {}
    self.mapTimers = {}
    self.simpleEvent = {}
end

function AutoObject:destroy()
    -- 移除注册事件
    for i, v in ipairs(self.registedEvent) do
        v:RemoveAllListeners()
        v:Invoke()
    end
    self.registedEvent = {}

    -- 移除注册simple事件
    for i, v in ipairs(self.simpleEvent) do
        v:removeListener(self)
    end
    self.simpleEvent = {}

    -- 移除绑定属性
    for i, v in ipairs(self.arrBindpropertys) do
        v:unbind(self)
    end
    self.arrBindpropertys = {}

    -- 移除定时器
    for k, _ in pairs(self.mapTimers) do
        TimeManagerInst:stopTimer(k)
    end
    self.mapTimers = {}

    -- 移除注册的事件
    EventManagerInst:delObject(self)

    -- 移除网络消息
    NetManagerInst:unregistMessage(self)
end

-- 调用unityEvent的AddListener,会在对象destroy的时候移除
function AutoObject:addListener(unityEvent, callback)
    unityEvent:AddListener( handler(self, callback))
    table.insert(self.registedEvent, unityEvent)
end

-- 注册全局事件,会在对象destroy的时候移除
function AutoObject:registEvent(event, callback)
    EventManagerInst:registEvent(event, self, callback)
end

-- 注册SimpleEvent事件,会在对象destroy的时候移除
function AutoObject:registSimpleEvent(event, callback)
    event:addListener(self, callback)
    table.insert(self.simpleEvent, event)
end

-- 注册网络消息,会在对象destroy的时候移除
function AutoObject:registMessage(msg, callback)
    NetManagerInst:registMessage(msg, self, callback)
end

-- 注册一次性定时器,会在对象destroy的时候移除
function AutoObject:onceTimer(interval, func, ...)
    local id = 0
    id = TimeManagerInst:onceTimer(interval, nil, function (_, ...)
        self.mapTimers[id] = nil
        func(self, ...)
    end, ...)
    self.mapTimers[id] = 1
end

-- 注册循环定时器,会在对象destroy的时候移除
function AutoObject:loopTimer(firstInterval, interval, func, count, ...)
    local id = 0
    id = TimeManagerInst:loopTimer(firstInterval, interval, nil, function (_, timer, ...)
        if timer:getCount() <= 0 then
            self.mapTimers[id] = nil
        end
        func(self, timer, ...)
    end, count, ...)
    self.mapTimers[id] = 1
end

-- 参数绑定,会在对象destroy的时候解绑
function AutoObject:DoBindProperty(property, func)
    property:bind(self, func)
    table.insert(self.arrBindpropertys, property)
end

return AutoObject

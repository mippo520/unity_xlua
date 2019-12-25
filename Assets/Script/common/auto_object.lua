--[[ 自动管理事件的对象,该对象注册的事件会在该对象destroy调用时被注销 ]]

local AutoObject = class("AutoObject")

function AutoObject:ctor()
    self.registedEvent = {}
    self.arrBindpropertys = {}
    self.mapTimers = {}
    self.simpleEvent = {}
    self.AssetBundles = {}      
    self.arrInstantiateObj = {} 
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

    -- 移除实例化对象
    if self.arrInstantiateObj and #self.arrInstantiateObj > 0 then
        for _, v in ipairs(self.arrInstantiateObj) do
            Unity.Object.Destroy(v)
        end
    end

    -- 卸载资源
    if self.AssetBundles and #self.AssetBundles > 0 then
        ResourcesManagerInst:UnloadAssetBundle(self.AssetBundles)
    end
    self.AssetBundles = {}

    -- 移除注册的事件
    EventManagerInst:delObject(self)

    -- 移除网络消息
    TcpManagerInst:unregistMessage(self)
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
    TcpManagerInst:registMessage(msg, self, callback)
end

-- 注册一次性定时器,会在对象destroy的时候移除
function AutoObject:onceTimer(interval, func, ...)
    local id = 0
    id = TimeManagerInst:onceTimer(interval, nil, function (_, ...)
        self.mapTimers[id] = nil
        func(self, ...)
    end, ...)
    self.mapTimers[id] = 1
    return id
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
    return id
end

function AutoObject:stopTimer(id)
    TimeManagerInst:stopTimer(id)
    self.mapTimers[id] = nil
end

-- 参数绑定,会在对象destroy的时候解绑
function AutoObject:DoBindProperty(property, func)
    property:bind(self, func)
    table.insert(self.arrBindpropertys, property)
end

-- 异步加载AssetBundle,会在对象destroy的时候移除
function AutoObject:LoadAssetBundleAsync(arrRes, processCallback, completeCallback)
	for _, v in pairs(arrRes) do
		table.insert(self.AssetBundles, v)
	end
    ResourcesManagerInst:LoadAssetBundleAsync(arrRes, processCallback, completeCallback)
end

function AutoObject:UnloadAssetBundles(arrRes)
    ResourcesManagerInst:UnloadAssetBundle(arrRes)
    for _, resDel in pairs(arrRes) do
        for i, res in ipairs(self.AssetBundles) do
            if resDel == res then
                table.remove(self.AssetBundles, i)
                break
            end
        end
    end
end

-- 加载Asset
function AutoObject:LoadAsset(path)
    return ResourcesManagerInst:LoadAsset(path)
end

-- 实例化prefabs,会在对象destroy时删除
function AutoObject:Instantiate(...)
    local res = Unity.Object.Instantiate(...)
    table.insert(self.arrInstantiateObj, res)
    return res
end

function AutoObject:Destroy(prefab)
    Unity.Object.Destroy(prefab)
    for i, v in ipairs(self.arrInstantiateObj) do
        if v == prefab then
            table.remove(self.arrInstantiateObj, i)
            break
        end
    end
end

return AutoObject

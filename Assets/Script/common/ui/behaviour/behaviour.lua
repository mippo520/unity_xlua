
local Behaviour = class("Behaviour")

function Behaviour:ctor()
    self.registedEvent = {}
    self.id = 0
    self.arrBindpropertys = {}
end

function Behaviour:awakeLogic()
    self.gameObject = self.behaviourObject.gameObject
    self.luaScript = self.behaviourObject.luaScript
    self.id = self.behaviourObject.id
end

function Behaviour:awake()
    self:awakeLogic()
    if self._awake then
        self:_awake()
    end
end

function Behaviour:startLogic()

end

function Behaviour:start()
    self:startLogic()
    if self._start then
        self:_start()
    end
end

function Behaviour:update()
    if self._update then
        self:_update()
    end
end

function Behaviour:destroy()
    for i, v in ipairs(self.registedEvent) do
        v:RemoveAllListeners()
        v:Invoke()
    end
    self.registedEvent = {}

    for i, v in ipairs(self.arrBindpropertys) do
        v:unbind(self)
    end

    if self._destroy then
        self:_destroy()
    end

    EventManagerInst:delObject(self)
    NetManagerInst:unregistMessage(self)
    BehaviourManager.remove(self.id)
end

-- 获取gameObject的lua对象
function Behaviour.getLuaBehaviour(gameOjbect)
    local scriptBehaviour = gameOjbect:GetComponent(typeof(CSLuaBehaviour))
    return BehaviourManager.getBehaviour(scriptBehaviour.id)
end

-- 调用unityEvent的AddListener,会在对象destroy的时候移除
function Behaviour:addListener(unityEvent, callback)
    unityEvent:AddListener(callback)
    table.insert(self.registedEvent, unityEvent)
end

-- 注册事件,会在对象destroy的时候移除
function Behaviour:registEvent(event, callback)
    EventManagerInst:registEvent(event, self, callback)
end

-- 注册网络消息,会在对象destroy的时候移除
function Behaviour:registMessage(msg, callback)
    NetManagerInst:registMessage(msg, self, callback)
end

-- 异步加载AssetBundle,会在对象destroy的时候移除
function Behaviour:LoadAssetBundleAsync(arrRes, processCallback, completeCallback)
    local dialog = DialogManagerInst:get(self.id)
    if not dialog then
        Info.Error("Behaviour:LoadAssetBundleAsync error! " .. self.id .. " is not exist!")
        return
    end
    ResourcesManagerInst:LoadAssetBundleAsync(arrRes, processCallback, completeCallback)
    for k, v in pairs(arrRes) do
        table.insert(dialog.data.AssetBundles, v)
    end
end

-- 参数绑定,会在对象destroy的时候解绑
function Behaviour:DoBindProperty(property, func)
    property:bind(self, func)
    table.insert(self.arrBindpropertys, property)
end

-- 加载Asset
function Behaviour:LoadAsset(path)
    return ResourcesManagerInst:LoadAsset(path)
end

-- 启动协程
function Behaviour:StartCoroutine(...)
    return self.behaviourObject:StartCoroutine(XLuaUtil.cs_generator(...))
end

-- 结束协程
function Behaviour:StopCoroutine(co)
    return self.behaviourObject:StopCoroutine(co)
end


return Behaviour

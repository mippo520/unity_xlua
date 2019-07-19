
local Behaviour = class("Behaviour")

function Behaviour:ctor()
    self.registedEvent = {}
    self.id = 0
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
    self:awakeLogic()
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
    if self._destroy then
        self:_destroy()
    end

    EventManagerInst:delObject(self)
    NetManagerInst:unregistMessage(self)
    BehaviourManager.remove(self.id)
end

function Behaviour:addListener(unityEvent, callback)
    unityEvent:AddListener(callback)
    table.insert(self.registedEvent, unityEvent)
end

function Behaviour:registEvent(event, callback)
    EventManagerInst:registEvent(event, self, callback)
end

function Behaviour:registMessage(msg, callback)
    NetManagerInst:registMessage(msg, self, callback)
end

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

function Behaviour:LoadAsset(path)
    return ResourcesManagerInst:LoadAsset(path)
end

function Behaviour:closeSelf()
    DialogManagerInst:close(self.id)
end

function Behaviour:StartCoroutine(...)
    return self.behaviourObject:StartCoroutine(XLuaUtil.cs_generator(...))
end

function Behaviour:StopCoroutine(co)
    return self.behaviourObject:StopCoroutine(co)
end


return Behaviour

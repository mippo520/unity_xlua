
local Behaviour = class("Behaviour")

function Behaviour:ctor()
    self.registedEvent = {}
    self.id = 0
end

function Behaviour:awake()
    if self._awake then
        self:_awake()
    end
end

function Behaviour:start()
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

    BehaviourManager.remove(self.id)
end

function Behaviour:addListener(unityEvent, callback)
    unityEvent:AddListener(callback)
    table.insert(self.registedEvent, unityEvent)
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
    return self.behaviour:StartCoroutine(XLuaUtil.cs_generator(...))
end

function Behaviour:StopCoroutine(co)
    return self.behaviour:StopCoroutine(co)
end


return Behaviour

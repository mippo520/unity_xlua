
local Behaviour = class("Behaviour", AutoObject)

function Behaviour:ctor()
    AutoObject.ctor(self)
    self.mapAnimate = {}
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
    AutoObject.destroy(self)

    -- 停止动画
    for k, _ in pairs(self.mapAnimate) do
        k:stop()
    end
    self.mapAnimate = {}

    BehaviourManager.remove(self.id)
end

-- 获取gameObject的lua对象
function Behaviour.getLuaBehaviour(gameOjbect)
    local scriptBehaviour = gameOjbect:GetComponent(typeof(CSLuaBehaviour))
    return scriptBehaviour.luaBehaviour
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

-- 绑定Text控件,会在对象destroy的时候解绑
function Behaviour:DoBindText(property, text, animate, ...)
    local arg = {...}
    self:DoBindProperty(property, function (self, oldValue, curValue)
        if not animate then
            if "string" == type(curValue) then
                text.text = curValue
            else
                text.text = tostring(curValue)
            end
        else
            local ani = animate.new()
            ani:init(text, curValue, function ()
                self.mapAnimate[ani] = nil
            end, table.unpack(arg))
            self.mapAnimate[ani] = true
        end
    end)
end

-- 双向绑定InputField控件,会在对象destroy的时候解绑
function Behaviour:DoBindInputField(property, input)
    self:DoBindProperty(property, function (self, oldValue, curValue)
        if "string" == type(curValue) then
            input.text = curValue
        else
            input.text = tostring(curValue)
        end
    end)

    self:addListener(input.onValueChanged, function ()
        property:set(input.text)
    end)
end

-- 双向绑定Slider控件,会在对象destroy的时候解绑
function Behaviour:DoBindSlider(property, slider)
    self:DoBindProperty(property, function (self, oldValue, curValue)
        if "number" == type(curValue) then
            slider.value = curValue
        else
            slider.value = tonumber(curValue)
        end
    end)

    self:addListener(slider.onValueChanged, function ()
        property:set(slider.value)
    end)
end

-- 加载Asset
function Behaviour:LoadAssetAs(path, type)
    return ResourcesManagerInst:LoadAsset(path, type)
end

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
local login = class("login", DialogBehaviour)
local NumberAni = require("animate.ui.text.number")

function login:ctor()
    DialogBehaviour.ctor(self)
    self.value = BindProperty.new(0)
    self.sliderValue = BindProperty.new(0)
end

function login:_awake()
    self:DoBindText(self.value, self.testText, NumberAni, 1000)
    self:DoBindText(Version, self.version)
    self:DoBindInputField(AccountDataInst.username, self.username)
    self:DoBindInputField(AccountDataInst.password, self.password)
    self:DoBindProperty(AccountDataInst.username, function ()
        StorageInst:set(StorageKey.username, AccountDataInst.username:get())
    end)
    self:DoBindProperty(AccountDataInst.password, function ()
        StorageInst:set(StorageKey.password, AccountDataInst.password:get())
    end)

    self:DoBindSlider(self.sliderValue, self.slider)
    -- self:DoBindText(self.sliderValue, self.testText)

end


function login:_start()
    -- self:StartCoroutine(function ()
    --     coroutine.yield(Unity.WaitForSeconds(1))

    --     Info.Debug("coroutine!")
    -- end)

    self:addListener(self.loginBtn.onClick, function ()
        -- LoginControllerInst:login(self.username.text, self.password.text)
        -- DialogManagerInst:clearAll()
        self:LoadAssetBundleAsync({"test_ui_png"}, nil, function ()
            self.background.sprite = Sprite.Create(self:LoadAssetAs("Assets/Prefabs/home_menu.png"))
        end)
        -- self:closeSelf()
    end)

    self:addListener(self.registBtn.onClick, function ()
        -- self:closeSelf()
        -- DialogManagerInst:open(DialogType.Regist)
        -- if not self.diaId then
        --     self.diaId = DialogManagerInst:open(DialogType.Regist)
        -- else
        --     DialogManagerInst:close(self.diaId)
        --     self.diaId = nil
        -- end

        -- if LanguageType.en == LanguageManagerInst:getLanguage() then
        --     LanguageManagerInst:setLanguage(LanguageType.zh)
        -- else
        --     LanguageManagerInst:setLanguage(LanguageType.en)
        -- end
        -- AccountDataInst.username:set(AccountDataInst.username:get() .. "abc")
        self.value:set(self.value:get() + 100)
        -- self.sliderValue:set(self.sliderValue:get() - 0.1)
    end)
end

return login

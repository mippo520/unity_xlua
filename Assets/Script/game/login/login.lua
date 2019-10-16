local login = class("login", DialogBehaviour)
local NumberAni = require("animate.ui.text.number")
local LoginController = require("game.login.login_controller")

function login:ctor()
    DialogBehaviour.ctor(self)
    self.ctrl = LoginController.new()

end

function login:_awake()
    self:DoBindText(Version, self.version)
    self:DoBindInputField(AccountDataInst.username, self.username)
    self:DoBindInputField(AccountDataInst.password, self.password)
    
    self:registEvent(Event.LoginSuccess, function ()
        self:closeSelf()
    end)
end


function login:_start()

    self:addListener(self.loginBtn.onClick, function ()
        self.ctrl:login()
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
        -- self.value:set(self.value:get() + 100)
        -- self.sliderValue:set(self.sliderValue:get() - 0.1)
        -- spineState:AddAnimation(0, "main", true, 0);
        DialogManagerInst:open(DialogType.SpecialUITest)
    end)

    self:addListener(self.simBtn.onClick, function ()
        Progress:enterGame()
    end)

end

return login

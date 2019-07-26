local login = class("login", DialogBehaviour)

function login:ctor()
    DialogBehaviour.ctor(self)
    self.value = BindProperty.new("")
end

function login:_awake()
    self:DoBindProperty(self.value, function (self, oldVlue, curValue)
        self.username.text = curValue
    end)
end


function login:_start()
    -- self:StartCoroutine(function ()
    --     coroutine.yield(Unity.WaitForSeconds(1))

    --     Info.Debug("coroutine!")
    -- end)

    self:addListener(self.loginBtn.onClick, function ()
        -- LoginControllerInst:login(self.username.text, self.password.text)
        -- DialogManagerInst:clearAll()
        self.value:set("abc") 
    end)

    self:addListener(self.registBtn.onClick, function ()
        -- self:closeSelf()
        -- DialogManagerInst:open(DialogType.Regist)
        if not self.diaId then
            self.diaId = DialogManagerInst:open(DialogType.Regist)
        else
            DialogManagerInst:close(self.diaId)
            self.diaId = nil
        end

        if LanguageType.en == LanguageManagerInst:getLanguage() then
            LanguageManagerInst:setLanguage(LanguageType.zh)
        else
            LanguageManagerInst:setLanguage(LanguageType.en)
        end
    end)
end

return login

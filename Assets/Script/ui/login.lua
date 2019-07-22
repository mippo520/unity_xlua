local login = class("login", DialogBehaviour)

function login:_start()
    -- self:StartCoroutine(function ()
    --     coroutine.yield(Unity.WaitForSeconds(1))

    --     Info.Debug("coroutine!")
    -- end)
    local input = self.wrap.transform:GetChild(1).gameObject:GetComponent(typeof(UnityUI.InputField))

    local input1 = self.wrap.transform:GetChild(2).gameObject:GetComponent(typeof(UnityUI.InputField))

    local loginBtn = self.wrap.transform:GetChild(4).gameObject:GetComponent(typeof(UnityUI.Button))
    self:addListener(loginBtn.onClick, function ()
        -- LoginControllerInst:login(input.text, input1.text)
        DialogManagerInst:clearAll()
    end)

    local registBtn = self.wrap.transform:GetChild(3).gameObject:GetComponent(typeof(UnityUI.Button))
    self:addListener(registBtn.onClick, function ()
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

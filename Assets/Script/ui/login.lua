local login = class("login", Behaviour)


function login:_start()
    -- self:StartCoroutine(function ()
    --     coroutine.yield(Unity.WaitForSeconds(1))

    --     Info.Debug("coroutine!")
    -- end)

    local input = self.gameObject.transform:GetChild(1).gameObject:GetComponent(typeof(UnityUI.InputField))

    local input1 = self.gameObject.transform:GetChild(2).gameObject:GetComponent(typeof(UnityUI.InputField))

    local loginBtn = self.gameObject.transform:GetChild(4).gameObject:GetComponent(typeof(UnityUI.Button))
    self:addListener(loginBtn.onClick, function ()
        LoginControllerInst:login(input.text, input1.text)
    end)

    local registBtn = self.gameObject.transform:GetChild(3).gameObject:GetComponent(typeof(UnityUI.Button))
    self:addListener(registBtn.onClick, function ()
        -- self:closeSelf()
        -- DialogManagerInst:open(DialogType.Regist)

        if LanguageType.en == LanguageManagerInst:getLanguage() then
            LanguageManagerInst:setLanguage(LanguageType.zh)
        else
            LanguageManagerInst:setLanguage(LanguageType.en)
        end
    end)
end

return login

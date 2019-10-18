local LanguageBehaviour = class("LanguageBehaviour", Behaviour)

local function _languageChange(self, language)
    self.gameObject.transform:GetComponent(typeof(UnityUI.Text)).text = LanguageManagerInst:getContent(self.key)
end

function LanguageBehaviour:_awake()
    self.gameObject.transform:GetComponent(typeof(UnityUI.Text)).text = LanguageManagerInst:getContent(self.key)
    self:registEvent(Event.LanguageChange, _languageChange)
end


return LanguageBehaviour

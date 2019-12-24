local LanguageBehaviour = class("LanguageBehaviour", Behaviour)

local function _languageChange(self, language)
    self.gameObject.transform:GetComponent(typeof(UnityUI.Text)).text = LanguageManagerInst:getContent(self.key)
end

function LanguageBehaviour:ctor()
	Behaviour.ctor(self)
	self.executeInEditMode = true
end

function LanguageBehaviour:_awake()
	if CS.UnityEngine.RuntimePlatform.WindowsEditor ~= CS.UnityEngine.Application.platform and CS.UnityEngine.RuntimePlatform.OSXEditor ~= CS.UnityEngine.Application.platform then
	    self.gameObject.transform:GetComponent(typeof(UnityUI.Text)).text = LanguageManagerInst:getContent(self.key)
	else
		if Unity.Application.isPlaying then
			self.gameObject.transform:GetComponent(typeof(UnityUI.Text)).text = LanguageManagerInst:getContent(self.key)
		else
			self.gameObject.transform:GetComponent(typeof(UnityUI.Text)).text = self.key
		end
	end
	self:registEvent(Event.LanguageChange, _languageChange)
	self:registEvent(Event.LanguageInit, _languageChange)
end


return LanguageBehaviour

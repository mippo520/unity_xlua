local Toast = class("Toast", DialogBehaviour)

function Toast:ctor()
    DialogBehaviour.ctor(self)
end

function Toast:setValues(content, title, closeDelayMS)
	if nil ~= title then
		self.title.text = LanguageManagerInst:getContent(title)
	else
		self.title.text = LanguageManagerInst:getContent("Notice")
	end
	
    self.content.text = LanguageManagerInst:getContent(content)

    if not closeDelayMS then
		closeDelayMS = 2000
    end
	if closeDelayMS ~= 0 then
		self:onceTimer(closeDelayMS, self.closeSelf)
	end
end

return Toast

local DialogBehaviour = class("DialogBehaviour", Behaviour)

local function _languageChange(self)
    for k, v in pairs(self.mapFormatText) do
        k.text = string.format( LanguageManagerInst:getContent(v.key), table.unpack(v.args) ) 
    end
end

function DialogBehaviour:ctor()
    Behaviour.ctor(self)
    self.wrap = nil
    self.mapFormatText = {}
	self.bg = nil
end

function DialogBehaviour:awakeLogic()
    Behaviour.awakeLogic(self)
	if self.gameObject.transform.childCount > 1 then
		self.bg = self.gameObject.transform:GetChild(0)
	end
    local wrap = self.gameObject.transform:Find("wrap")
    if not wrap then
        Info.Error("Please set a wrap level!")
    else
        self.wrap = wrap.gameObject
    end
    self:registEvent(Event.LanguageChange, _languageChange)
end

-- 关闭自己
function DialogBehaviour:closeSelf()
    DialogManagerInst:close(self.id)
end

function DialogBehaviour:close()
    local luaWrap = Behaviour.getLuaBehaviour(self.wrap)
    luaWrap:close()
	
	if self.bg then
		local luaBG = Behaviour.getLuaBehaviour(self.bg)
		if luaBG.close then
			luaBG:close()
		end
	end
end

function DialogBehaviour:closeComplete()
    local dialog = DialogManagerInst:get(self.id)
    dialog:closeComplete()
end

function DialogBehaviour:setFormatText(text, key, ...)
    local strFormat = LanguageManagerInst:getContent(key)
    if not strFormat then
        strFormat = key
    end
    text.text = string.format( strFormat, ... ) 
    self.mapFormatText[text] = {
        key = key,
        args = {...}
    }
end

function DialogBehaviour:destroy()
    Behaviour.destroy(self)
    self.mapFormatText = nil
    DialogManagerInst:destroy(self.id)
end

return DialogBehaviour

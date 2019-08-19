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
end

function DialogBehaviour:awakeLogic()
    Behaviour.awakeLogic(self)
    local wrap = self.behaviourObject.gameObject.transform:Find("wrap")
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
end

function DialogBehaviour:closeComplete()
    local dialog = DialogManagerInst:get(self.id)
    dialog:closeComplete()
end

function DialogBehaviour:setFormatText(text, key, ...)
    text.text = string.format( LanguageManagerInst:getContent(key), ... ) 
    self.mapFormatText[text] = {
        key = key,
        args = {...}
    }
end

return DialogBehaviour
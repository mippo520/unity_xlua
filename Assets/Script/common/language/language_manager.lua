
local LanguageManager = class("LanguageManager")

function LanguageManager:ctor()
    self.language = LanguageType.zh
    self.lan_script = {
        [LanguageType.zh] = require("cfg.language.zh"), 
        [LanguageType.en] = require("cfg.language.en"), 
    }
end

function LanguageManager:getContent(key)
    return self.lan_script[self.language][key]
end

function LanguageManager:setLanguage(lan)
    if self.language == lan then
        return
    end
    
    if not LanguageType[lan] then
        Info.Debug("set language error! " .. lan .. " not exist!")
        return 
    end

    self.language = lan
    EventManagerInst:fireEvent(Event.LanguageChange, self.language)
end

function LanguageManager:getLanguage()
    return  self.language
end

if not _LanguageManagerInst then
    _LanguageManagerInst = LanguageManager.new()
end
return _LanguageManagerInst
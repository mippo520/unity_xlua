
local LanguageManager = class("LanguageManager")


local sInstance = nil

function LanguageManager.GetInstance()
    if nil == sInstance then
        sInstance = LanguageManager.new()
    end
    return sInstance
end

function LanguageManager:ctor()
    self.language = LanguageType.zh
    self.en = require("cfg.language.en")
    self.zh = require("cfg.language.zh")
end

function LanguageManager:getContent(key)
    return self[self.language][key]
end

function LanguageManager:setLanguage(lan)
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

return LanguageManager

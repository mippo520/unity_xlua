
local LanguageManager = class("LanguageManager")

function LanguageManager:ctor()
    self.language = LanguageType[DefaultLanguage]
    self.lan_script = {}
end

function LanguageManager:init()
    for _, v in pairs(LanguageType) do
        local cfgLoader = CfgLoader.new()
        cfgLoader.path = "Assets/Config/language/cfg_characters" .. v .. ".json"
        cfgLoader:init()
        local lan_content = {}
        for _, c in ipairs(cfgLoader.content) do
            lan_content[c.id] = c.text
        end
        self.lan_script[v] = lan_content
    end
end

function LanguageManager:getContent(key)
    local content = self.lan_script[self.language][key]
    if not content or "" == content then
        content = key
    end
    return content
end

function LanguageManager:setLanguage(lan)
    if self.language == lan then
        return
    end
    
    if not self.lan_script[lan] then
        Info.Error("set language error! " .. lan .. " not exist!")
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
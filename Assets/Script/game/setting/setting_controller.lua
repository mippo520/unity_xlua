local SettingController = class("SettingController")

------- private begin ----------
local function _s2c_player_settings(_, msg)
    LanguageManagerInst:setLanguage(msg.lan)
end
------- private end ----------

function SettingController:init()
    NetManagerInst:registMessage(c_gs.S2C_PlayerSettings, self, _s2c_player_settings)
end

if not _SettingControllerInst then
    _SettingControllerInst = SettingController.new()
end

return _SettingControllerInst

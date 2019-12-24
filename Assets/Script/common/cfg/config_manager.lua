local ConfigManager = class("ConfigManager")

--CfgModuleConfigInst = require("game.module_config")

function ConfigManager:init()
	--CfgModuleConfigInst:init()
end

if not _ConfigManagerInst then
    _ConfigManagerInst = ConfigManager.new()
end

return _ConfigManagerInst
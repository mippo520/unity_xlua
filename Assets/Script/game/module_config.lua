local ModuleConfig = class("ModuleConfig", CfgLoader)

function ModuleConfig:ctor()
	CfgLoader.ctor(self)
    self.path = "Assets/Config/Design/cfg_config.json"

    self.configs = {}
end

function ModuleConfig:init()
	CfgLoader.init(self)
	local content = self.content[Enum.ModuleType.Hero]
	self.configs[Enum.ModuleType.Hero] = {
			maxLv = tonumber(content["data1"]), 
			maxStar = tonumber(content["data2"])
		}
end

function ModuleConfig:get(id)
    return self.configs[id]
end

if not _ModuleConfigInst then
	_ModuleConfigInst = ModuleConfig.new()
end
return _ModuleConfigInst
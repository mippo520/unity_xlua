local scene = require("scene.scene")
local main = class("main", scene)


function main:_awake()
	scene._awake(self)
	self.name = "main"
    ConfigManagerInst:init()
end

function main:_start()
	SoundManagerInst:playMusic(SoundDefine.BeginMusicAssetBundle, SoundDefine.BeginMusicAsset)

    DialogManagerInst:open(DialogType.TestMenu)
end


return main

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
	
	UdpManagerInst:init("192.168.1.31", 9201)
	UdpManagerInst:send(c_gs.C2S_Login, {
			account_id = 100,
			token = "abc"
		})
end


return main

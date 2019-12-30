local scene = require("scene.scene")
local load = class("load", scene)
local PBManagerInst = require("pb.pb_manager")

function load:ctor()
	Behaviour.ctor(self)
	self.name = "load"
	self.assetBundles = {"pb", 
		"ui/common", 
		"config/design", 
		"prefabs/sound", 
		"fonts", 
		SoundDefine.BeginMusicAssetBundle, 
		}
end

function load:_awake()
	scene._awake(self)
    self.slider = self.gameObject.transform:GetChild(0):GetComponent(typeof(UnityUI.Slider))
end

function load:_start()
    
    ResourcesManagerInst:LoadAssetBundleAsync(self.assetBundles, function (percent)
        self.slider.value = percent
    end, function (arrRes)
		SoundManagerInst:init()

        self.slider.value = 1
        TimeManagerInst:onceTimer(800, self, function ()
            FileManagerInst:readAllBytesAsync("pb", "Assets/Proto/pb.txt", function (data)
                Protoc:load(data)
                PBManagerInst:init()
                UnitySceneManager.LoadSceneAsync(SceneType.Main)
            end)
        end)
    end)
end

return load

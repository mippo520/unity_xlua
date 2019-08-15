local load = class("load", Behaviour)
local PBManager = require("pb.pb_manager")

function load:_awake()
    self.slider = self.gameObject.transform:GetChild(0):GetComponent(typeof(UnityUI.Slider))
end

function load:_start()

    ResourcesManagerInst:LoadAssetBundleAsync({"pb", "ui/common"}, function (percent)
        self.slider.value = percent
    end, function (arrRes)
        self.slider.value = 1
        TimeManagerInst:onceTimer(800, self, function ()
            FileManagerInst:readAllBytesAsync("pb", "Assets/Proto/pb.txt", function (data)
                Protoc:load(data)
                PBManager.GetInstance():registPairMessage()
                UnitySceneManager.LoadSceneAsync(SceneType.Main)
            end)
        end)
    end)
end


function load:_update()
end


return load

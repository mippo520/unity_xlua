local game = class("game", Behaviour)
local PBManager = require("pb.pb_manager")

local function _loadFinish(self)
    self.stage = self:Instantiate(self:LoadAsset("Assets/Prefabs/3d/Stage/Stage.prefab"))
    self.girl01 = self:Instantiate(self:LoadAsset("Assets/Prefabs/3d/Character/girl01.prefab"))
end

function game:_awake()
    NoticeManager:init()

end

function game:_start()
    local preloadId = 0
    DialogManagerInst:open(DialogType.Preload, function (id)
        preloadId = id
    end)
    self:loopTimer(1000, 500, function ()
        NoticeManager:fire(NoticeType.Goahead, "abcdefgedobnvolwsenbweo;hbgvpqeghv034")
    end, "forever")

    self:LoadAssetBundleAsync({"prefabs/3d/stage", "prefabs/3d/character/girl01"}, function (percent)
        local preload = BehaviourManager.getBehaviour(preloadId)
        if preload then
            preload.value = percent
        end
    end, function (arrRes)
        local preload = BehaviourManager.getBehaviour(preloadId)
        if preload then
            preload.value = 1.0
        end
        _loadFinish(self)
    end)
end

return game
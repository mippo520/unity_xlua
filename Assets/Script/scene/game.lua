local game = class("game", Behaviour)
local PBManager = require("pb.pb_manager")

local function _loadFinish(self)
    self.stage = self:Instantiate(self:LoadAsset("Assets/Prefabs/3d/Stage/Stage.prefab"))
    local i = 0
    self:loopTimer(1000, 1000, function ()
        i = i + 1
        DancerManagerInst:add(i)
    end, 9)
end

function game:_awake()
    NoticeManager:init()

end

function game:_start()
    local preloadId = 0
    DialogManagerInst:open(DialogType.Preload, function (id)
        preloadId = id
    end)

    self:LoadAssetBundleAsync({"prefabs/3d/stage"}, function (percent)
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
    self:registEvent(Event.TouchDancer, self.touchDancer)

    if ShowFPS then
        DialogManagerInst:open(DialogType.FPS)
    end
end

function game:_destroy()
    Behaviour.destroy(self)
    DancerManagerInst:release()
end

function game:touchDancer(id)
    NoticeManager:fire(NoticeType.Blink, "touch dancer " .. id)
end

return game
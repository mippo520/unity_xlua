
local network = class("network", Behaviour)

local openList = {}

function network:c1()

    -- Info.Debug(Now())
    -- id = TimeManagerInst:loopTimer(50, 100, self, loopFinish, "forever")
    -- TimeManagerInst:onceTimer(1000, self, onceFinish)
    -- local img = self.gameObject.transform:GetChild(5).gameObject:GetComponent(typeof(UnityUI.Image))
    -- ResourcesManagerInst:LoadAssetBundleAsync({"test_ui"}, nil, function (arrRes)
    --     local tex = ResourcesManagerInst:LoadAsset("Assets/Prefabs/bg122.jpg")
    --     img.sprite = Unity.Sprite.Create(tex, Unity.Rect(0, 0, 200, 100), Unity.Vector2(0, 0))
    -- end)   
    self:closeSelf() 
end

function network:c2()

    -- self.n = self.n + 1
    -- local addr = self
    -- print(addr)
    -- Info.Debug(self.n)

    self:LoadAssetBundleAsync({"test_ui_png"}, nil, function (arrRes)
        local png = self:LoadAsset("Assets/Prefabs/home_menu.png")
        local img = self.gameObject.transform:GetChild(5).gameObject:GetComponent(typeof(UnityUI.Image))
        img.sprite = Unity.Sprite.Create(png, Unity.Rect(0, 0, 200, 100), Unity.Vector2(0, 0))
    end)
end

function network:_start()
    local v = Behaviour.new()
    local btn = self.gameObject.transform:GetChild(0).gameObject:GetComponent(typeof(UnityUI.Button))
    self:addListener(btn.onClick, handler(self, network.c1))

    local btn2 = self.gameObject.transform:GetChild(1).gameObject:GetComponent(typeof(UnityUI.Button))
    self:addListener(btn2.onClick, handler(self, network.c2))

    -- local btn3 = self.gameObject.transform:GetChild(2).gameObject
    -- btn3:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
    --     TcpManagerInst:close()
    -- end)

end

function network:_update()
end

function network:_destroy()
    print("network.OnDestroy")
end

return network

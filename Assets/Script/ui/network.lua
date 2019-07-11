
local network = class("network", Behaviour)

local openList = {}

function network:c1()
    -- FileManagerInst:readAllBytesAsync("pb", "Assets/Proto/msg_login.proto", function (data)
    --     Protoc:load(data)
    --     NetManagerInst:connect("192.168.3.192", 9101)
    --     NetManagerInst:registPairMessage("c_gs.C2SLogin", "c_gs.S2CLogin")
    -- end)

    -- Info.Debug(Now())
    -- id = TimeManagerInst:loopTimer(50, 100, self, loopFinish, "forever")
    -- TimeManagerInst:onceTimer(1000, self, onceFinish)
    -- local img = self.gameObject.transform:GetChild(5).gameObject:GetComponent(typeof(UnityUI.Image))
    -- ResourcesManagerInst:LoadAssetBundleAsync({"test_ui"}, nil, function (arrRes)
    --     local tex = ResourcesManagerInst:LoadAsset("Assets/Prefabs/bg122.jpg")
    --     img.sprite = Unity.Sprite.Create(tex, Unity.Rect(0, 0, 200, 100), Unity.Vector2(0, 0))
    -- end)    
    local addr = self
    print("delete ============> " .. self.luaScript)
    print(addr)
    if #openList > 0 then
        Unity.Object.Destroy(openList[#openList])
        table.remove(openList, #openList)
        ResourcesManagerInst:UnloadAssetBundle({"test_ui"})
    end
end
function network:c2()
    -- NetManagerInst:send("c_gs.C2SLogin", {
    --     account_id = 10086,
    --     token = "seal;kngilwea"
    -- })

    -- self.n = self.n + 1
    -- local addr = self
    -- print(addr)
    -- Info.Debug(self.n)

    ResourcesManagerInst:LoadAssetBundleAsync({"test_ui"}, nil, function (arrRes)
        local res = ResourcesManagerInst:LoadAsset("Assets/Prefabs/NetworkUI.prefab")
        local ui = Unity.Object.Instantiate(res)
        table.insert(openList, ui)
    end)
end

function network:_start()
    local v = Behaviour.new()
    local btn = self.gameObject.transform:GetChild(0).gameObject:GetComponent(typeof(UnityUI.Button))
    self.onClick = btn.onClick
    self.onClick:AddListener(handler(self, network.c1))

    local btn2 = self.gameObject.transform:GetChild(1).gameObject:GetComponent(typeof(UnityUI.Button))
    self.onClick2 = btn2.onClick
    self.onClick2:AddListener(handler(self, network.c2))
    local addr = self
    print("add listener! ============> " .. self.luaScript)
    print(addr)

    -- local btn3 = self.gameObject.transform:GetChild(2).gameObject
    -- btn3:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
    --     NetManagerInst:close()
    -- end)

end

function network:_update()
end

function network:_destroy()
    print("network.OnDestroy")
    self.onClick:RemoveAllListeners()
    self.onClick:Invoke()
    self.onClick2:RemoveAllListeners()
    self.onClick2:Invoke()
end

return network

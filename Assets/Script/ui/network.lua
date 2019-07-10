network = {}

function network:awake()
    self.n = 10
end

function network:start()
    local btn = self.gameObject.transform:GetChild(0).gameObject:GetComponent(typeof(UnityUI.Button))
    local onClick = btn.onClick
    onClick:AddListener(function ()
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
        self.n = self.n + 1
        Info.Debug(self.n)
    end)

    local btn2 = self.gameObject.transform:GetChild(1).gameObject
    btn2:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
        NetManagerInst:send("c_gs.C2SLogin", {
            account_id = 10086,
            token = "seal;kngilwea"
        })
    end)

    local btn3 = self.gameObject.transform:GetChild(2).gameObject
    btn3:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
        NetManagerInst:close()
    end)

end

function network:update()
end

function network:onDestroy()
    print("network.OnDestroy")
end
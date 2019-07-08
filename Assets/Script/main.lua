
main = {}

local function receiveLogin(self, msg)
    local text = self.transform:GetChild(4).gameObject
    text:GetComponent(typeof(UnityUI.Text)).text = msg.server_time
end
local function connectSuccess(self, msg)
    local text = self.transform:GetChild(4).gameObject
    text:GetComponent(typeof(UnityUI.Text)).text = "connectsuccess"
end
local function connectFailed(self, msg)
    local text = self.transform:GetChild(4).gameObject
    text:GetComponent(typeof(UnityUI.Text)).text = "connectfailed"
end
local function close(self, msg)
    local text = self.transform:GetChild(4).gameObject
    text:GetComponent(typeof(UnityUI.Text)).text = "close"
end
local function Disconnect(self, msg)
    local text = self.transform:GetChild(4).gameObject
    text:GetComponent(typeof(UnityUI.Text)).text = "disconnect"
end
local function BeginWaitMessage(self, msg)
    Info.Debug("begin wait msg " .. msg)
end
local function FinishWaitMessage(self, msg)
    Info.Debug("finish wait msg " .. msg)
end

local id = nil
local n = 0
local function loopFinish(self)
    Info.Debug("loopFinish timesup " .. Now())
    n = n + 1
    if n == 20 then
        TimeManagerInst:unregistTimer(id)
    end
end

local function onceFinish(self)
    Info.Debug("onceFinish timesup " .. Now())
end

function main:awake()
    print("main.Awake")
    EventManagerInst:registEvent(Event.ConnectSuccess, self, connectSuccess)
    EventManagerInst:registEvent(Event.ConnectFailed, self, connectFailed)
    EventManagerInst:registEvent(Event.Closed, self, close)
    EventManagerInst:registEvent(Event.Disconnect, self, Disconnect)
    EventManagerInst:registEvent(Event.BeginWaitMessage, self, BeginWaitMessage)
    EventManagerInst:registEvent(Event.FinishWaitMessage, self, FinishWaitMessage)
    -- EventManagerInst:registEvent(Event.FrameUpdate, self, FrameUpdate)

    NetManagerInst:registMessage("c_gs.S2CLogin", self, receiveLogin)
end

function main:start()
    local btn = self.gameObject.transform:GetChild(0).gameObject
    btn:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
        
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

        local text = self.transform:GetChild(4).gameObject
        text:GetComponent(typeof(UnityUI.Text)).text = ResourcesManagerInst.md5
    
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

function main:update()
end

function main:onDestroy()
    print("main.OnDestroy")
end
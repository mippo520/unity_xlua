
main = {}
local self = {}

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
        TimeManager.GetInstance():unregistTimer(id)
    end
end

local function onceFinish(self)
    Info.Debug("onceFinish timesup " .. Now())
end

function main.awake(gameObject)
    print("main.Awake")
    self = gameObject
    EventManager.GetInstance():registEvent(Event.ConnectSuccess, self, connectSuccess)
    EventManager.GetInstance():registEvent(Event.ConnectFailed, self, connectFailed)
    EventManager.GetInstance():registEvent(Event.Closed, self, close)
    EventManager.GetInstance():registEvent(Event.Disconnect, self, Disconnect)
    EventManager.GetInstance():registEvent(Event.BeginWaitMessage, self, BeginWaitMessage)
    EventManager.GetInstance():registEvent(Event.FinishWaitMessage, self, FinishWaitMessage)
    -- EventManager.GetInstance():registEvent(Event.FrameUpdate, self, FrameUpdate)

    NetManager.GetInstance():registMessage("c_gs.S2CLogin", self, receiveLogin)
end

function main.start()
    local btn = self.transform:GetChild(0).gameObject
    btn:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
        
        -- FileManager.GetInstance():readAllBytesAsync("pb", "Assets/Proto/msg_login.proto", function (data)
        --     Protoc:load(data)
        --     NetManager.GetInstance():connect("192.168.3.192", 9101)
        --     NetManager.GetInstance():registPairMessage("c_gs.C2SLogin", "c_gs.S2CLogin")
        -- end)

        Info.Debug(Now())
        id = TimeManager.GetInstance():loopTimer(50, 100, self, loopFinish, "forever")
        TimeManager.GetInstance():onceTimer(1000, self, onceFinish)
    end)

    local btn2 = self.transform:GetChild(1).gameObject
    btn2:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
        
        NetManager.GetInstance():send("c_gs.C2SLogin", {
            account_id = 10086,
            token = "seal;kngilwea"
        })

    end)

    local btn3 = self.transform:GetChild(2).gameObject
    btn3:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
        NetManager.GetInstance():close()
    end)


end

function main.update()
end

function main.onDestroy()
    print("main.OnDestroy")
end

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
    -- local matable = getmetatable(self)
    -- matable.__index = matable
    -- self = matable

    ResourcesManagerInst:LoadAssetBundleAsync({"test_ui"}, nil, function (arrRes)
        local res = ResourcesManagerInst:LoadAsset("Assets/Prefabs/NetworkUI.prefab")
        Unity.Object.Instantiate(res)
    end)
end

function main:update()

end

function main:onDestroy()
    print("main.OnDestroy")

end
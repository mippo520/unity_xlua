
local main = class("main", Behaviour)

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
        TimeManagerInst:stopTimer(id)
    end
end

local function onceFinish(self)
    Info.Debug("onceFinish timesup " .. Now())
end

function main:_awake()
    print("main.Awake")
    -- EventManagerInst:registEvent(Event.ConnectSuccess, self, connectSuccess)
    -- EventManagerInst:registEvent(Event.ConnectFailed, self, connectFailed)
    -- EventManagerInst:registEvent(Event.Closed, self, close)
    -- EventManagerInst:registEvent(Event.Disconnect, self, Disconnect)
    -- EventManagerInst:registEvent(Event.BeginWaitMessage, self, BeginWaitMessage)
    -- EventManagerInst:registEvent(Event.FinishWaitMessage, self, FinishWaitMessage)
    -- EventManagerInst:registEvent(Event.FrameUpdate, self, FrameUpdate)

    NetManagerInst:registMessage("c_gs.S2CLogin", self, receiveLogin)
end

function main:_start()
    -- local matable = getmetatable(self)
    -- matable.__index = matable
    -- self = matable

    DialogManagerInst:open(DialogType.TestMenu)
end

function main:_update()

end

function main:_destroy()
    print("main.OnDestroy")

end

return main


local MsgWaitData = class("MsgWaitData")

local function _beginWait(self)
    EventManager.GetInstance():fireEvent(Event.BeginWaitMessage, self.msg)
    self.isWait = true
end

local function _timeout(self)
    Info.Debug("message timeout! message is " .. self.msg)
    EventManager.GetInstance():fireEvent(Event.MessageTimeout, self.msg)
end

function MsgWaitData:ctor(msg)
    self.msg = msg
    self.time = Now()
    self.beginWaitId = 0
    self.timeoutId = 0
    self.isWait = false
end

function MsgWaitData:start()
    local now = Now()
    self.beginWaitId = TimeManager.GetInstance():onceTimer(self.time + 500 - now, self, _beginWait)
    self.timeoutId = TimeManager.GetInstance():onceTimer(self.time + NetBackMessageWaitTime - now, self, _timeout)
end

function MsgWaitData:release()
    if self.isWait then
        EventManager.GetInstance():fireEvent(Event.FinishWaitMessage, self.msg)
    end

    if self.beginWaitId > 0 then
        TimeManager.GetInstance():unregistTimer(self.beginWaitId)
    end
    if self.timeoutId > 0 then
        TimeManager.GetInstance():unregistTimer(self.timeoutId)
    end
end

return MsgWaitData

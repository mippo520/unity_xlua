
local MsgWaitData = class("MsgWaitData")

local function _beginWait(self)
    EventManagerInst:fireEvent(self.beginWaitEvent, self.msg)
    self.isWait = true
end

local function _timeout(self)
    Info.Log("message timeout! message is " .. self.msg)
    EventManagerInst:fireEvent(self.timeoutEvent, self.msg)
end

function MsgWaitData:ctor(msg)
    self.msg = msg
    self.time = Now()
    self.beginWaitId = 0
    self.timeoutId = 0
    self.isWait = false
    self.arg = nil
    self.beginWaitEvent = Event.BeginWaitMessage
    self.finishWaitEvent = Event.FinishWaitMessage
    self.timeoutEvent = Event.MessageTimeout
    self.waitTime = NetBackMessageWaitTime
end

function MsgWaitData:start()
    local now = Now()
    self.beginWaitId = TimeManagerInst:onceTimer(self.time + 500 - now, self, _beginWait)
    self.timeoutId = TimeManagerInst:onceTimer(self.time + self.waitTime - now, self, _timeout)
end

function MsgWaitData:release()
    if self.isWait then
        EventManagerInst:fireEvent(self.finishWaitEvent, self.msg)
    end

    if self.beginWaitId > 0 then
        TimeManagerInst:stopTimer(self.beginWaitId)
    end
    if self.timeoutId > 0 then
        TimeManagerInst:stopTimer(self.timeoutId)
    end
end

return MsgWaitData

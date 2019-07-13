
local MsgWaitData = require("common.net.msg_wait_data")
local HttpWaitData = class("HttpWaitData", MsgWaitData)

function HttpWaitData:ctor(msg)
    self.super.ctor(self, msg)
    self.beginWaitEvent = Event.HttpBeginWaitMessage
    self.finishWaitEvent = Event.HttpFinishWaitMessage
    self.timeoutEvent = Event.HttpMessageTimeout
end

return HttpWaitData
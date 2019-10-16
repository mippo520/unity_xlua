local Http = CSCommon.Net.HttpManager
local HttpWaitData = require("common.net.http_wait_data")

local HttpManager = class("HttpManager")

local function _messageTimeout(self, msg)
    local waitReq = self.mapWaitRequest[msg]
    if waitReq then
        waitReq.arg(msg, HttpState.Failed, "http timeout!")
        waitReq:release()
        self.mapWaitRequest[msg] = nil
    else
        Info.Error("http receive timeout error!")
    end
end

function HttpManager:ctor()
    self.mapWaitRequest = {}
    EventManagerInst:registEvent(Event.HttpMessageTimeout, self, _messageTimeout)
end

function HttpManager:Get(url, args, callback)
    local urlExt = url .. "?"
    for k, v in pairs(args) do
        urlExt = urlExt .. string.format( "%s=%s&", k, tostring(v) )
    end

    Info.Debug(urlExt)
    local newId = Http.GetInstance():Get(urlExt, function (id, state, content)
        local waitReq = self.mapWaitRequest[id]
        if waitReq then
            waitReq.arg(id, state, content)
            waitReq:release()
            self.mapWaitRequest[id] = nil
        end
    end)
    local data = HttpWaitData.new(newId)
    data.arg = callback
    data:start()
    self.mapWaitRequest[newId] = data
end

if not _HttpManagerInst then
    _HttpManagerInst = HttpManager.new()
end
return _HttpManagerInst

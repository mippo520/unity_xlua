local LoginController = class("LoginController")

local _login = nil

local function _clearNetData(self)
    self.connectCount = 0
    if self.reconnectTimerId > 0 then
        TimeManagerInst:stopTimer(self.reconnectTimerId)
        self.reconnectTimerId = 0
    end
end 

local function _reconnect(self)
    if self.connectCount >= NetReconnectCount then
        EventManagerInst:fireEvent(Event.NetReconnectFailed)
        _clearNetData(self)
        return
    end

    self.connectCount = self.connectCount + 1
    self.reconnectTimerId = TimeManagerInst:onceTimer(NetReconnectWaitTime, self, function (self)
        local now = Now()
        if now < self.expireTime then
            NetManagerInst:reconnect()
        else
            _login(self)
        end
    end)
end

_login = function (self)
    local time = Now()    
    HttpManagerInst:Get("http://192.168.3.192:8000/login", 
    {
        login_type = AccountDataInst.loginType,
        account_name = AccountDataInst.username:get(),
        password = AccountDataInst.password:get(),
        time = time,
        sign = Tools.Sign(AccountDataInst.loginType, AccountDataInst.username:get(), AccountDataInst.password:get(), time),
    }, 
    function (id, state, content)
        if HttpState.Complete ~= state then
            _reconnect(self)
            return
        end
        local res = RapidJson.decode(content)
        if Error.Success == res.code then
            AccountDataInst.account_id = res.account_id
            AccountDataInst.token = res.token
            AccountDataInst.expireTime = res.expire_ts
            NetManagerInst:connect("192.168.3.192", 9101)
        else
            Info.Debug("error code = " .. res.code)
        end
    end)        
end

local function _connectFailed(self, msg)
    _reconnect(self)
end

local function _connectSuccess(self, msg)
    NetManagerInst:send(c_gs.C2S_Login, {
        account_id = AccountDataInst.account_id,
        token = AccountDataInst.token, 
        server_id = 1
    })
end

local function _disconnect(self, msg)
    Info.Debug("socket disconnect!")
    _reconnect(self)
end

local function _closed(self, msg)
    Info.Debug("socket closed!")
end

local function _s2c_login(self, msg)
    if ErrCode.Success == msg.code then
        EventManagerInst:fireEvent(Event.LoginSuccess)
        if 0 == msg.player_id then
            TimeManagerInst:setServerTime(msg.server_time, msg.open_server_time)
            DialogManagerInst:open(DialogType.CreatePlayer)
        else
            Progress:enterGame()
        end
        _clearNetData(self)

    else
        Info.Debug(msg.code)
    end
end

local function _s2c_playerData(self, msg)
    Info.Debug("player_id = " .. msg.base_data.player_id)
    Info.Debug("name = " .. msg.base_data.name)
    Info.Debug("head = " .. msg.base_data.head)
end

function LoginController:ctor()
    self.connectCount = 0
    self.reconnectTimerId = 0
    self.expireTime = 0

    EventManagerInst:registEvent(Event.NetConnectFailed, self, _connectFailed)
    EventManagerInst:registEvent(Event.NetConnectSuccess, self, _connectSuccess)
    EventManagerInst:registEvent(Event.NetDisconnect, self, _disconnect)
    EventManagerInst:registEvent(Event.NetClosed, self, _closed)

    NetManagerInst:registMessage(c_gs.S2C_Login, self, _s2c_login)
    -- NetManagerInst:registMessage(c_gs.S2C_PlayerData, self, _s2c_playerData)
end

function LoginController:login()
    _clearNetData(self)
    _login(self)
end

function LoginController:logout()
    NetManagerInst:close()
    _clearNetData(self)
end

return LoginController

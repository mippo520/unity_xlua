
local event = {
    -- Net
    NetConnectSuccess = "NetConnectSuccess",
    NetConnectFailed = "NetConnectFailed",
    NetDisconnect  = "NetDisconnect",
    NetClosed = "NetClosed",
    NetReconnectFailed = "NetReconnectFailed",
    BeginWaitMessage = "BeginWaitMessage",
    FinishWaitMessage = "FinishWaitMessage",
    MessageTimeout = "MessageTimeout",

    -- Http
    HttpBeginWaitMessage = "HttpBeginWaitMessage",
    HttpFinishWaitMessage = "HttpFinishWaitMessage",
    HttpMessageTimeout = "HttpMessageTimeout",

    -- frame
    FrameUpdate = "FrameUpdate",

    -- language
    LanguageChange = "LanguageChange",

    -- login
    LoginSuccess = "LoginSuccess",

    -- data
    PlayerDataUpdate = "PlayerDataUpdate",
    PlayerLevUpdate = "PlayerLevUpdate",
    PossessionUpdate = "PossessionUpdate", 
    BigPossessionUpdate = "BigPossessionUpdate", 
    PackageUpdate = "PackageUpdate", 
    VipUpdate = "VipUpdate",

    -- stage
    TouchDancer = "TouchDancer",
}

return event


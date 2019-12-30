
local event = {
    -- TCP
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
	LanguageInit = "LanguageInit",
	LanguageChange = "LanguageChange",
	
	-- dialog
	OpenFullScreenDialog = "OpenFullScreenDialog", 
	FullScreenDialogClear = "FullScreenDialogClear", 

    -- login
    LoginSuccess = "LoginSuccess",

	-- scene
	ChangeScene = "ChangeScene", 
}

return event


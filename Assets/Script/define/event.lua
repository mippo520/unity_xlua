
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
	LanguageInit = "LanguageInit",
	LanguageChange = "LanguageChange",
	
	-- dialog
	OpenFullScreenDialog = "OpenFullScreenDialog", 
	FullScreenDialogClear = "FullScreenDialogClear", 

    -- login
    LoginSuccess = "LoginSuccess",

    -- data
    PlayerDataUpdate = "PlayerDataUpdate",
    PlayerLevUpdate = "PlayerLevUpdate",
    PossessionUpdate = "PossessionUpdate", 
    BigPossessionUpdate = "BigPossessionUpdate", 
    PackageUpdate = "PackageUpdate", 
    VipUpdate = "VipUpdate",
	
	-- Hero
	UpdateHeroList = "UpdateHeroList", 
	RefreshHeroInfo = "RefreshHeroInfo", 

	-- scene
	ChangeScene = "ChangeScene", 
	
    -- stage
    TouchSeat = "TouchSeat",
    ClickSeat = "ClickSeat",
    StageUpdate = "StageUpdate",
	SeatChangeHero = "SeatChangeHero", 	
	UpdateUnlockSeat = "UpdateUnlockSeat",
	
	-- technology
	HideWhenOpenLvUp = "HideWhenOpenLvUp",
	ShowWhenCloseLvUp = "ShowWhenCloseLvUp",
	TechLevelUp = "TechLevelUp",
	LookAtTech = "LookAtTech",	--摄像机注视特定科技部件
    MoveOutTech = "MoveOutTech",	--摄像机恢复主舞台视角
    ChangeTechModel = "ChangeTechModel" --改变科技物件模型
}

return event


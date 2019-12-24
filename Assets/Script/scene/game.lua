local scene = require("scene.scene")
local game = class("game", scene)
local PBManager = require("pb.pb_manager")

local function _loadFinish(self)
	SeatManagerInst:init()
	StageMoveAniManagerInst:init()
	
    self.game = self:Instantiate(self:LoadAsset("Assets/Prefabs/scene/game.prefab"))
	DialogManagerInst:open(DialogType.StageTouch)
	DialogManagerInst:open(DialogType.MainMenu)
	SoundManagerInst:playMusic(SoundDefine.GameMusicAssetBundle, SoundDefine.GameMusicAsset)
	DialogManagerInst:open(DialogType.TouchEffect)
end

local function _clickSeat(self, id)
	local seat = SeatManagerInst:get(id)
	if seat and seat.dancerId > 0 then
		Unity.RenderSettings.ambientLight = Enum.AmbientColor.half
	else
		Unity.RenderSettings.ambientLight = Enum.AmbientColor.total
	end
end

local function _touchSeat(self, id)
	Unity.RenderSettings.ambientLight = Enum.AmbientColor.total
end

local function _preloadClosed(self)
	SeatManagerInst:initSeats()
end

function game:ctor()
	Behaviour.ctor(self)
	self.name = "game"
	self.assetBundles = {
		"prefabs/scene/game", 
		"prefabs/3d/stage",
		"prefabs/3d/character/seat",
		"3d/spot", 
		"image/quality", 
		"ui/main_menu", 
		"ui/stage", 
		"ui/hero", 
		"image/icon", 
		"fonts", 
		"effect/operator", 
		SoundDefine.GameMusicAssetBundle, 
	}
	self.preloadBehaviour = nil
	self.normalPercent = 0
	self.dynamicPercent = 0
end

function game:dynamicPreload()
	local assetBundles = {}
	table.insertto(assetBundles, HeroManagerInst:getPreload())
	table.insertto(assetBundles, StageInfoInst:getPreload())
	
	self:LoadAssetBundleAsync(assetBundles, function (percent)
			self.dynamicPercent = percent / 2
			if self.preloadBehaviour then
				self.preloadBehaviour.value = self.normalPercent + self.dynamicPercent
			end
		end, function (arrRes)
			self.dynamicPercent = 0.5
			local percent = self.normalPercent + self.dynamicPercent
			if self.preloadBehaviour then
				self.preloadBehaviour.value = percent
			end
			if percent >= 1 then
				_loadFinish(self)
			end
		end)
end

function game:_awake()
	scene._awake(self)
    --NoticeManager:init()
	self:registEvent(Event.ClickSeat, _clickSeat)
	self:registEvent(Event.TouchSeat, _touchSeat)
end

function game:_start()
    DialogManagerInst:open(DialogType.Preload, function (id)
		self.preloadBehaviour = BehaviourManager.getBehaviour(id)
		self.preloadBehaviour.finishEvent:addListener(self, _preloadClosed)
    end)

    self:LoadAssetBundleAsync(self.assetBundles, function (percent)
			self.normalPercent = percent / 2
	        if self.preloadBehaviour then
				self.preloadBehaviour.value = self.normalPercent
	        end
	    end, function (arrRes)
			self.normalPercent = 0.5
	        if self.preloadBehaviour then
				self.preloadBehaviour.value = self.normalPercent
	        end
			
			self:dynamicPreload()
	    end)

    if ShowFPS then
        DialogManagerInst:open(DialogType.FPS)
    end
end

function game:destroy()
    Behaviour.destroy(self)
	
    DancerManagerInst:release()
end

return game
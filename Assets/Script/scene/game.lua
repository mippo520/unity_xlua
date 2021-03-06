local scene = require("scene.scene")
local game = class("game", scene)
local PBManager = require("pb.pb_manager")

local function _loadFinish(self)
	self.gameController = self:Instantiate(self:LoadAsset("Assets/Prefabs/GameController.prefab"))
	self.gcLuaObj = Behaviour.getLuaBehaviour(self.gameController)
	self.stage = self:Instantiate(self:LoadAsset("Assets/Prefabs/Stage.prefab"))
	RoleManagerInst:init()
	SoundManagerInst:playMusic(SoundDefine.GameMusicAssetBundle, SoundDefine.GameMusicAsset)
	DialogManagerInst:open(DialogType.Controller)
end

local function _preloadClosed(self)
end

function game:ctor()
	Behaviour.ctor(self)
	self.name = "game"
	self.assetBundles = {
		"game_controller", 
		"ui/game/controller",
		"prefabs/stage", 
		"prefabs/role", 
		SoundDefine.GameMusicAssetBundle, 
	}
	self.preloadBehaviour = nil
	self.normalPercent = 0
	self.dynamicPercent = 0
	self.gameController = nil
	self.gcLuaObj = nil
	self.stage = nil
	self.fpsId = 0
end

function game:dynamicPreload()
	local assetBundles = {}
	
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
		DialogManagerInst:open(DialogType.FPS, function (id)
			self.fpsId = id
		end)
    end
end

function game:destroy()
    Behaviour.destroy(self)
end

return game
local SoundManager = class("SoundManager")

local sound_index = 0


function SoundManager:ctor()
	self.musicOpen = BindProperty.new(true)
	self.soundOpen = BindProperty.new(true)
	self.orignAudio = nil
	self.music = nil
end

function SoundManager:init()
	--音乐开关
	local mo = StorageInst:get("musicOpen")
	if nil ~= mo then
		self.musicOpen:set(mo)
	end
	self.musicOpen:bind(self, function (_, old, new)
		StorageInst:set(StorageKey.musicOpen, new.value)
	end)
	
	--音效开关
	local so = StorageInst:get("soundOpen")
	if nil ~= so then
		self.soundOpen:set(so)
	end
	self.soundOpen:bind(self, function (_, old, new)
		StorageInst:set(StorageKey.soundOpen, new.value)
	end)
	
	self.orignAudio = Unity.Object.Instantiate(ResourcesManagerInst:LoadAsset("assets/prefabs/sound/audiosource.prefab"), CSEngineExt.s_DontDestroyParent.transform):GetComponent(typeof(Unity.AudioSource))
end

function SoundManager:playMusic(assetBundle, path)
	if self.musicOpen and (not self.music or self.music.path ~= path) then
		ResourcesManagerInst:LoadAssetBundleAsync({assetBundle}, nil, function ()
			if self.music then
				self.orignAudio:Stop()
				self.orignAudio.clip = nil
				ResourcesManagerInst:UnloadAssetBundle({self.music.assetBundle})
			end

			self.music = {}
			self.music.assetBundle = assetBundle
			self.music.path = path
				
			self.orignAudio.clip = ResourcesManagerInst:LoadAsset(path)
			self.orignAudio:Play()
		end)
	end
end

function SoundManager:stopMusic(path)
	if self.orignAudio and self.music then
		self.orignAudio:stop()
		self.orignAudio.clip = nil
		ResourcesManagerInst:UnloadAssetBundle({self.music.assetBundle})
		self.music = nil
	end	
end

function SoundManager:pause()
	if self.orignAudio and self.orignAudio.clip then
		self.orignAudio:pause()
	end
end

function SoundManager:resume()
	if self.orignAudio and self.orignAudio.clip then
		self.orignAudio:UnPause()
	end
end

if not _SoundManagerInst then
    _SoundManagerInst = SoundManager.new()
end
return _SoundManagerInst

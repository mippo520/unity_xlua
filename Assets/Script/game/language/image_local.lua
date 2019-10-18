local ImageLocal = class("ImageLocal", Behaviour)

local function _initImage(self)
    self.assetbundleEx = "image/" .. LanguageManagerInst:getLanguage() .. "/" .. self.assetbundle
    self.pathEx = "Assets/Image/" .. LanguageManagerInst:getLanguage() .. "/" .. self.path
    self:LoadAssetBundleAsync({self.assetbundleEx}, nil, function (arrRes)
        local image = self.gameObject:GetComponent(typeof(UnityUI.Image))
        image.sprite = ResourcesManagerInst:LoadAsset(self.pathEx)
    end)
end

local function _languageChange(self, language)
    if self.assetbundleEx then
        self:UnloadAssetBundles({self.assetbundleEx})
    end
    _initImage(self)
end

function ImageLocal:ctor()
    Behaviour.ctor(self)
    self.assetbundleEx = nil
    self.pathEx = nil
end

function ImageLocal:_awake()
    _initImage(self)
    self:registEvent(Event.LanguageChange, _languageChange)
end


return ImageLocal
local HeroManager = class("HeroManager")

function HeroManager:ctor()
    self.heroes = {}
end

function HeroManager:getHero(id)
    return self.heroes[id]
end

if not _HeroManagerInst then
    _HeroManagerInst = HeroManager.new()
end
return _HeroManagerInst

local HeroData = class("HeroData")

function HeroData:ctor()
    self.heroes = {}
end

function HeroData:getHero(id)
    return self.heroes[id]
end

if not _HeroDataInst then
    _HeroDataInst = HeroData.new()
end
return _HeroDataInst

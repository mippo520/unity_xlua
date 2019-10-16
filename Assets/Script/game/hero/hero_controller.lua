local HeroController = class("HeroController")
local HeroInfo = require("game.hero.hero_info")

local _s2c_hero_list = function (self, msg)
    for k,data in pairs(msg.heroes) do
        local hero = HeroInfo.new()
        hero.id = data.id
        hero.lv = data.lev
        hero.star = data.star
        HeroManagerInst.heroes[data.id] = hero
    end
end

local _s2c_upgrade_hero_lev_rsp = function (self, msg)
    if msg.code == 0 then
        local hero = HeroManagerInst:getHero(msg.id)
        hero.lv = hero.lv + msg.up_lev
    end
end

local _s2c_upgrade_hero_star_rsp = function (self, msg)
    if msg.code == 0 then
        local hero = HeroManagerInst:getHero(msg.id)
        hero.star = hero.star + msg.up_star
    end    
end

function HeroController:ctor()
    -- NetManagerInst:registMessage(c_gs.S2C_HeroList, self, _s2c_hero_list)
    -- NetManagerInst:registMessage(c_gs.S2C_UpgradeHeroLevRsp, self, _s2c_upgrade_hero_lev_rsp)
    -- NetManagerInst:registMessage(c_gs.S2C_UpgradeHeroStarRsp, self, _s2c_upgrade_hero_star_rsp)
end

function HeroController:init(  )
    NetManagerInst:registMessage(c_gs.S2C_HeroList, self, _s2c_hero_list)
    NetManagerInst:registMessage(c_gs.S2C_UpgradeHeroLevRsp, self, _s2c_upgrade_hero_lev_rsp)
    NetManagerInst:registMessage(c_gs.S2C_UpgradeHeroStarRsp, self, _s2c_upgrade_hero_star_rsp)
end

function HeroController:canUpLv(id)
   return  type(HeroManagerInst:getHero(id)) ~= "nil"
end

function HeroController:upLv(id, upLv)
    if self:canUpLv(id) then
        NetManagerInst:send(c_gs.C2S_UpgradeHeroLevReq, {
            id = id,
            up_lev = upLv,
        })
    end
end

function HeroController:canUpStar(id)
    return  type(HeroManagerInst:getHero(id)) ~= "nil"
end

function HeroController:upStar(id, upStar)
    if self:canUpStar(id) then
        NetManagerInst:send(c_gs.C2S_UpgradeHeroStarReq, {
            id = id,
            up_star = upStar,
        })
    end
end

if not _HeroControllerInst then
    _HeroControllerInst = HeroController.new()
end
return _HeroControllerInst

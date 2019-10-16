local Hero = class("Hero", DialogBehaviour)

function Hero:ctor()
    DialogBehaviour.ctor(self)
    self.id = 0
    self.lv = 0
    self.star = 0
end

function Hero:_awake()
    self:showHeroes()

    NetManagerInst:registMessage(c_gs.S2C_HeroList, self, self.showHeroes)
    NetManagerInst:registMessage(c_gs.S2C_UpgradeHeroLevRsp, self, self.showHeroes)
    NetManagerInst:registMessage(c_gs.S2C_UpgradeHeroStarRsp, self, self.showHeroes)

    self:addListener(self.btn_lv.onClick, self.onBtnLvClicked)
    self:addListener(self.btn_star.onClick, self.onBtnStarClicked)
end

function Hero:showHeroes()
    local text = ""
    local heroes = HeroManagerInst.heroes
    local formatTxt = "编号：%d,等级：%d,星级：%d\n"
    for k,v in pairs(heroes) do
        text = text .. string.format(formatTxt, v.id, v.lv, v.star)
    end
    self.txt_heroes.text = text
end

function Hero:onBtnLvClicked(  )
    HeroControllerInst:upLv(tonumber(self.input_id.text), tonumber(self.input_lv.text))
end

function Hero:onBtnStarClicked(  )
    HeroControllerInst:upStar(tonumber(self.input_id.text), tonumber(self.input_star.text))
end

return Hero

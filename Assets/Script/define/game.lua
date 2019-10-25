
ErrCode = require("define.err_code")
Currency = require("parts.currency")        -- 超大数值
BigPossession = require("parts.big_possession")    -- 超大数值货币
Possession = require("parts.possession")    -- 其他货币
Thing = require("game.package.thing")
Item = require("game.package.item")
Equip = require("game.package.equip")

-- config
ConfigManager = require("common.cfg.config_manager")
-- language
LanguageManagerInst = require("game.language.language_manager")
-- account
AccountDataInst = require("game.account.account_data")
-- player
PlayerDataInst = require("game.player.player_data")
PossessionManagerInst = require("game.player.possession_manager")
PlayerControllerInst = require("game.player.player_controller")
-- package
PackageInst = require("game.package.package")
PackageControllerInst = require("game.package.package_controller")
-- vip
VipDataInst = require("game.vip.vip_data")
VipControllerInst = require("game.vip.vip_controller")
-- setting
SettingDataInst = require("game.setting.setting_data")
SettingControllerInst = require("game.setting.setting_controller")
-- notice
NoticeManager = require("game.notice.notice_manager")
NoticeType = require("game.notice.notice_type")
-- hero
HeroManagerInst = require("game.hero.hero_manager")
HeroControllerInst = require("game.hero.hero_controller")
-- stage
DancerManagerInst = require("game.stage.dancer_manager")
StageDefine = require("game.stage.define")

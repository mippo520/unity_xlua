
ErrCode = require("define.err_code")

Enum = require("define.enum") --常用数值定义

-- config
ConfigManagerInst = require("common.cfg.config_manager")
-- language
LanguageManagerInst = require("game.language.language_manager")
-- account
AccountDataInst = require("game.account.account_data")
-- notice
NoticeManager = require("game.notice.notice_manager")
NoticeType = require("game.notice.notice_type")

-- sound
SoundManagerInst = require("game.sound.sound_manager")
SoundDefine = require("game.sound.define")
-- scnene
SceneManagerInst = require("scene.scene_manager")

-- Info
GameInfoInst = require("game.game_info")
-- framesync
FrameInfoInst = require("game.frame_sync.frame_info")
StatusFrame = require("game.frame_sync.status_frame")
ActionFrame = require("game.frame_sync.action_frame")

-- role
RoleManagerInst = require("game.role.role_manager")
Role = require("game.role.role")

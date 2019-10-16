local game = class("game", Behaviour)
local PBManager = require("pb.pb_manager")

function game:_awake()
    NoticeManager:init()

end

function game:_start()
    DialogManagerInst:open(DialogType.Preload)
    self:loopTimer(1000, 500, function ()
        NoticeManager:fire(NoticeType.Goahead, "abcdefgedobnvolwsenbweo;hbgvpqeghv034")
    end, "forever")
    -- DialogManagerInst:open(DialogType.Hero)
end



return game
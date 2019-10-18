local NoticeManager = class("NoticeManager")

local function _add(self, id)
    local behaviour = BehaviourManager.getBehaviour(id)
    self.notices[behaviour.type] = behaviour
end

function NoticeManager:ctor()
    self.notices = {}
end

function NoticeManager:init()
    -- DialogManagerInst:open(DialogType.GoaheadNotice, handler(self, _add))
    -- DialogManagerInst:open(DialogType.BlinkNotice, handler(self, _add))
end

function NoticeManager:fire(type, content)
    local notice = self.notices[type]
    if notice then
        notice:setValues(content)
    end
end

function NoticeManager:clearAll()
    for _, v in pairs(self.notices) do
        v:clear()
    end
end


if not _NoticeManagerInst then
    _NoticeManagerInst = NoticeManager.new()
end

return _NoticeManagerInst

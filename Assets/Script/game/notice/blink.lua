local Notice = require("game.notice.notice")
local Blink = class("Blink", Notice)

function Blink:ctor()
    Notice.ctor(self)
    self.type = NoticeType.Blink
end

function Blink:_awake()
    Notice._awake(self)
end

function Blink:reset()
    self.animator:SetInteger("state", 0)
    if #self.contents > 0 then
        self.content.text = self.contents[1]
        table.remove(self.contents, 1)
        self.animator:SetInteger("state", 1)
    end
end

function Blink:setValues(content)
    if 0 == self.animator:GetInteger("state") then
        self.content.text = content
        self.animator:SetInteger("state", 1)
    else
        Notice.setValues(self, content)
    end
end

return Blink
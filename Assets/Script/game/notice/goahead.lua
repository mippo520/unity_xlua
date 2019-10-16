local Notice = require("game.notice.notice")
local Goahead = class("Goahead", Notice)

local moveSpeed = 0.4

local function _update(self, dt)
    if not self.bShow and #self.contents > 0then
        self.bShow = true
        self.content.text = self.contents[1]
        self.content:GetComponent(typeof(UnityUI.ContentSizeFitter)):SetLayoutHorizontal()

        table.remove(self.contents, 1)
        self.contentRect = self.content:GetComponent(typeof(Unity.RectTransform))
        if self.contentRect then
            self.contentRect.anchoredPosition = Unity.Vector2(0, 0)
        end
    elseif self.bShow then
        if self.contentRect then
            self.contentRect.anchoredPosition = Unity.Vector2(self.contentRect.anchoredPosition.x - moveSpeed * dt, 0)
            if self.contentRect.anchoredPosition.x < -(self.contentRect.rect.width + self.area.rect.width) then
                self.bShow = false
                self.content.text = ""
            end
        end
    end
end

function Goahead:ctor()
    Notice.ctor(self)
    self.type = NoticeType.Goahead
    self.contentRect = nil
end

function Goahead:_awake()
    Notice._awake(self)
    self:registEvent(Event.FrameUpdate, _update)
end

function Goahead:clear()
    Notice.clear(self)
    self.contentRect = nil
end

return Goahead
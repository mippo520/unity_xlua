local GameTouch = class("GameTouch", Behaviour)

local function _touchDancer(self, pos)
    local ray = Unity.Camera.main:ScreenPointToRay(Unity.Vector3(pos.x, pos.y, 0))

    local ok, hit = CSEngineExt.Raycast(ray)
    if ok and self.lastTouchName ~= hit.transform.parent.name then
        Info.Debug("hit name is ")

        if string.find( hit.transform.parent.name, StageDefine.dancer_key )  then
            self.lastTouchName = hit.transform.parent.name
            local id = string.gsub( self.lastTouchName, StageDefine.dancer_key, "" )
            EventManagerInst:fireEvent(Event.TouchDancer, tonumber(id))
        end
    end
end

function GameTouch:ctor()
    Behaviour.ctor(self)
    self.lastTouchName = nil
end

function GameTouch:_awake()
    self:StartCoroutine(function ()
        Unity.Camera.main:ScreenPointToRay(Unity.Vector3(0, 0, 0))
    end)
end

function GameTouch:onPointerDown(eventData)
    _touchDancer(self, eventData.position)
    return true
end

function GameTouch:onDrag(eventData)
    _touchDancer(self, eventData.position)
    return true
end

function GameTouch:onBeginDrag(eventData)
    Info.Debug("GameTouch:onBeginDrag ========> " .. tostring(eventData.position))
    return true
end

function GameTouch:onEndDrag(eventData)
    self.lastTouchName = nil
    return true
end

return GameTouch
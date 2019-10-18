local GameTouch = class("GameTouch", Behaviour)

function GameTouch:onPointerDown(eventData)
    Info.Debug("GameTouch:onPointerDown ========> " .. tostring(eventData.position))
    local ray = Unity.Camera.main:ScreenPointToRay(Unity.Vector3(eventData.position.x, eventData.position.y, 0))

    local ok, hit = CSEngineExt.Raycast(ray)
    if ok then
        Info.Debug("hit name is " .. hit.transform.name)
    end
    return true
end

function GameTouch:onDrag(eventData)
    Info.Debug("GameTouch:onDrag ========> " .. tostring(eventData.position))
    return true
end

function GameTouch:onBeginDrag(eventData)
    Info.Debug("GameTouch:onBeginDrag ========> " .. tostring(eventData.position))
    return true
end

function GameTouch:onEndDrag(eventData)
    Info.Debug("GameTouch:onEndDrag ========> " .. tostring(eventData.position))
    return true
end

return GameTouch
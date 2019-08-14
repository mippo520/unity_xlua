local ImpassableBG = class("ImpassableBG", Behaviour)

function ImpassableBG:onPointerUp(eventData)
    Info.Debug("on up " .. tostring(eventData))
end

function ImpassableBG:onPointerDown(eventData)
    Info.Debug("on down " .. tostring(eventData))
end

function ImpassableBG:onPointerClick(eventData)
    Info.Debug("on click " .. tostring(eventData))
    return true
end

return ImpassableBG
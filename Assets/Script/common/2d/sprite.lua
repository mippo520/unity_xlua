local Sprite = class("Sprite")

function Sprite.Create(texture)
    return Unity.Sprite.Create(texture, Unity.Rect(0, 0, texture.width, texture.height), Unity.Vector2.zero)
end

return Sprite
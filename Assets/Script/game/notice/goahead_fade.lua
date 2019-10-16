local GoaheadFade = class("GoaheadFade", Behaviour)

function GoaheadFade:_start()
    local text = self.gameObject:GetComponent(typeof(UnityUI.Text))
    local rectTransform = self.gameObject.transform.parent.gameObject:GetComponent(typeof(Unity.RectTransform))
    local rect = Unity.Vector4(rectTransform.position.x - rectTransform.pivot.x * rectTransform.rect.width, rectTransform.position.y - rectTransform.pivot.y * rectTransform.rect.height, rectTransform.rect.width, rectTransform.rect.height)
    Info.Debug("mask rect is " .. tostring(rect))
    text.material:SetVector("_MaskRect", rect)
end

return GoaheadFade
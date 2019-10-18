local GoaheadFade = class("GoaheadFade", Behaviour)

function GoaheadFade:_start()
    local s = Unity.Screen.safeArea
    local canvasScaler = self.gameObject.transform.parent.parent.parent.gameObject:GetComponent(typeof(UnityUI.CanvasScaler))
    local scale = s.width / canvasScaler.referenceResolution.x
    local text = self.gameObject:GetComponent(typeof(UnityUI.Text))
    local rectTransform = self.gameObject.transform.parent.gameObject:GetComponent(typeof(Unity.RectTransform))
    local width = rectTransform.rect.width * scale
    local x = rectTransform.position.x - rectTransform.pivot.x * rectTransform.rect.width - (width - rectTransform.rect.width) / 2
    local rect = Unity.Vector4(x, rectTransform.position.y - rectTransform.pivot.y * rectTransform.rect.height, width, rectTransform.rect.height)
    text.material:SetVector("_MaskRect", rect)
end

return GoaheadFade
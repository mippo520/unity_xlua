local TextColor = class("TextColor", Behaviour)


function TextColor:_start()
    local text = self.gameObject:GetComponent(typeof(UnityUI.Text))
    local rectTransform = self.gameObject:GetComponent(typeof(Unity.RectTransform))
    local rect = Unity.Vector4(rectTransform.position.x - rectTransform.pivot.x * rectTransform.rect.width, rectTransform.position.y - rectTransform.pivot.y * rectTransform.rect.height, rectTransform.rect.width, rectTransform.rect.height)
    text.material:SetVector("_Rect", rect)
            
end

return TextColor
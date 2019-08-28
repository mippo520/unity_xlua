local SelectPanel = class("SelectPanel", Behaviour)

function SelectPanel:ctor()
    Behaviour.ctor(self)
    self.index = 0
    self.onClick = SimpleEvent.new()
end

function SelectPanel:onPointerClick()
    Info.Debug("click panel! index is " .. self.index)
    local img = self.gameObject:GetComponent(typeof(UnityUI.Image))
    img.material = Unity.Material(img.material)

    if img.material:GetFloat("_IsShow") > 0 then
        img.material:SetFloat("_IsShow", 0)
    else
        img.material:SetFloat("_IsShow", 1)
    end

    self.onClick:Invoke(self.index, img.material:GetFloat("_IsShow") > 0)
    return false
end

function SelectPanel:setNeighbor(heighbors)
    local img = self.gameObject:GetComponent(typeof(UnityUI.Image))
    for i, v in ipairs(heighbors) do
        local f = 0
        if v then
            f = 1
        end
        img.material:SetFloat("_Neighbor" .. i - 1, f)
    end
end

return SelectPanel
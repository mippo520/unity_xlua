local ShaderTest = class("ShaderTest", DialogBehaviour)

local function selectPanel(self, index, selected)
    if not selected then
        self.selected[index] = nil
    else
        self.selected[index] = true
    end

    for idx, _ in pairs(self.selected) do
        local panel = self.vecPanels:get(idx)
        local luaBeh = Behaviour.getLuaBehaviour(panel)
        luaBeh:setNeighbor({nil ~= self.selected[idx + 4], nil ~= self.selected[idx + 5], nil ~= self.selected[idx + 6], nil ~= self.selected[idx - 1], nil ~= self.selected[idx + 1], nil ~= self.selected[idx - 6], nil ~= self.selected[idx - 5], nil ~= self.selected[idx - 4], })
    end
end

function ShaderTest:ctor()
    DialogBehaviour.ctor(self)
    self.vecPanels = Vector.new()
    self.selected = {}
    self.boxPerLine = 5
end

function ShaderTest:_start()
    local rect = self.panel:GetComponent(typeof(Unity.RectTransform)).rect
    for i = 0, 24 do
        local panel = Unity.Object.Instantiate(self.panel, self.wrap.transform)
        self.vecPanels:push_back(panel)
        local luaBeh = Behaviour.getLuaBehaviour(panel)
        luaBeh.index = i
        local rt = panel:GetComponent(typeof(Unity.RectTransform))
        rt.anchoredPosition = Unity.Vector2(i % self.boxPerLine * rect.width - 400, math.floor(i / self.boxPerLine) * rect.height - 500)
        self:registSimpleEvent(luaBeh.onClick, selectPanel)
    end
    
    local cg = self.panel:GetComponent(typeof(Unity.CanvasGroup))
    cg.alpha = 0
    cg.interactable = false
    cg.blocksRaycasts = false

end

return ShaderTest
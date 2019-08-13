local GridView = class("GridView", ListView)

function GridView:ctor()
    ListView.ctor(self)

    self.countPerLine = 0   -- 每行数量
end

function GridView:_awake()
    ListView._awake(self)
    self.isVertical = true
    local cellRect = self.orignCell.rect
    local viewWidth = self.scrollRect.rect.width
    self.countPerLine = math.floor(viewWidth / cellRect)
end

function GridView:getCount()
    local count = ListView.getCount(self)
    if self.countPerLine > 0 then
        return math.ceil( count / self.countPerLine )
    else
        Info.Error("GridView getCount error! count per line is " .. self.countPerLine)
        return 0
    end
end

function GridView:_insertToPool(mapCell)
    for _, cell in pairs(mapCell) do
        local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
        cg.alpha = 0
        cg.interactable = false
        cg.blocksRaycasts = false
        table.insert(self.cellPool, cell)
    end
end

function GridView:_getCellRect(index)
    return self.orignCell.rect
end

function GridView:_cellInsertToTop()
    local height = self.orignCell.rect.height
    local width = self.orignCell.rect.width
    local posY = -(1 - self.orignCell.pivot.y) * height
    if not self.mapCells[self.topIndex] then
        self.mapCells[self.topIndex] = {}
    end
    local mapCells = self.mapCells[self.topIndex]
    for i = 0, self.countPerLine - 1 do
        local cellIdx = self.topIndex + i
        local cell = self:_getCell()
        local cellLuaCom = cell:GetComponent(typeof(CSLuaBehaviour))
        local cellLuaBehaviour = BehaviourManager.getBehaviour(cellLuaCom.id)
        self:_initCell(cellLuaBehaviour, cellIdx)
        mapCells[i] = cell
        local pos = cell.anchoredPosition
        pos.y = posY
        pos.x = i * width + cell.pivot.x * width
        cell.anchoredPosition = pos
        local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
        cg.alpha = 1
        cg.interactable = true
        cg.blocksRaycasts = true
    end

    return height
end

function GridView:_cellInsertToBottom(curHeight)
    local height = self.orignCell.rect.height
    local width = self.orignCell.rect.width
    local posY = -curHeight - (1 - self.orignCell.pivot.y) * height
    if not self.mapCells[self.topIndex] then
        self.mapCells[self.topIndex] = {}
    end
    local mapCells = self.mapCells[self.topIndex]
    for i = 0, self.countPerLine - 1 do
        local cellIdx = self.topIndex + i
        local cell = self:_getCell()
        local cellLuaCom = cell:GetComponent(typeof(CSLuaBehaviour))
        local cellLuaBehaviour = BehaviourManager.getBehaviour(cellLuaCom.id)
        self:_initCell(cellLuaBehaviour, cellIdx)
        mapCells[i] = cell
        local pos = cell.anchoredPosition
        pos.y = posY
        pos.x = i * width + cell.pivot.x * width
        cell.anchoredPosition = pos
        -- 设置可见和可操作
        local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
        cg.alpha = 1
        cg.interactable = true
        cg.blocksRaycasts = true    
    end
    return height
end

function GridView:_setCellPos(index, posX, posY)
    local mapCells = self.mapCells[index]
    local height = self.orignCell.rect.height
    for _, cell in pairs(mapCells) do
        local pos = cell.anchoredPosition
        pos.y = -posY - (1 - cell.pivot.y) * height
        cell.anchoredPosition = pos
    end

    return self.orignCell.rect
end

return GridView
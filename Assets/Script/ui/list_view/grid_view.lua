local GridView = class("GridView", ListView)

function GridView:ctor()
    ListView.ctor(self)

    self.countPerLine = 0   -- 每行数量
end

function GridView:_awake()
    ListView._awake(self)
    self.scroll.vertical = true
    self.scroll.horizontal = false
    self.isVertical = true
    local cellRectWidth = self.orignCell.rect.width
    local viewWidth = self.scrollRect.rect.width
    self.countPerLine = math.floor(viewWidth / cellRectWidth)
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
    for _, cell in pairs(mapCell.cells) do
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

function GridView:_insertCell(index, height)
    local cellHeight = self.orignCell.rect.height
    local width = self.orignCell.rect.width
    local posY = -height - (1 - self.orignCell.pivot.y) * cellHeight
    if not self.mapCells[index] then
        self.mapCells[index] = {}
        self.mapCells[index].cells = {}
        self.mapCells[index].rect = self.orignCell.rect
    end
    local mapCells = self.mapCells[index].cells
    local indexBegin = index * self.countPerLine
    for i = 0, self.countPerLine - 1 do
        local cellIdx = indexBegin + i
        local cell = self:_getCell()
        -- 设置可见和可操作
        local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
        cg.alpha = 1
        cg.interactable = true
        cg.blocksRaycasts = true    
        local cellLuaBehaviour = Behaviour.getLuaBehaviour(cell)
        cellLuaBehaviour.index = cellIdx
        self:_initCell(cellLuaBehaviour, cellIdx)
        mapCells[i] = cell
        local pos = cell.anchoredPosition
        pos.y = posY
        pos.x = i * width + cell.pivot.x * width
        cell.anchoredPosition = pos
    end
    return cellHeight
end

function GridView:_setCellPos(index, posX, posY)
    local mapCells = self.mapCells[index].cells
    local height = self.orignCell.rect.height
    for _, cell in pairs(mapCells) do
        local pos = cell.anchoredPosition
        pos.y = -posY - (1 - cell.pivot.y) * height
        cell.anchoredPosition = pos
    end

    return self.orignCell.rect
end

return GridView
local ListView = class("ListView", Behaviour)
local MovementType = UnityUI.ScrollRect.MovementType

local function _updateList(self)
    local count = self:getCount()
    local topRemoveHeight = 0   -- 顶部移除的cell的高度
    -- 如果是顶部有多出并且索引号不是第一个,才把底部多出的cell回收
    -- 底部也同理
    if self.topOffset < 0 then
        if self.topIndex > 0 then
            local bottomCell = self.mapCells[self.bottomIndex]
            local bottomCellHeight = 0
            while bottomCell do
                if self.isVertical then
                    bottomCellHeight = bottomCell.rect.height
                else
                    bottomCellHeight = bottomCell.rect.width
                end
    
                if self.bottomOffset > bottomCellHeight then
                    self.bottomOffset = self.bottomOffset - bottomCellHeight
                    self:_insertToPool(bottomCell)
                    self.mapCells[self.bottomIndex] = nil
                    self.bottomIndex = self.bottomIndex - 1
                    bottomCell = self.mapCells[self.bottomIndex]
                else
                    break
                end
            end
        else
            -- 已经是第一个了就直接返回
            return
        end
    elseif self.bottomOffset < 0 then
        if self.bottomIndex < count - 1 then
            local topCell = self.mapCells[self.topIndex]
            local topCellHeight = 0
            while topCell do
                if self.isVertical then
                    topCellHeight = topCell.rect.height
                else
                    topCellHeight = topCell.rect.width
                end

                if self.topOffset > topCellHeight then
                    self.topOffset = self.topOffset - topCellHeight
                    self:_insertToPool(topCell)
                    self.mapCells[self.topIndex] = nil
                    self.topIndex = self.topIndex + 1
                    topRemoveHeight = topRemoveHeight + topCellHeight
                    topCell = self.mapCells[self.topIndex]
                else
                    break
                end
            end
            if topRemoveHeight > 0 then
                local posX = 0
                local posY = 0
                for i = self.topIndex, self.bottomIndex do
                    local rect = self:_setCellPos(i, posX, posY)
                    posY = posY + rect.height
                    posX = posX + rect.width
                end
            end
        else
            -- 已经是最后一个了就直接返回
            return
        end
    end

    -- 如果顶部多出的部分为负数则往上面补
    local topAddHeight = 0
    while self.topOffset < 0 do
        if self.topIndex > 0 then
            self.topIndex = self.topIndex - 1
            local cellHeight = self:_cellInsertToTop()
            self.topOffset = self.topOffset + cellHeight
            topAddHeight = topAddHeight + cellHeight
        else
            self.topOffset = 0
        end
    end
    -- 顶部如果有添加则后面的cell位置要变化
    if topAddHeight > 0 then
        local rect = self.mapCells[self.topIndex].rect
        local posY = rect.height
        local posX = rect.width
        for i = self.topIndex + 1, self.bottomIndex do
            local rect = self:_setCellPos(i, posX, posY)
            posY = posY + rect.height
            posX = posX + rect.width
        end
    end

    -- 计算当前已经存在的cell的高度
    local curHeight = 0
    for i = self.topIndex, self.bottomIndex do
        local rect = self:_getCellRect(i)
        if self.isVertical then
            curHeight = rect.height + curHeight
        else
            curHeight = rect.width + curHeight
        end
    end

    -- 计算后面的cell,移动坐标或者增加
    local viewHeight = self.viewHeight + self.topOffset
    while curHeight < viewHeight and self.bottomIndex < count - 1 do
        self.bottomIndex = self.bottomIndex + 1
        local cellHeight = self:_cellInsertToBottom(curHeight)
        curHeight = curHeight + cellHeight
    end

    local contentHeight = math.max(curHeight, viewHeight)
    self.bottomOffset = contentHeight - viewHeight
    local movementDis = topAddHeight - topRemoveHeight
    self.onDrageMovementDis = self.onDrageMovementDis + movementDis  --[[ 计算content因为拖动而造成的位置差 ]]
    if self.isVertical then
        self.content.sizeDelta = Unity.Vector2(self.content.sizeDelta.x, contentHeight)
        self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x, self.content.anchoredPosition.y + movementDis)
    else
        self.content.sizeDelta = Unity.Vector2(contentHeight, self.content.sizeDelta.y)
        self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x - movementDis, self.content.anchoredPosition.y)
    end

    self.lastContentPos = self.content.anchoredPosition
    if curHeight < viewHeight then
        return true
    end
end

local function _updateDragArea(self, moveVec2)
    local offset = self.content.anchoredPosition - self.lastContentPos
    -- 竖的移动计算y的偏移量,横的移动计算x的偏移量
    if self.isVertical then
        self.topOffset = self.topOffset + offset.y
        self.bottomOffset = self.bottomOffset - offset.y
    else
        self.topOffset = self.topOffset - offset.x
        self.bottomOffset = self.bottomOffset + offset.x
    end
    if self.topOffset < 0 or self.bottomOffset < 0 then
        _updateList(self)
    end
    self.lastContentPos = self.content.anchoredPosition
end

local function _collectionCells(self)
    for i = self.topIndex, self.bottomIndex do
        self:_insertToPool(self.mapCells[i])
        self.mapCells[i] = nil
    end
end

function ListView:ctor()
    Behaviour.ctor(self)
    self.topIndex = 0           -- 顶部cell的索引号
    self.bottomIndex = -1       -- 底部cell的索引号
    self.topOffset = 0          -- 顶部多出的距离
    self.bottomOffset = 0       -- 底部多出的距离
    self.mapCells = {}
    self.cellPool = {}
    self.cellParent = nil
    self.lastContentPos = nil
    self.onDrageMovementDis = 0   -- 拖动时content重新计算的位置差
    self.viewHeight = 0           -- 可是范围的距离,纵向为y方向,横向为x方向
    self.isOnDrag = false
    self.reverse = false
end

function ListView:toTop()
    -- 正在拖拉的时候不通过代码修改位置
    if self.isOnDrag then
        return 
    end
    _collectionCells(self)
    -- 把content的坐标设置为起始坐标
    if self.isVertical then
        self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x, self.viewHeight / 2)
    else
        self.content.anchoredPosition = Unity.Vector2(-self.viewHeight / 2, self.content.anchoredPosition.y)
    end

    self.topIndex = 0
    self.bottomIndex = -1
    self.topOffset = 0
    self.bottomOffset = 0
    _updateList(self)
    self.scroll:StopMovement()
end

function ListView:toBottom()
    -- 正在拖拉的时候不通过代码修改位置
    if self.isOnDrag then
        return 
    end
    
    _collectionCells(self)
    -- 把content的坐标设置为最底
    if self.isVertical then
        self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x, -self.viewHeight / 2)
    else
        self.content.anchoredPosition = Unity.Vector2(self.viewHeight / 2, self.content.anchoredPosition.y)
    end

    local count = self:getCount()
    self.topIndex = count
    self.bottomIndex = count - 1
    self.topOffset = -self.viewHeight
    self.bottomOffset = 0
    _updateList(self)
    self.scroll:StopMovement()
end

function ListView:toIndex(index)
    -- 正在拖拉的时候不通过代码修改位置
    if self.isOnDrag then
        return 
    end
    local count = self:getCount()
    if 0 >= index then
        self:toTop()
        if index < 0 then
            Info.Warn("ListView to index is error! index is " .. index)
        end
    elseif count - 1 <= index then
        self:toBottom()
        if index >= count then
            Info.Warn("ListView to index is error! index is " .. index .. ", but cell count is " .. count)
        end
    else
        _collectionCells(self)
        -- 把content的坐标设置为起始坐标
        if self.isVertical then
            self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x, self.viewHeight / 2)
        else
            self.content.anchoredPosition = Unity.Vector2(-self.viewHeight / 2, self.content.anchoredPosition.y)
        end
        self.topIndex = index
        self.bottomIndex = index - 1
        self.topOffset = 0
        self.bottomOffset = 0
        local notCover = _updateList(self)
        if notCover and self.topIndex > 0 then
            self:toBottom()
        end
        self.scroll:StopMovement()
    end
end

function ListView:getCount()
    if not self._getCount() then
        Info.Error("Please implement the _getCount function to set cell count!")
    else
        return self:_getCount()
    end
    return 0
end

function ListView:_getCell()
    local cell = nil
    if #self.cellPool > 0 then
        cell = self.cellPool[1]
        table.remove(self.cellPool, 1)
    else
        cell = Unity.Object.Instantiate(self.orignCell, self.cellParent)
    end
    return cell
end

function ListView:_insertToPool(cell)
    local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
    cg.alpha = 0
    cg.interactable = false
    cg.blocksRaycasts = false
    table.insert(self.cellPool, cell)
end

function ListView:_initCell(cellBehaviour, index)
    Info.Error("Please override _initCell function to init cell!")
    return nil
end

function ListView:_awake()
    self.scroll = self.gameObject:GetComponent(typeof(CSLuaScrollRect))
    self.scrollRect = self.gameObject:GetComponent(typeof(Unity.RectTransform))
    self.scrollCanvasGroup = self.gameObject:GetComponent(typeof(Unity.CanvasGroup))
    self.content = self.gameObject.transform:GetChild(0):GetChild(0):GetComponent(typeof(Unity.RectTransform))
    self.orignCell = self.content:GetChild(0):GetComponent(typeof(Unity.RectTransform))
    Tools.Assert((self.scroll.vertical or self.scroll.horizontal), "Please set a scroll direction!")
    Tools.Assert((not (self.scroll.vertical and self.scroll.horizontal)), "Can not set both vertical and horizontal are true!")
    self.isVertical = self.scroll.vertical
    self.cellParent = self.orignCell.transform.parent
    local cg = self.orignCell:GetComponent(typeof(Unity.CanvasGroup))
    cg.alpha = 0
    cg.interactable = false
    cg.blocksRaycasts = false
    if self.isVertical then
        self.viewHeight = self.scrollRect.rect.height
    else
        self.viewHeight = self.scrollRect.rect.width
    end
    self:addListener(self.scroll.onValueChanged, _updateDragArea)
    if self.reverse then
        local rect = self.gameObject:GetComponent(typeof(Unity.RectTransform))
        rect:Rotate(0, 0, 180)
        local cellRect = self.orignCell:GetComponent(typeof(Unity.RectTransform))
        cellRect:Rotate(0, 0, 180)
    end
end

function ListView:_start()
    _updateList(self)
end

function ListView:_getCellRect(index)
    return self.mapCells[index].rect
end

function ListView:_cellInsertToTop()
    local cell = self:_getCell()
    local cellLuaCom = cell:GetComponent(typeof(CSLuaBehaviour))
    local cellLuaBehaviour = BehaviourManager.getBehaviour(cellLuaCom.id)
    self:_initCell(cellLuaBehaviour, self.topIndex)
    self.mapCells[self.topIndex] = cell
    local pos = cell.anchoredPosition
    local cellHeight = 0
    if self.isVertical then
        cellHeight = cell.rect.height
        pos.y =  -(1 - cell.pivot.y) * cellHeight
    else
        cellHeight = cell.rect.width
        pos.x = cell.pivot.x * cellHeight
    end
    cell.anchoredPosition = pos
    local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
    cg.alpha = 1
    cg.interactable = true
    cg.blocksRaycasts = true
    return cellHeight
end

function ListView:_cellInsertToBottom(curHeight)
    local cell = self:_getCell()
    local cellLuaCom = cell:GetComponent(typeof(CSLuaBehaviour))
    local cellLuaBehaviour = BehaviourManager.getBehaviour(cellLuaCom.id)
    self:_initCell(cellLuaBehaviour, self.bottomIndex)
    self.mapCells[self.bottomIndex] = cell
    -- 设置坐标
    local pos = cell.anchoredPosition
    local cellHeight = 0
    if self.isVertical then
        cellHeight = cell.rect.height
        pos.y = -curHeight - (1 - cell.pivot.y) * cellHeight
    else
        cellHeight = cell.rect.width
        pos.x = curHeight + cell.pivot.x * cellHeight
    end
    cell.anchoredPosition = pos
    -- 设置可见和可操作
    local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
    cg.alpha = 1
    cg.interactable = true
    cg.blocksRaycasts = true
    return cellHeight
end

function ListView:_setCellPos(index, posX, posY)
    local cell = self.mapCells[index]
    local pos = cell.anchoredPosition
    if self.isVertical then
        local height = cell.rect.height
        pos.y = -posY - (1 - cell.pivot.y) * height
    else
        local width = cell.rect.width
        pos.x = posX + cell.pivot.x * width
    end
    cell.anchoredPosition = pos
    return cell.rect
end

function ListView:onBeginDrag()
    self.onDrageMovementDis = 0
    self.isOnDrag = true
end

function ListView:onEndDrag()
    self.onDrageMovementDis = 0
    self.isOnDrag = false
end

function ListView:onDrag(eventData)
    if not Tools.IsNumberEqual(self.onDrageMovementDis, 0) then
        -- 即使代码修改了content的位置但是通过的时候引擎计算的仍然是原来的位置,所以拖动的时候要减去代码移动的位置差
        if self.isVertical then
            self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x, self.content.anchoredPosition.y + self.onDrageMovementDis)
        else
            self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x - self.onDrageMovementDis, self.content.anchoredPosition.y)
        end
    end
end

return ListView
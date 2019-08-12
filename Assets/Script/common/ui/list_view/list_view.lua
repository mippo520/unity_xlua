local ListView = class("ListView", Behaviour)
local MovementType = UnityUI.ScrollRect.MovementType

local function _updateList(self)
    local count = self:_getCount()
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
                    self.bottomIndex = self.bottomIndex - 1
                    self:_insertToPool(self, bottomCell)
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
                    self.topIndex = self.topIndex + 1
                    self:_insertToPool(self, topCell)
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
                    local cell = self.mapCells[i]
                    local pos = cell.anchoredPosition
                    if self.isVertical then
                        pos.y = -posY
                        posY = posY + cell.rect.height
                    else
                        pos.x = posX
                        posX = posX + cell.rect.width
                    end
                    cell.anchoredPosition = pos
                end
            end
        else
            -- 已经是最后一个了就直接返回
            return
        end
    end

    -- 计算当前已经存在的cell的高度
    local curHeight = 0
    for i = self.topIndex, self.bottomIndex do
        if self.isVertical then
            curHeight = self.mapCells[i].rect.height + curHeight
        else
            curHeight = self.mapCells[i].rect.width + curHeight
        end
    end

    -- 如果顶部多出的部分为负数则往上面补
    local topAddHeight = 0
    while self.topOffset < 0 do
        if self.topIndex > 0 then
            self.topIndex = self.topIndex - 1

            local cell = self:_getCell(self)
            local cellLuaCom = cell:GetComponent(typeof(CSLuaBehaviour))
            local cellLuaBehaviour = BehaviourManager.getBehaviour(cellLuaCom.id)
            self:_initCell(cellLuaBehaviour, self.topIndex)
            self.mapCells[self.topIndex] = cell
            local pos = cell.anchoredPosition
            local cellHeight = 0
            if self.isVertical then
                pos.y = 0
                cellHeight = cell.rect.height
            else
                pos.x = 0
                cellHeight = cell.rect.width
            end
            cell.anchoredPosition = pos
     
            curHeight = curHeight + cellHeight
            local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
            cg.alpha = 1
            cg.interactable = true
            cg.blocksRaycasts = true
            self.topOffset = self.topOffset + cellHeight
            topAddHeight = topAddHeight + cellHeight
        else
            self.topOffset = 0
        end
    end
    -- 顶部如果有添加则后面的cell位置要变化
    if topAddHeight > 0 then
        local posY = self.mapCells[self.topIndex].rect.height
        local posX = self.mapCells[self.topIndex].rect.width
        for i = self.topIndex + 1, self.bottomIndex do
            local cell = self.mapCells[i]
            local pos = cell.anchoredPosition
            if self.isVertical then
                pos.y = -posY
                posY = posY + cell.rect.height
            else
                pos.x = posX
                posX = posX + cell.rect.width
            end
            cell.anchoredPosition = pos
        end
    end

    -- 计算后面的cell,移动坐标或者增加
    local viewHeight = self.viewHeight + self.topOffset
    while curHeight < viewHeight and self.bottomIndex < self:_getCount() do
        self.bottomIndex = self.bottomIndex + 1
        local cell = self:_getCell(self)
        local cellLuaCom = cell:GetComponent(typeof(CSLuaBehaviour))
        local cellLuaBehaviour = BehaviourManager.getBehaviour(cellLuaCom.id)
        self:_initCell(cellLuaBehaviour, self.bottomIndex)
        self.mapCells[self.bottomIndex] = cell
        -- 设置坐标
        local pos = cell.anchoredPosition
        if self.isVertical then
            pos.y = -curHeight
            curHeight = curHeight + cell.rect.height
        else
            pos.x = curHeight
            curHeight = curHeight + cell.rect.width
        end
        cell.anchoredPosition = pos
        -- 设置可见和可操作
        local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
        cg.alpha = 1
        cg.interactable = true
        cg.blocksRaycasts = true
    end
    self.bottomOffset = curHeight - viewHeight
    local movementDis = topAddHeight - topRemoveHeight
    self.onDrageMovementDis = self.onDrageMovementDis + movementDis  --[[ 计算content因为拖动而造成的位置差 ]]
    if self.isVertical then
        self.content.sizeDelta = Unity.Vector2(self.content.sizeDelta.x, math.max(curHeight, self.viewHeight))
        self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x, self.content.anchoredPosition.y + movementDis)
    else
        self.content.sizeDelta = Unity.Vector2(math.max(curHeight, self.viewHeight), self.content.sizeDelta.y)
        self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x - movementDis, self.content.anchoredPosition.y)
    end

    self.lastContentPos = self.content.anchoredPosition
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
    self.dragDistance = 0
end

function ListView:_getCount()
    Info.Error("Please rewrite this function to set list count!")
    return 0
end

function ListView:_getCell(self)
    local cell = nil
    if #self.cellPool > 0 then
        cell = self.cellPool[1]
        table.remove(self.cellPool, 1)
    else
        cell = Unity.Object.Instantiate(self.orignCell, self.cellParent)
    end
    return cell
end

function ListView:_insertToPool(self, cell)
    local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
    cg.alpha = 0
    cg.interactable = false
    cg.blocksRaycasts = false
    table.insert(self.cellPool, cell)
end

function ListView:_initCell(cellBehaviour, index)
    Info.Error("Please rewrite this function to init cell!")
    return cellBehaviour
end

function ListView:_start()
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

    _updateList(self)
end

function ListView:onBeginDrag()
    self.onDrageMovementDis = 0
end

function ListView:onEndDrag()
    self.onDrageMovementDis = 0
end

function ListView:onDrag(eventData)
    if not Tools.IsNumberEqual(self.onDrageMovementDis, 0) then
        -- 即使代码修改了content的位置但是通过的时候引擎计算的仍然是原来的位置,所以拖动的时候要减去位置差
        if self.isVertical then
            self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x, self.content.anchoredPosition.y + self.onDrageMovementDis)
        else
            self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x - self.onDrageMovementDis, self.content.anchoredPosition.y)
        end
    end
end

return ListView
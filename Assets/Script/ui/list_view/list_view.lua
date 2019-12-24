local ListView = class("ListView", Behaviour)
local MovementType = UnityUI.ScrollRect.MovementType

function ListView:_updateList()
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
        end
    end

    -- 如果顶部多出的部分为负数则往上面补
    local topAddHeight = 0
    while self.topOffset < 0 do
        if self.topIndex > 0 then
            self.topIndex = self.topIndex - 1
            local cellHeight = self:_insertCell(self.topIndex, 0)
            self.topOffset = self.topOffset + cellHeight
            topAddHeight = topAddHeight + cellHeight
        else
            break
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

    if self.bottomIndex >= count - 1 then
        return
    end
    -- 计算后面的cell,移动坐标或者增加
    local viewHeight = self.viewHeight + self.topOffset
    while curHeight < viewHeight and self.bottomIndex < count - 1 do
        self.bottomIndex = self.bottomIndex + 1
        local cellHeight = self:_insertCell(self.bottomIndex, curHeight)
        curHeight = curHeight + cellHeight
    end

    local contentHeight = math.max(curHeight, viewHeight)
    self.bottomOffset = contentHeight - viewHeight
    local movementDis = topAddHeight - topRemoveHeight
    self.onDragMovementDis = self.onDragMovementDis + movementDis  --[[ 计算content因为拖动而造成的位置差 ]]
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

local function _onScrollChanged(self, moveVec2)
    if not self.lastContentPos then
        return
    end
    
    local offset = self.content.anchoredPosition - self.lastContentPos
    -- 竖的移动计算y的偏移量,横的移动计算x的偏移量
    if self.isVertical then
        self.topOffset = self.topOffset + offset.y
        self.bottomOffset = self.bottomOffset - offset.y
    else
        self.topOffset = self.topOffset - offset.x
        self.bottomOffset = self.bottomOffset + offset.x
    end
    if self.forceFlush or self.topOffset < 0 or self.bottomOffset < 0 then
        self:_updateList()
    end
    self.lastContentPos = self.content.anchoredPosition

    -- 控制等待动画
    if self.waitAnimateCG.alpha > 0 then
        if self.topDragUpdate and self.topOffset < 0 then
            local pos = self.waitAnimate.transform.localPosition
            if self.isVertical then
                pos.y = -self.topOffset / 2
            else
                pos.x = self.topOffset / 2
            end
            self.waitAnimate.transform.localPosition = pos
            if self.topOffset > -1 then
                self.waitAnimateCG.alpha = 0
            end
        elseif self.bottomDragUpdate and self.bottomOffset < 0 then
            local pos = self.waitAnimate.transform.localPosition
            if self.isVertical then
                pos.y = -self.content.rect.height + self.bottomOffset / 2
            else
                pos.x = self.content.rect.width - self.bottomOffset / 2
            end
            self.waitAnimate.transform.localPosition = pos
            if self.bottomOffset > -1 then
                self.waitAnimateCG.alpha = 0
            end
        end
    end
end

local function _collectionCells(self)
    for _, cell in pairs(self.mapCells) do
        self:_insertToPool(cell)
    end
    self.mapCells = {}
end

local function _stopAction(self)
    -- self.cover.interactable = false
    self.cover.blocksRaycasts = true
end

local function _startAction(self)
    -- self.cover.interactable = true
    self.cover.blocksRaycasts = false
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
    self.onDragMovementDis = 0   -- 拖动时content重新计算的位置差
    self.viewHeight = 0           -- 可是范围的距离,纵向为y方向,横向为x方向
    self.isOnDrag = false
    self.reverse = false
    self.isVertical = true          -- 是否纵向拖动,true为纵向拖动,false为横向拖动
    self.forceFlush = false         -- 拖拉的时候是否每次都调用_updateList
	self.countPerLine = 1   		-- 每行数量
	self.topRetain = 0				-- 上面空出的高度
	self.bottomRetain = 0			-- 下面空出的高度
end

-- 拉到最顶
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
    self:_updateList()
    self.scroll:StopMovement()
end

-- 拉到最底
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
    self:_updateList()
    self.scroll:StopMovement()
end

-- 将指定的索引设置为第一个
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
        local notFull = self:_updateList()
        if notFull and self.topIndex > 0 then
            self:toBottom()
        end
        self.scroll:StopMovement()
    end
end

-- 刷新cell
function ListView:refresh()
    _collectionCells(self)
    self.bottomIndex = self.topIndex - 1
    local notFull = self:_updateList()
    if notFull and self.topIndex > 0 then
        self:toBottom()
    end
end

-- 是否处于激活状态
function ListView:isAction()
    return not self.cover.blocksRaycasts
end

-- 拖拽刷新结束
function ListView:updateFinish()
    self.scroll.movementType = UnityUI.ScrollRect.MovementType.Elastic
    _startAction(self)
    self.waitAnimate:SetBool("bRotate", false)
    self.waitAnimateCG.alpha = 0
end

-- 设置当前第一个cell的索引
function ListView:setTopIndex(index)
    if self.topIndex == index then
        return
    end

    _collectionCells(self)
    self.topIndex = index
    self:refresh()
end

-- 是否在最上面
function ListView:isTop()
    return 0 == self.topIndex
end

-- 是否在最下面
function ListView:isBottom()
    return self:getCount() - 1 == self.bottomIndex
end

function ListView:getCount()
    if not self._getCount then
        Info.Error("Please implement the _getCount function to set cell count!")
    else
        return self:_getCount() + 2 * self.countPerLine
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
        local cellLuaBehaviour = Behaviour.getLuaBehaviour(cell)
        self:registSimpleEvent(cellLuaBehaviour.onClick, self.onCellClicked)
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
    self.isVertical = self.scroll.vertical
    self.scrollRect = self.gameObject:GetComponent(typeof(Unity.RectTransform))
    self.scrollCanvasGroup = self.gameObject:GetComponent(typeof(Unity.CanvasGroup))
    self.content = self.gameObject.transform:GetChild(0):GetChild(0):GetComponent(typeof(Unity.RectTransform))
    self.content.sizeDelta = Unity.Vector2(self.scrollRect.rect.width, self.scrollRect.rect.height)
    self.orignCell = self.content:GetChild(1):GetComponent(typeof(Unity.RectTransform))
    self.waitAnimate = self.content:GetChild(0):GetComponent(typeof(Unity.Animator))
    local pos = self.waitAnimate.transform.localPosition
    if self.isVertical then
        pos.x = self.content.rect.width / 2
    else
        pos.y = -self.content.rect.height / 2
    end
    self.waitAnimate.transform.localPosition = pos

    self.waitAnimateCG = self.waitAnimate:GetComponent(typeof(Unity.CanvasGroup))
    self.waitAnimateCG.alpha = 0

    self.cellParent = self.orignCell.transform.parent
    self.cover = self.gameObject.transform:GetChild(1):GetComponent(typeof(Unity.CanvasGroup))
    local cg = self.orignCell:GetComponent(typeof(Unity.CanvasGroup))
    cg.alpha = 0
    cg.interactable = false
    cg.blocksRaycasts = false
    if self.isVertical then
        self.viewHeight = self.scrollRect.rect.height
    else
        self.viewHeight = self.scrollRect.rect.width
    end

    self.content.anchoredPosition = Unity.Vector2(-self.scrollRect.rect.width / 2, self.scrollRect.rect.height / 2)

    self:addListener(self.scroll.onValueChanged, _onScrollChanged)
    if self.reverse then
        local rect = self.gameObject:GetComponent(typeof(Unity.RectTransform))
        rect:Rotate(0, 0, 180)
        local cellRect = self.orignCell:GetComponent(typeof(Unity.RectTransform))
        cellRect:Rotate(0, 0, 180)
    end
end

function ListView:_start()
    Tools.Assert((self.scroll.vertical or self.scroll.horizontal), "Please set a scroll direction!")
    Tools.Assert((not (self.scroll.vertical and self.scroll.horizontal)), "Can not set both vertical and horizontal are both true!")
    self:_updateList()
end

function ListView:_getCellRect(index)
   	return self.mapCells[index].rect
end

function ListView:_insertCell(index, height)
	local cell = self:_getCell()
	self.mapCells[index] = cell
	-- 设置可见和可操作
	local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
	cg.alpha = 1
	cg.interactable = true
	cg.blocksRaycasts = true
	-- 获取cell对应的lua对象
	local cellLuaBehaviour = Behaviour.getLuaBehaviour(cell)
	cellLuaBehaviour.index = index - 1
	-- 初始化
	
	local cellHeight = 0
	local cg = cell:GetComponent(typeof(Unity.CanvasGroup))
	if 0 == index then
		cg.alpha = 0
		cg.interactable = false
		cg.blocksRaycasts = false

		cell.sizeDelta = Unity.Vector2(cell.sizeDelta.x, self.topRetain)
	elseif self:getCount() - 1 == index then
		cg.alpha = 0
		cg.interactable = false
		cg.blocksRaycasts = false
		
		cell.sizeDelta = Unity.Vector2(cell.sizeDelta.x, self.bottomRetain)
	else
		cg.alpha = 1
		cg.interactable = true
		cg.blocksRaycasts = true
		
		cell.sizeDelta = Unity.Vector2(cell.sizeDelta.x, self.orignCell.rect.height)
		self:_initCell(cellLuaBehaviour, index - 1)
	end
	-- 设置坐标
	local pos = cell.anchoredPosition
	if self.isVertical then
		cellHeight = cell.rect.height
		pos.y = -height - (1 - cell.pivot.y) * cellHeight
	else
		cellHeight = cell.rect.width
		pos.x = height + cell.pivot.x * cellHeight
	end
	cell.anchoredPosition = pos
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

function ListView:_getCellPos(index)
    local cell = self.mapCells[index]
    local pos = cell.anchoredPosition
    if self.isVertical then
        pos.y = -pos.y - cell.pivot.y * cell.rect.height
    else
        pos.x = pos.x - cell.pivot.x * cell.rect.width
    end
    return pos
end

function ListView:_getCellCenterPos(index)
    local cell = self.mapCells[index]
    local pos = cell.anchoredPosition
    if self.isVertical then
        pos.y = -pos.y - cell.pivot.y * cell.rect.height - 0.5 * cell.rect.height
    else
        pos.x = pos.x - cell.pivot.x * cell.rect.width + 0.5 * cell.rect.width
    end
    return pos
end

function ListView:onScrollBeginDrag()
    self.onDragMovementDis = 0
    self.isOnDrag = true
    self.lastContentPos = self.content.anchoredPosition
end

function ListView:onScrollEndDrag()
    self.onDragMovementDis = 0
    self.isOnDrag = false
     -- 判断是否拖拽刷新
    if self.topDragUpdate and self.topOffset < -self.dragDistance then
        self.scroll.movementType = UnityUI.ScrollRect.MovementType.Unrestricted
        self.scroll:StopMovement()
        _stopAction(self)
        self:onTopUpdate()
        self.waitAnimate:SetBool("bRotate", true)
    elseif self.bottomDragUpdate and self.bottomOffset < -self.dragDistance then
        self.scroll.movementType = UnityUI.ScrollRect.MovementType.Unrestricted
        self.scroll:StopMovement()
        _stopAction(self)
        self:onBottomUpdate()
        self.waitAnimate:SetBool("bRotate", true)
    end
end

function ListView:onScrollDrag(eventData)
    if not Tools.IsNumberEqual(self.onDragMovementDis, 0) then
		eventData.delta = eventData.delta / ApplicationInst.deviceScale
        -- 即使代码修改了content的位置但是拖拉的时候引擎计算的仍然是原来的位置,所以自己手动计算位置,把移动的距离加上上一次的位置
        if self.isVertical then
            if self.reverse then
                self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x, self.lastContentPos.y - eventData.delta.y)
            else
                self.content.anchoredPosition = Unity.Vector2(self.content.anchoredPosition.x, self.lastContentPos.y + eventData.delta.y)
            end
        else
            if self.reverse then
                self.content.anchoredPosition = Unity.Vector2(self.lastContentPos.x - eventData.delta.x, self.content.anchoredPosition.y)
            else
                self.content.anchoredPosition = Unity.Vector2(self.lastContentPos.x + eventData.delta.x, self.content.anchoredPosition.y)
            end
        end
    end

    if self.topDragUpdate and self.topOffset < -1 and self.waitAnimateCG.alpha <= 0 then
        self.waitAnimateCG.alpha = 1
    elseif self.bottomDragUpdate and self.bottomOffset < -1 and self.waitAnimateCG.alpha <= 0 then
        self.waitAnimateCG.alpha = 1
    elseif self.topOffset > -1 and self.bottomOffset > -1 and self.waitAnimateCG.alpha > 0 then
        self.waitAnimateCG.alpha = 0
    end
end

function ListView:onCellClicked(cellBehaviour)
    Info.Error("Please override onCellClicked function when cell clicked! cell index is " .. cellBehaviour.index)
end

function ListView:onTopUpdate()
    Info.Error("Please override onTopUpdate function when drag top update!")
end

function ListView:onBottomUpdate()
    Info.Error("Please override onBottomUpdate function when drag bottom update!")
end

return ListView
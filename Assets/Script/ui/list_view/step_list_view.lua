local StepListView = class("StepListView", ListView)

local function _frameUpdate(self, dt)
    if self.endIndex >= 0 then
        if self.endIndex < self.topIndex then
            self.centerIndex = self.topIndex
            self.beginMove = true
        elseif self.endIndex > self.bottomIndex then
            self.centerIndex = self.bottomIndex
            self.beginMove = true
        else
            self.centerIndex = self.endIndex
            self.endIndex = -1
            self.beginMove = true
        end
    end
    if self.beginMove and self.centerIndex >= 0 then
        local pos = self:_getCellCenterPos(self.centerIndex)
        local dis = pos.x - self.topOffset - self.viewHeight / 2
        local speed = self.speed
        if -1 ~= self.endIndex then
            speed = self.findSpeed
        end
        local moveDis = speed * dt / 1000
        if moveDis > math.abs(dis) then
            moveDis = math.abs(dis)
            self.centerIndex = -1
            self.beginMove = false
        end

        local anchoredPosition = self.content.anchoredPosition
        if dis > 0 then
            anchoredPosition.x = anchoredPosition.x - moveDis
        else
            anchoredPosition.x = anchoredPosition.x + moveDis
        end
        self.content.anchoredPosition = anchoredPosition
    end
end

function StepListView:ctor()
    ListView.ctor(self)
    self.forceFlush = true
    self.beginMove = false
    self.centerIndex = -1
    self.endIndex = -1
    self.speed = 1000
    self.findSpeed = 4000
    self.dir = 0
end

function StepListView:toTop()
    self.endIndex = 0
end

function StepListView:toBottom()
    self.endIndex = self:getCount() - 1
end

function StepListView:toIndex(index)
    if index >= 0 and index < self:getCount() then
        self.endIndex = index
    end
end

function StepListView:_awake()
    ListView._awake(self)
    self:registEvent(Event.FrameUpdate, _frameUpdate)
end

function StepListView:_start()
    ListView._start(self)
    -- self:toIndex(6)
end

function StepListView:_updateList()
    local ret = ListView._updateList(self)
    local count = self:getCount()
    if 0 == self.topIndex and self.mapCells[self.topIndex] then -- 处理头部的时候的情况
        local pos = self:_getCellPos(self.topIndex)
        local rect = self:_getCellRect(self.topIndex)
        if self.topOffset < 0 then
            local disToCenter = self.viewHeight / 2 - rect.width / 2 - pos.x
            if disToCenter > 0 then
                local disOffset = 0
                if disToCenter < -self.topOffset then
                    disOffset = -self.topOffset - disToCenter
                    self.topOffset = self.topOffset + disOffset
                end
    
                local sizeDelta = self.content.sizeDelta
                sizeDelta.x = sizeDelta.x - self.topOffset
                self.content.sizeDelta = sizeDelta
                local anchoredPosition = self.content.anchoredPosition
                anchoredPosition.x = anchoredPosition.x + self.topOffset
                self.content.anchoredPosition = anchoredPosition
                self.lastContentPos = self.content.anchoredPosition
                self.onDragMovementDis = self.onDragMovementDis - self.topOffset
                
                for index, cell in pairs(self.mapCells) do
                    local cellPos = cell.anchoredPosition
                    cellPos.x = cellPos.x - self.topOffset
                    cell.anchoredPosition = cellPos
                end
                self.topOffset = -disOffset
                ret = true
            end
        elseif self.topOffset > 0 and pos.x > 0 then
            local disOffset = 0
            if self.topOffset > pos.x then
                disOffset = self.topOffset - pos.x
                self.topOffset = self.topOffset - disOffset
            end

            local sizeDelta = self.content.sizeDelta
            sizeDelta.x = sizeDelta.x - self.topOffset
            self.content.sizeDelta = sizeDelta
            local anchoredPosition = self.content.anchoredPosition
            anchoredPosition.x = anchoredPosition.x + self.topOffset
            self.content.anchoredPosition = anchoredPosition
            self.lastContentPos = self.content.anchoredPosition
            self.onDragMovementDis = self.onDragMovementDis - self.topOffset
            
            for index, cell in pairs(self.mapCells) do
                local cellPos = cell.anchoredPosition
                cellPos.x = cellPos.x - self.topOffset
                cell.anchoredPosition = cellPos
            end
            self.topOffset = disOffset
            ret = true
        end
    elseif count - 1 == self.bottomIndex and self.mapCells[self.bottomIndex] then   -- 处理尾部的情况
        local pos = self:_getCellPos(self.bottomIndex)
        local rect = self:_getCellRect(self.bottomIndex)
        if self.bottomOffset < 0 then
            local disToCenter = (pos.x - self.topOffset) - (self.viewHeight / 2 - rect.width / 2) 
            if disToCenter > 0 then
                local disOffset = 0
                if disToCenter < -self.bottomOffset then
                    disOffset = -self.bottomOffset - disToCenter
                    self.bottomOffset = self.bottomOffset + disOffset
                end
    
                local sizeDelta = self.content.sizeDelta
                sizeDelta.x = sizeDelta.x - self.bottomOffset
                self.content.sizeDelta = sizeDelta
                self.onDragMovementDis = self.onDragMovementDis - self.bottomOffset
                
                self.bottomOffset = -disOffset
                ret = true
            end
        elseif self.bottomOffset > 0 then
            local disToBottom = self.viewHeight - (pos.x - self.topOffset + rect.width)
            if disToBottom > 0 then
                local disOffset = 0
                if self.bottomOffset > disToBottom then
                    disOffset = self.bottomOffset - disToBottom
                    self.bottomOffset = self.bottomOffset - disOffset
                end

                local sizeDelta = self.content.sizeDelta
                sizeDelta.x = sizeDelta.x - self.bottomOffset
                self.content.sizeDelta = sizeDelta
                self.onDragMovementDis = self.onDragMovementDis - self.bottomOffset
                
                self.bottomOffset = disOffset
                ret = true
            end
        end
    end

    return ret
end

function StepListView:onScrollBeginDrag()
    ListView.onScrollBeginDrag(self)

    self.beginMove = false
    self.centerIndex = -1
end

function StepListView:onScrollEndDrag()
    ListView.onScrollEndDrag(self)

    if self.topOffset >= 0 and self.bottomOffset >= 0 then
        local min = {
            dis = -1, 
            idx = -1,
            pos = nil
        }
        local center = self.viewHeight / 2
        for index, cell in pairs(self.mapCells) do
            local pos = self:_getCellCenterPos(index)
            pos.x = pos.x - self.topOffset
            if -1 == min.idx then
                min.idx = index
                min.dis = math.abs(pos.x - center)
                min.pos = pos
            else
                local dis = math.abs(pos.x - center)
                if dis < min.dis then
                    min.idx = index
                    min.dis = dis
                    min.pos = pos
                end
            end
        end
    
        self.beginMove = true
        self.centerIndex = min.idx
    end
end

return StepListView
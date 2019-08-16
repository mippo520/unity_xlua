local HScroll = class("HScroll", ListView)

function HScroll:ctor()
    ListView.ctor(self)

    self.arrItem = Vector.new()
    for i = 1, 10 do
        self.arrItem:push_back(i)
    end
end

function HScroll:_getCount()
    return self.arrItem:size()
end

function HScroll:_initCell(cellBehaviour)
    cellBehaviour.content.text = "cell idex is " .. self.arrItem:get(cellBehaviour.index)
    return cellBehaviour
end

function HScroll:onCellClicked(cellBehaviour)
    Info.Debug("cell index is " .. cellBehaviour.index)
end

function HScroll:onTopUpdate()
    self:onceTimer(1000, function ()
        self.arrItem:push_front(100)
        self.arrItem:push_front(101)
        self.arrItem:push_front(102)
        self.arrItem:push_front(103)
        self:setTopIndex(4)
        self:updateFinish()
    end)
end

function HScroll:onBottomUpdate()
    self:onceTimer(1000, function ()
        self.arrItem:push_back(200)
        self.arrItem:push_back(201)
        self.arrItem:push_back(202)
        self.arrItem:push_back(203)
        self:refresh()
        self:updateFinish()
    end)
end

return HScroll

local ListCell = class("ListCell", Behaviour)

function ListCell:ctor()
    Behaviour.ctor(self)
    self.index = 0
end

function ListCell:onPointerClick()
    if self.bClick then
        self.scrollLuaObj.luaBehaviour:onCellClicked(self)
    end
    return false
end

function ListCell:onDrag()
    return true
end

function ListCell:onBeginDrag()
    return true
end

function ListCell:onEndDrag()
    return true
end

return ListCell
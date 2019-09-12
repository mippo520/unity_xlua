local ListCell = class("ListCell", Behaviour)

local offsetDis = 15

function ListCell:ctor()
    Behaviour.ctor(self)
    self.index = 0
    self.onClick = SimpleEvent.new()
    self.dragDelta = Unity.Vector2(0, 0)
end

function ListCell:onPointerClick()
    if self.bClick and self.dragDelta.x < offsetDis and self.dragDelta.y < offsetDis then
        self.onClick:invoke(self)
    end
    return false
end

function ListCell:onDrag(eventData)
    self.dragDelta.x = self.dragDelta.x + math.abs( eventData.delta.x ) 
    self.dragDelta.y = self.dragDelta.y + math.abs( eventData.delta.y ) 
    return true
end

function ListCell:onBeginDrag()
    self.dragDelta = Unity.Vector2(0, 0)
    return true
end

function ListCell:onEndDrag()
    self.dragDelta = Unity.Vector2(0, 0)
    return true
end

return ListCell
local Vector = class("Vector")

function Vector:ctor()
    self.container = {}
end

function Vector:get(pos)
    return self.container[pos + 1]
end

function Vector:size()
    return #self.container
end

function Vector:push_back(v)
    table.insert(self.container, v)
end

function Vector:push_front(v)
    table.insert(self.container, 1, v)
end

function Vector:insert(pos, v)
    if pos >= 0 and pos < self:size() then
        table.insert(self.container, pos + 1, v)
    else
        Inof.Error("Vector insert error! pos is " .. pos)
    end
end

function Vector:pop_back()
    if self:size() > 0 then
        table.remove(self.container, #self.container)
    end
end

function Vector:pop_front()
    if self:size() > 0 then
        table.remove(self.container, 1)
    end
end

function Vector:remove(pos)
    if pos < self:size() and pos >= 0 then
        table.remove(self.container, pos + 1)
    else
        Inof.Error("Vector remove error! pos is " .. pos)
    end
end

return Vector
local Equip = class("Equip", Thing)

function Equip:ctor()
    Thing.ctor(self)
    self.star = 0       -- 星级?
end

return Equip
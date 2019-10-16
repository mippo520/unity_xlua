local Item = class("Item", Thing)

function Item:ctor()
    Thing.ctor(self)
    self.num = 0    -- 数量
    self.expire_ts = 0  -- 过期时间
end

return Item
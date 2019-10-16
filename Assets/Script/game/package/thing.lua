local Thing = class("Thing")

function Thing:ctor()
    self.uid = 0    -- 唯一id
    self.tid = 0    -- 物品id
    self.bind = false   -- 是否绑定
end

return Thing
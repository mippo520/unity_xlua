local BigPossession = class("BigPossession")

function BigPossession:ctor(val, extra, ts)
    self.ts = ts
    self.val = Currency.new(val, extra)
end

return BigPossession
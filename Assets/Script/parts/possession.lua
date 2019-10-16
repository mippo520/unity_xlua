local Possession = class("Possession")

function Possession:ctor(val, ts)
    self.ts = ts

    if "number" == type(val) then
        self.val = BindProperty.new(val)
    elseif "table" == type(val) and "BindProperty" == val.__cname then
        self.val = clone(val)
    else
        Info.Error("Possession:ctor Error! val type error!")
    end
end

return Possession
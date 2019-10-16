local BigNumber = class("BigNumber")

local StepLimit = 9999999999999999999

function BigNumber:ctor(num)
    self.number = {}
    if not num then
        table.insert(self.number, 0)
    elseif "number" == type(num) then
        table.insert(self.number, num)
    elseif num.__cname == BigNumber.__cname then
        self.number = num.number
    else
        Info.Error("BigNumber:ctor Error! num is " .. tostring(num))
    end
end

function BigNumber:add(num)
    if "number" == num then
    elseif num.__cname == BigNumber.__cname then
    end
end

return BigNumber
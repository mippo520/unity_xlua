local Currency = class("Currency", BindProperty)

local extra_limit = 3

local function _arrange(self)
    if self.value > 1 then
        while self.value > 1000 do
            self.value = self.value / 1000
            self.extra = self.extra + 1
        end
    elseif self.value > 0 then
        while self.value < 1 do
            self.value = self.value * 1000
            self.extra = self.extra - 1
        end
    end
end

function Currency:ctor(value, extra)
    BindProperty.ctor(self)
    self:set(value, extra)
end

function Currency:set(value, extra)
    self.value = value or 0
    self.extra = 0
    if "number" == type(extra) then
        self.extra = extra
    elseif "string" == type(extra) then
        local l = #extra
        for i = 1, l do
            self.extra = math.floor(self.extra + (string.byte( extra, i ) - 96) * (26 ^ (l - i)))
        end
    elseif not extra then
        self.extra = 0
    else
        Info.Error("Currency:ctor Error! extra type error, type is " .. type(extra) .. ", value is " .. tostring(extra))
    end
    _arrange(self)
end

function Currency:add(currency)
    local old = nil
    if self.extra - currency.extra > extra_limit then
        return
    elseif currency.extra - self.extra > extra_limit then
        old = clone(self)
        self.value = currency.value
        self.extra = currency.extra
    else
        old = clone(self)
        if self.extra >= currency.extra then
            local extraValue = 10 ^ ((self.extra - currency.extra) * 3)
            currency.value = currency.value / extraValue
        else
            local extraValue = 10 ^ ((currency.extra - self.extra) * 3)
            self.value = self.value / extraValue
            self.extra = currency.extra
        end

        self.value = self.value + currency.value
        _arrange(self)
    end

    self:fire(old, self)
end

function Currency:greater(currency)
    if self.extra ~= currency.extra then
        return self.extra > currency.extra
    else
        return self.value > currency.value
    end
end

function Currency:lesser(currency)
    if self.extra ~= currency.extra then
        return self.extra < currency.extra
    else
        return self.value < currency.value
    end
end

function Currency:equal(currency)
    return self.extra == currency.extra and Tools.IsNumberEqual(self.value, currency.value, extra_limit * 3)
end

function Currency:sub(currency)
    local old = nil
    if not self.greater(currency) then
        old = clone(self)
        self.value = 0
        self.extra = 0
    else
        if self.extra - currency.extra > extra_limit then
            return
        end

        old = clone(self)
        if self.extra > currency.extra then
            local extraValue = 10 ^ ((self.extra - currency.extra) * 3)
            currency.value = currency.value / extraValue
        end

        self.value = self.value - currency.value
        _arrange(self)
    end
    self:fire(old, self)
end

function Currency:mul(currency)
    local old = clone(self)
    self.value = self.value * currency.value
    self.extra = self.extra + currency.extra
    _arrange(self)
    self:fire(old, self)
end

function Currency:div(currency)
    local old = clone(self)
    self.value = self.value / currency.value
    self.extra = self.extra - currency.extra
    _arrange(self)
    self:fire(old, self)
end

function Currency:pow(num)
    while num > 10 do
        num = num / 10
        self.value = self.value ^ 10
        self.extra = self.extra * 10

        _arrange(self)
    end
    
    self.value = self.value ^ num
    local extra = self.extra * num
    self.extra = math.floor(extra)
    extra = extra - self.extra
    self.value = self.value * (1000 ^ extra)
    _arrange(self)

end

function Currency:toString()
    local strExtra = ""
    local extra = self.extra
    local sign = ""
    if extra < 0 then
        sign = "-"
        extra = -extra
    end
    while extra > 0 do
        strExtra = string.char( 97 + (extra - 1) % 26 ) .. strExtra
        extra = math.floor(extra / 26)
    end
    strExtra = sign .. strExtra
    local strValue = string.format("%.2f", self.value)
    local l = #strValue
    while l > 0 do
        local s = string.sub(strValue, l, l)
        if "0" == s then
            strValue = string.sub(strValue, 1, l - 1)
        elseif "." == s then
            strValue = string.sub(strValue, 1, l - 1)
            break
        else
            break
        end
        l = #strValue
    end
    local strRes = strValue .. strExtra

    return strRes, strValue, strExtra
end

return Currency
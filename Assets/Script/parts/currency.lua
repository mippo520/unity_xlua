local Currency = class("Currency", BindProperty)
local extra_limit = 3

local function _arrange(self)
    if self.value > 1 then
        while self.value > 1000 or Tools.IsNumberEqual(self.value, 1000) do
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

local function _formatter(data)
	local temp = data
	local d_type = type(data)
	if d_type == "number" then
		temp = Currency.new(data,0)
	elseif d_type == "table" then
		temp = Currency.new(data.value,data.extra)
	else
		Info.Error(string.format("Currency.__pow local index b a %s value",d_type))
	end
	return temp
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
		self.extra = CfgCharInst:getNum(extra)
    elseif not extra then
        self.extra = 0
    else
        Info.Error("Currency:ctor Error! extra type error, type is " .. type(extra) .. ", value is " .. tostring(extra))
    end
    _arrange(self)
	self:fire(old, self)
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
    if not self:greater(currency) then
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
	if Tools.IsNumberEqual(self.value,0,extra_limit * 3) then
		self.extra = 0
	end
    _arrange(self)
    self:fire(old, self)
end

function Currency:div(currency)
    local old = clone(self)
    self.value = self.value / currency.value
    self.extra = self.extra - currency.extra
	if Tools.IsNumberEqual(self.value,0,extra_limit * 3) then
		self.extra = 0	
	end
    _arrange(self)
    self:fire(old, self)
end

function Currency:pow(num)
	local old = clone(self)
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
	self:fire(old, self)
end

function Currency:toString()
    local strExtra = ""
    local extra = self.extra
    local sign = ""
    if extra < 0 then
        sign = "-"
        extra = -extra
    end
    strExtra = sign .. CfgCharInst:getChar(extra)
    local strValue = string.format("%.2f", self.value)
	local l = #strValue
	local value = math.floor(self.value)
	if value > 99 then
		strValue = string.sub(strValue, 1, l - 3)
	elseif value > 9 then
		strValue = string.sub(strValue, 1, l - 1)
	end

    local strRes = strValue .. strExtra

    return strRes, strValue, strExtra
end

function Currency:appr_greater(currency)
	if self:equal(currency) then
		return false
	end
	return self:greater(currency)
end

function Currency:appr_lesser(currency)
	if self:equal(currency) then
		return false
	end
	return self:lesser(currency)
end

--元表运算符重载
Currency.__add = function(a, b)
	a = _formatter(a)
	b = _formatter(b)
	a:add(b)
	return Currency.new(a.value,a.extra)
end

Currency.__sub = function(a, b)
	a = _formatter(a)
	b = _formatter(b)
	a:sub(b)
	return Currency.new(a.value,a.extra)
end

Currency.__mul = function(a, b)
	a = _formatter(a)
	b = _formatter(b)
	a:mul(b)
	return Currency.new(a.value,a.extra)
end

Currency.__div = function(a, b)
	a = _formatter(a)
	b = _formatter(b)
	a:div(b)
	return Currency.new(a.value,a.extra)
end

Currency.__pow = function(a, b)
	a = _formatter(a)
	b = _formatter(b)
	a:pow(b.value)
	return Currency.new(a.value,a.extra)
end

Currency.__eq = function(a, b)
	a = _formatter(a)
	b = _formatter(b)
	return a:equal(b)
end

Currency.__lt = function(a, b)
	a = _formatter(a)
	b = _formatter(b)
	return a:appr_lesser(b)
end

Currency.__le = function(a, b)
	a = _formatter(a)
	b = _formatter(b)
	return a:appr_greater(b)
end

Currency.__tostring = function(a)
	return a:toString()
end

return Currency
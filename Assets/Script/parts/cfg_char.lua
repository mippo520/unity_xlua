local CfgChar = class("CfgChar", CfgLoader)

function CfgChar:ctor()
	CfgLoader.ctor(self)
	self.path = "Assets/Config/Design/cfg_char.json"
end

function CfgChar:init()
	CfgLoader.init(self)
	self.arrData = {}
	self.mapNum = {}
	for i, v in ipairs(self.content) do
		self.arrData[i] = v.char
		self.mapNum[v.char] = i
	end
end

function CfgChar:getChar(num)
	if 0 == num then
		return ""
	end
	return self.arrData[num]
end

function CfgChar:getNum(char)
	local num = self.mapNum[char]
	if not num then
		return 0
	else
		return num
	end
end

if not _CfgCharInst then
	_CfgCharInst = CfgChar.new()
end

return _CfgCharInst
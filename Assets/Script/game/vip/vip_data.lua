local VipData = class("VipData")

function VipData:ctor()
    self.lev = BindProperty.new(0)
    self.exp = 0
end

if not _VipDataInst then
    _VipDataInst = VipData.new()
end

return _VipDataInst
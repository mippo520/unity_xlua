local AccountData = class("AccountData")

local sInstance = nil

function AccountData.GetInstance()
    if nil == sInstance then
        sInstance = AccountData.new()
    end
    return sInstance
end

function AccountData:ctor()
    self.username = BindProperty.new(StorageInst:get("username"))
    if nil == self.username:get() then
        self.username:set("")
    end
    self.password = BindProperty.new(StorageInst:get("password"))
    if nil == self.password:get() then
        self.password:set("")
    end
end

return AccountData
local AccountData = class("AccountData")

function AccountData:ctor()
    self.loginType = LoginType.Quick
    self.account_id = 0
    self.token = ""
    self.expireTime = 0

    self.username = BindProperty.new(StorageInst:get("username"))
    if nil == self.username:get() then
        self.username:set("")
    end
    self.password = BindProperty.new(StorageInst:get("password"))
    if nil == self.password:get() then
        self.password:set("")
    end

    self.username:bind(self, function (_, old, new)
        StorageInst:set(StorageKey.username, new.value)
    end)
    self.password:bind(self, function (_, old, new)
        StorageInst:set(StorageKey.password, new.value)
    end)

end

if not _AccountDataInst then
    _AccountDataInst = AccountData.new()
end
return _AccountDataInst

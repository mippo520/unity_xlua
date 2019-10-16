local SettingData = class("SettingData")

function SettingData:ctor()
end


if not _SettingDataInst then
    _SettingDataInst = SettingData.new()
end

return _SettingDataInst

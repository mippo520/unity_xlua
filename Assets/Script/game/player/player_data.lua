local PlayerData = class("PlayerData")

function PlayerData:ctor()
    self.player_id = BindProperty.new(0)
    self.name = BindProperty.new("")
    self.head = BindProperty.new(0)
    self.create_ts = 0
end

if not _PlayerDataInst then
    _PlayerDataInst = PlayerData.new()
end
return _PlayerDataInst

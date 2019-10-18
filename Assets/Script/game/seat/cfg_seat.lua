local CfgSeat = class("CfgSeat", CfgLoader)

function CfgSeat:ctor()
    CfgLoader.ctor(self)
    self.path = "Assets/Config/Design/cfg_seat.json"
end

function CfgSeat:init()
    CfgLoader.init(self)
    self.mapSeat = {}
    for _, v in ipairs(self.content) do
        self.mapSeat[v.seat_id] = v
    end
end

function CfgSeat:getData(id)
    return self.mapSeat[id]
end

if not _CfgSeatInst then
    _CfgSeatInst = CfgSeat.new()
end

return _CfgSeatInst
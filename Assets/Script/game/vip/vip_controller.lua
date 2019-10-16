local VipController = class("VipController")

------- private begin ----------
local function _s2c_vip_data(_, msg)
    VipDataInst.lev:set(msg.vip_lev)
    VipDataInst.exp = msg.vip_exp
    EventManagerInst:fireEvent(Event.VipUpdate)
end
------- private end ----------

function VipController:init()
    NetManagerInst:registMessage(c_gs.S2C_VipData, self, _s2c_vip_data)
end

if not _VipControllerInst then
    _VipControllerInst = VipController.new()
end

return _VipControllerInst
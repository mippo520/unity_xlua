local PlayerController = class("PlayerController")

------- private begin ----------
local function _s2c_player_data(_, msg)
    PlayerDataInst.player_id:set(msg.player_id)
    PlayerDataInst.name:set(msg.name)
    PlayerDataInst.head:set(msg.head)
    PlayerDataInst.create_ts = msg.create_ts

    EventManagerInst:fireEvent(Event.PlayerDataUpdate)
end

local function _s2c_sync_player_lev_exp(_, msg)
    PlayerDataInst.lev:set(msg.lev)
    PlayerDataInst.exp:set(msg.exp)
    EventManagerInst:fireEvent(Event.PlayerLevUpdate)
end

local function _s2c_property_list(_, msg)
    for _, prop in ipairs(msg.props) do
        PossessionManagerInst:set(prop.id, prop.val, prop.last_update_ts)
    end
    EventManagerInst:fireEvent(Event.PossessionUpdate)
end

local function _s2c_big_property_list(_, msg)
    for _, prop in ipairs(msg.props) do
        PossessionManagerInst:setBigNumber(prop.id, prop.val.val, prop.val.tail, prop.last_update_ts)
    end
    EventManagerInst:fireEvent(Event.BigPossessionUpdate)
end

local function _s2c_login_finish()
    Info.Debug("Login finish!!")
end
------- private end ----------


function PlayerController:init()
    NetManagerInst:registMessage(c_gs.S2C_PlayerData, self, _s2c_player_data)
    NetManagerInst:registMessage(c_gs.S2C_PropertyList, self, _s2c_property_list)
    NetManagerInst:registMessage(c_gs.S2C_BigPropertyList, self, _s2c_big_property_list)
    NetManagerInst:registMessage(c_gs.S2C_LoginFinish, self, _s2c_login_finish)
end

if not _PlayerControllerInst then
    _PlayerControllerInst = PlayerController.new()
end
return _PlayerControllerInst

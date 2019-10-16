local PossessionManager = class("PossessionManager")

function PossessionManager:ctor()
    self.mapData = {}
end

function PossessionManager:set(id, val, ts)
    self.mapData[id] = Possession.new(val, ts)
end

function PossessionManager:setBigNumber(id, val, extra, ts)
    self.mapData[id] = BigPossession.new(val, extra, ts)
end

function PossessionManager:get(id)
    if not self.mapData[id] then
        Info.Error("PossessionManager:get Error! id not exist! id is " .. tostring(id))
        return nil
    else            
        return self.mapData[id]
    end
end

if not _PossessionManagerInst then
    _PossessionManagerInst = PossessionManager.new()
end
return _PossessionManagerInst

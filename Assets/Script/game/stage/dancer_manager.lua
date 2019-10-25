local Dancer = require("game.stage.dancer")
local DancerManager = class("DancerManager")

function DancerManager:ctor()
    self.arrDancer = {}
end

function DancerManager:add(id, pos)
    if not pos then
        pos = #self.arrDancer + 1
    end

    local dancer = self.arrDancer[pos]
    if dancer then
        dancer:release()
    end
    dancer = Dancer.new(id)
    dancer:setPosition(StageDefine.position[pos])
    self.arrDancer[pos] = dancer
end

function DancerManager:remove(pos)
    local dancer = self.arrDancer[pos]
    if dancer then
        dancer:release()
    end
    self.arrDancer[pos] = nil
end

function DancerManager:get(pos)
    return self.arrDancer[pos]
end

function DancerManager:release()
    for _, v in pairs(self.mapDancer) do
        v:release()
    end
    self.mapDancer = {}
end

if not _DancerManagerInst then
    _DancerManagerInst = DancerManager.new()
end

return _DancerManagerInst
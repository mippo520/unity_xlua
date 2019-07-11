
BehaviourManager = {}
BehaviourManager.arrBehaviour = {}

function BehaviourManager.create(id, name)
    local behaviourClass = require(name)
    local obj = behaviourClass.new()
    obj.id = id
    BehaviourManager.arrBehaviour[id] = obj
    return obj
end

function BehaviourManager.remove(id)
    if BehaviourManager.arrBehaviour[id] then
        BehaviourManager.arrBehaviour[id] = nil
    end
end

function BehaviourManager.getBehaviour(id)
    return BehaviourManager.arrBehaviour[id]
end

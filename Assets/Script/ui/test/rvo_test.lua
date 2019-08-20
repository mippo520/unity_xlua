local RvoTest = class("RvoTest", DialogBehaviour)

function RvoTest:ctor()
    DialogBehaviour.ctor(self)
    self.vecRole = Vector.new()
    self.vecEnd = Vector.new()
    self.radius = 800

    self.vecRole2 = Vector.new()
    self.vecEnd2 = Vector.new()
    self.radius2 = 400
end

function RvoTest:_awake()
    self.vecRole:push_back(self.role)
    for i = 1, 100 do
        local role = Unity.Object.Instantiate(self.role, self.role.transform.parent)
        self.vecRole:push_back(role)
    end

    local stepR = 2 * math.pi / self.vecRole:size()
    for i = 0, self.vecRole:size() - 1 do
        local rt = self.vecRole:get(i):GetComponent(typeof(Unity.RectTransform))
        rt.anchoredPosition = Unity.Vector2(self.radius * math.cos( stepR * i ), self.radius * math.sin( stepR * i ))
        self.vecEnd:push_back(CSRvo.Vector2(-rt.anchoredPosition.x, -rt.anchoredPosition.y))
    end

    for i = 1, 40 do
        local role = Unity.Object.Instantiate(self.role, self.role.transform.parent)
        self.vecRole2:push_back(role)
    end

    local stepR2 = 2 * math.pi / self.vecRole2:size()
    for i = 0, self.vecRole2:size() - 1 do
        local rt = self.vecRole2:get(i):GetComponent(typeof(Unity.RectTransform))
        rt.anchoredPosition = Unity.Vector2(self.radius2 * math.cos( stepR2 * i ), self.radius2 * math.sin( stepR2 * i ))
        self.vecEnd2:push_back(CSRvo.Vector2(-rt.anchoredPosition.x, -rt.anchoredPosition.y))
    end

end

function RvoTest:_start()
    CSRvoInst:setTimeStep(0.017)
    CSRvoInst:setAgentDefaults(40.0, 6, 100.0, 10.0, 20, 100.0, CSRvo.Vector2(0.0, 0.0));
    for i = 0, self.vecRole:size() - 1 do
        local rt = self.vecRole:get(i):GetComponent(typeof(Unity.RectTransform))
        CSRvoInst:addAgent(CSRvo.Vector2(rt.anchoredPosition.x, rt.anchoredPosition.y))
    end

    for i = 0, self.vecRole2:size() - 1 do
        local rt = self.vecRole2:get(i):GetComponent(typeof(Unity.RectTransform))
        CSRvoInst:addAgent(CSRvo.Vector2(rt.anchoredPosition.x, rt.anchoredPosition.y))
    end
end

function RvoTest:_update()
    for i = 0, self.vecRole:size() - 1 do
        if CSRvoInst:getAgentMaxNeighbors(i) > 0 then
            local v = self.vecEnd:get(i) - CSRvoInst:getAgentPosition(i)
            if CSRvo.RVOMath.absSq(v) > 1 then
                v = CSRvo.RVOMath.normalize(v)
            end
            CSRvoInst:setAgentPrefVelocity(i, v * 50)
        end
    end

    for i = 0, self.vecRole2:size() - 1 do
        local id = self.vecRole:size() + i
        if CSRvoInst:getAgentMaxNeighbors(id) > 0 then
            local v = self.vecEnd2:get(i) - CSRvoInst:getAgentPosition(id)
            if CSRvo.RVOMath.absSq(v) > 1 then
                v = CSRvo.RVOMath.normalize(v)
            end
            CSRvoInst:setAgentPrefVelocity(id, v * 50)
        end
    end

    CSRvoInst:doStep()

    for i = 0, self.vecRole:size() - 1 do
        local rvoPos = CSRvoInst:getAgentPosition(i)
        local rt = self.vecRole:get(i):GetComponent(typeof(Unity.RectTransform))
        rt.anchoredPosition = Unity.Vector2(rvoPos:x(), rvoPos:y())
        -- if CSRvoInst:getAgentMaxNeighbors(i) > 0 and CSRvoInst:getAgentNumAgentNeighbors(i) > 0 then
        --     local neiNum = CSRvoInst:getAgentAgentNeighbor(i, 0)
        --     if 0 == neiNum % 2 then
        --         CSRvoInst:setAgentMaxNeighbors(neiNum, 0)
        --         CSRvoInst:setAgentMaxSpeed(neiNum, 0)
        --         CSRvoInst:setAgentNeighborDist(neiNum, 0)
        --         CSRvoInst:setAgentPrefVelocity(neiNum, CSRvo.Vector2(0, 0))
        --         CSRvoInst:setAgentRadius(neiNum, 0)
        --         CSRvoInst:setAgentPosition(neiNum, CSRvo.Vector2(1000, 1000))
        --     end
        -- end
    end

    for i = 0, self.vecRole2:size() - 1 do
        local id = self.vecRole:size() + i
        local rvoPos = CSRvoInst:getAgentPosition(id)
        local rt = self.vecRole2:get(i):GetComponent(typeof(Unity.RectTransform))
        rt.anchoredPosition = Unity.Vector2(rvoPos:x(), rvoPos:y())
    end

end

return RvoTest
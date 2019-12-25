---@class CS.RVO.Simulator : CS.System.Object
CS.RVO.Simulator = {}

---@property readonly CS.RVO.Simulator.Instance : CS.RVO.Simulator
CS.RVO.Simulator.Instance = nil

---@param position : CS.RVO.Vector2
---@return CS.System.Int32
function CS.RVO.Simulator:addAgent(position)
end

---@param position : CS.RVO.Vector2
---@param neighborDist : CS.System.Single
---@param maxNeighbors : CS.System.Int32
---@param timeHorizon : CS.System.Single
---@param timeHorizonObst : CS.System.Single
---@param radius : CS.System.Single
---@param maxSpeed : CS.System.Single
---@param velocity : CS.RVO.Vector2
---@return CS.System.Int32
function CS.RVO.Simulator:addAgent(position, neighborDist, maxNeighbors, timeHorizon, timeHorizonObst, radius, maxSpeed, velocity)
end

---@param vertices : CS.System.Collections.Generic.IList
---@return CS.System.Int32
function CS.RVO.Simulator:addObstacle(vertices)
end

function CS.RVO.Simulator:Clear()
end

---@return CS.System.Single
function CS.RVO.Simulator:doStep()
end

---@param agentNo : CS.System.Int32
---@param neighborNo : CS.System.Int32
---@return CS.System.Int32
function CS.RVO.Simulator:getAgentAgentNeighbor(agentNo, neighborNo)
end

---@param agentNo : CS.System.Int32
---@return CS.System.Int32
function CS.RVO.Simulator:getAgentMaxNeighbors(agentNo)
end

---@param agentNo : CS.System.Int32
---@return CS.System.Single
function CS.RVO.Simulator:getAgentMaxSpeed(agentNo)
end

---@param agentNo : CS.System.Int32
---@return CS.System.Single
function CS.RVO.Simulator:getAgentNeighborDist(agentNo)
end

---@param agentNo : CS.System.Int32
---@return CS.System.Int32
function CS.RVO.Simulator:getAgentNumAgentNeighbors(agentNo)
end

---@param agentNo : CS.System.Int32
---@return CS.System.Int32
function CS.RVO.Simulator:getAgentNumObstacleNeighbors(agentNo)
end

---@param agentNo : CS.System.Int32
---@param neighborNo : CS.System.Int32
---@return CS.System.Int32
function CS.RVO.Simulator:getAgentObstacleNeighbor(agentNo, neighborNo)
end

---@param agentNo : CS.System.Int32
---@return CS.System.Collections.Generic.IList
function CS.RVO.Simulator:getAgentOrcaLines(agentNo)
end

---@param agentNo : CS.System.Int32
---@return CS.RVO.Vector2
function CS.RVO.Simulator:getAgentPosition(agentNo)
end

---@param agentNo : CS.System.Int32
---@return CS.RVO.Vector2
function CS.RVO.Simulator:getAgentPrefVelocity(agentNo)
end

---@param agentNo : CS.System.Int32
---@return CS.System.Single
function CS.RVO.Simulator:getAgentRadius(agentNo)
end

---@param agentNo : CS.System.Int32
---@return CS.System.Single
function CS.RVO.Simulator:getAgentTimeHorizon(agentNo)
end

---@param agentNo : CS.System.Int32
---@return CS.System.Single
function CS.RVO.Simulator:getAgentTimeHorizonObst(agentNo)
end

---@param agentNo : CS.System.Int32
---@return CS.RVO.Vector2
function CS.RVO.Simulator:getAgentVelocity(agentNo)
end

---@return CS.System.Single
function CS.RVO.Simulator:getGlobalTime()
end

---@return CS.System.Int32
function CS.RVO.Simulator:getNumAgents()
end

---@return CS.System.Int32
function CS.RVO.Simulator:getNumObstacleVertices()
end

---@return CS.System.Int32
function CS.RVO.Simulator:GetNumWorkers()
end

---@param vertexNo : CS.System.Int32
---@return CS.RVO.Vector2
function CS.RVO.Simulator:getObstacleVertex(vertexNo)
end

---@param vertexNo : CS.System.Int32
---@return CS.System.Int32
function CS.RVO.Simulator:getNextObstacleVertexNo(vertexNo)
end

---@param vertexNo : CS.System.Int32
---@return CS.System.Int32
function CS.RVO.Simulator:getPrevObstacleVertexNo(vertexNo)
end

---@return CS.System.Single
function CS.RVO.Simulator:getTimeStep()
end

function CS.RVO.Simulator:processObstacles()
end

---@param point1 : CS.RVO.Vector2
---@param point2 : CS.RVO.Vector2
---@param radius : CS.System.Single
---@return CS.System.Boolean
function CS.RVO.Simulator:queryVisibility(point1, point2, radius)
end

---@param neighborDist : CS.System.Single
---@param maxNeighbors : CS.System.Int32
---@param timeHorizon : CS.System.Single
---@param timeHorizonObst : CS.System.Single
---@param radius : CS.System.Single
---@param maxSpeed : CS.System.Single
---@param velocity : CS.RVO.Vector2
function CS.RVO.Simulator:setAgentDefaults(neighborDist, maxNeighbors, timeHorizon, timeHorizonObst, radius, maxSpeed, velocity)
end

---@param agentNo : CS.System.Int32
---@param maxNeighbors : CS.System.Int32
function CS.RVO.Simulator:setAgentMaxNeighbors(agentNo, maxNeighbors)
end

---@param agentNo : CS.System.Int32
---@param maxSpeed : CS.System.Single
function CS.RVO.Simulator:setAgentMaxSpeed(agentNo, maxSpeed)
end

---@param agentNo : CS.System.Int32
---@param neighborDist : CS.System.Single
function CS.RVO.Simulator:setAgentNeighborDist(agentNo, neighborDist)
end

---@param agentNo : CS.System.Int32
---@param position : CS.RVO.Vector2
function CS.RVO.Simulator:setAgentPosition(agentNo, position)
end

---@param agentNo : CS.System.Int32
---@param prefVelocity : CS.RVO.Vector2
function CS.RVO.Simulator:setAgentPrefVelocity(agentNo, prefVelocity)
end

---@param agentNo : CS.System.Int32
---@param radius : CS.System.Single
function CS.RVO.Simulator:setAgentRadius(agentNo, radius)
end

---@param agentNo : CS.System.Int32
---@param timeHorizon : CS.System.Single
function CS.RVO.Simulator:setAgentTimeHorizon(agentNo, timeHorizon)
end

---@param agentNo : CS.System.Int32
---@param timeHorizonObst : CS.System.Single
function CS.RVO.Simulator:setAgentTimeHorizonObst(agentNo, timeHorizonObst)
end

---@param agentNo : CS.System.Int32
---@param velocity : CS.RVO.Vector2
function CS.RVO.Simulator:setAgentVelocity(agentNo, velocity)
end

---@param globalTime : CS.System.Single
function CS.RVO.Simulator:setGlobalTime(globalTime)
end

---@param numWorkers : CS.System.Int32
function CS.RVO.Simulator:SetNumWorkers(numWorkers)
end

---@param timeStep : CS.System.Single
function CS.RVO.Simulator:setTimeStep(timeStep)
end
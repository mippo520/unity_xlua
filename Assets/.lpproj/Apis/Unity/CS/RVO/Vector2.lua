---@class CS.RVO.Vector2 : CS.System.ValueType
CS.RVO.Vector2 = {}

---@field public CS.RVO.Vector2.x_ : CS.System.Single
CS.RVO.Vector2.x_ = nil

---@field public CS.RVO.Vector2.y_ : CS.System.Single
CS.RVO.Vector2.y_ = nil

---@param x : CS.System.Single
---@param y : CS.System.Single
---@return CS.RVO.Vector2
function CS.RVO.Vector2(x, y)
end

---@return CS.System.String
function CS.RVO.Vector2:ToString()
end

---@return CS.System.Single
function CS.RVO.Vector2:x()
end

---@return CS.System.Single
function CS.RVO.Vector2:y()
end

---@param vector1 : CS.RVO.Vector2
---@param vector2 : CS.RVO.Vector2
---@return CS.System.Single
function CS.RVO.Vector2.op_Multiply(vector1, vector2)
end

---@param scalar : CS.System.Single
---@param vector : CS.RVO.Vector2
---@return CS.RVO.Vector2
function CS.RVO.Vector2.op_Multiply(scalar, vector)
end

---@param vector : CS.RVO.Vector2
---@param scalar : CS.System.Single
---@return CS.RVO.Vector2
function CS.RVO.Vector2.op_Multiply(vector, scalar)
end

---@param vector : CS.RVO.Vector2
---@param scalar : CS.System.Single
---@return CS.RVO.Vector2
function CS.RVO.Vector2.op_Division(vector, scalar)
end

---@param vector1 : CS.RVO.Vector2
---@param vector2 : CS.RVO.Vector2
---@return CS.RVO.Vector2
function CS.RVO.Vector2.op_Addition(vector1, vector2)
end

---@param vector1 : CS.RVO.Vector2
---@param vector2 : CS.RVO.Vector2
---@return CS.RVO.Vector2
function CS.RVO.Vector2.op_Subtraction(vector1, vector2)
end

---@param vector : CS.RVO.Vector2
---@return CS.RVO.Vector2
function CS.RVO.Vector2.op_UnaryNegation(vector)
end
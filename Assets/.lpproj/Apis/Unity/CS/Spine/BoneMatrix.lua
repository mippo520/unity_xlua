---@class CS.Spine.BoneMatrix : CS.System.ValueType
CS.Spine.BoneMatrix = {}

---@field public CS.Spine.BoneMatrix.a : CS.System.Single
CS.Spine.BoneMatrix.a = nil

---@field public CS.Spine.BoneMatrix.b : CS.System.Single
CS.Spine.BoneMatrix.b = nil

---@field public CS.Spine.BoneMatrix.c : CS.System.Single
CS.Spine.BoneMatrix.c = nil

---@field public CS.Spine.BoneMatrix.d : CS.System.Single
CS.Spine.BoneMatrix.d = nil

---@field public CS.Spine.BoneMatrix.x : CS.System.Single
CS.Spine.BoneMatrix.x = nil

---@field public CS.Spine.BoneMatrix.y : CS.System.Single
CS.Spine.BoneMatrix.y = nil

---@param boneData : CS.Spine.BoneData
---@return CS.Spine.BoneMatrix
function CS.Spine.BoneMatrix(boneData)
end

---@param bone : CS.Spine.Bone
---@return CS.Spine.BoneMatrix
function CS.Spine.BoneMatrix(bone)
end

---@param boneData : CS.Spine.BoneData
---@return CS.Spine.BoneMatrix
function CS.Spine.BoneMatrix.CalculateSetupWorld(boneData)
end

---@param local_ : CS.Spine.BoneMatrix
---@return CS.Spine.BoneMatrix
function CS.Spine.BoneMatrix:TransformMatrix(local_)
end
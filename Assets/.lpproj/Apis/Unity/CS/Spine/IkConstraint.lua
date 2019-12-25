---@class CS.Spine.IkConstraint : CS.System.Object
CS.Spine.IkConstraint = {}

---@property readonly CS.Spine.IkConstraint.Order : CS.System.Int32
CS.Spine.IkConstraint.Order = nil

---@property readonly CS.Spine.IkConstraint.Bones : CS.Spine.ExposedList
CS.Spine.IkConstraint.Bones = nil

---@property readwrite CS.Spine.IkConstraint.Target : CS.Spine.Bone
CS.Spine.IkConstraint.Target = nil

---@property readwrite CS.Spine.IkConstraint.Mix : CS.System.Single
CS.Spine.IkConstraint.Mix = nil

---@property readwrite CS.Spine.IkConstraint.BendDirection : CS.System.Int32
CS.Spine.IkConstraint.BendDirection = nil

---@property readwrite CS.Spine.IkConstraint.Compress : CS.System.Boolean
CS.Spine.IkConstraint.Compress = nil

---@property readwrite CS.Spine.IkConstraint.Stretch : CS.System.Boolean
CS.Spine.IkConstraint.Stretch = nil

---@property readonly CS.Spine.IkConstraint.Data : CS.Spine.IkConstraintData
CS.Spine.IkConstraint.Data = nil

---@param data : CS.Spine.IkConstraintData
---@param skeleton : CS.Spine.Skeleton
---@return CS.Spine.IkConstraint
function CS.Spine.IkConstraint(data, skeleton)
end

---@param constraint : CS.Spine.IkConstraint
---@param skeleton : CS.Spine.Skeleton
---@return CS.Spine.IkConstraint
function CS.Spine.IkConstraint(constraint, skeleton)
end

function CS.Spine.IkConstraint:Apply()
end

function CS.Spine.IkConstraint:Update()
end

---@return CS.System.String
function CS.Spine.IkConstraint:ToString()
end

---@param bone : CS.Spine.Bone
---@param targetX : CS.System.Single
---@param targetY : CS.System.Single
---@param compress : CS.System.Boolean
---@param stretch : CS.System.Boolean
---@param uniform : CS.System.Boolean
---@param alpha : CS.System.Single
function CS.Spine.IkConstraint.Apply(bone, targetX, targetY, compress, stretch, uniform, alpha)
end

---@param parent : CS.Spine.Bone
---@param child : CS.Spine.Bone
---@param targetX : CS.System.Single
---@param targetY : CS.System.Single
---@param bendDir : CS.System.Int32
---@param stretch : CS.System.Boolean
---@param alpha : CS.System.Single
function CS.Spine.IkConstraint.Apply(parent, child, targetX, targetY, bendDir, stretch, alpha)
end
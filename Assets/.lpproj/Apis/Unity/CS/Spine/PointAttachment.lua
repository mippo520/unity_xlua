---@class CS.Spine.PointAttachment : CS.Spine.Attachment
CS.Spine.PointAttachment = {}

---@property readwrite CS.Spine.PointAttachment.X : CS.System.Single
CS.Spine.PointAttachment.X = nil

---@property readwrite CS.Spine.PointAttachment.Y : CS.System.Single
CS.Spine.PointAttachment.Y = nil

---@property readwrite CS.Spine.PointAttachment.Rotation : CS.System.Single
CS.Spine.PointAttachment.Rotation = nil

---@param name : CS.System.String
---@return CS.Spine.PointAttachment
function CS.Spine.PointAttachment(name)
end

---@param bone : CS.Spine.Bone
---@param ox : CS.System.Single
---@param oy : CS.System.Single
function CS.Spine.PointAttachment:ComputeWorldPosition(bone, ox, oy)
end

---@param bone : CS.Spine.Bone
---@return CS.System.Single
function CS.Spine.PointAttachment:ComputeWorldRotation(bone)
end
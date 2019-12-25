---@class CS.Spine.Skeleton : CS.System.Object
CS.Spine.Skeleton = {}

---@property readonly CS.Spine.Skeleton.Data : CS.Spine.SkeletonData
CS.Spine.Skeleton.Data = nil

---@property readonly CS.Spine.Skeleton.Bones : CS.Spine.ExposedList
CS.Spine.Skeleton.Bones = nil

---@property readonly CS.Spine.Skeleton.UpdateCacheList : CS.Spine.ExposedList
CS.Spine.Skeleton.UpdateCacheList = nil

---@property readonly CS.Spine.Skeleton.Slots : CS.Spine.ExposedList
CS.Spine.Skeleton.Slots = nil

---@property readonly CS.Spine.Skeleton.DrawOrder : CS.Spine.ExposedList
CS.Spine.Skeleton.DrawOrder = nil

---@property readonly CS.Spine.Skeleton.IkConstraints : CS.Spine.ExposedList
CS.Spine.Skeleton.IkConstraints = nil

---@property readonly CS.Spine.Skeleton.PathConstraints : CS.Spine.ExposedList
CS.Spine.Skeleton.PathConstraints = nil

---@property readonly CS.Spine.Skeleton.TransformConstraints : CS.Spine.ExposedList
CS.Spine.Skeleton.TransformConstraints = nil

---@property readwrite CS.Spine.Skeleton.Skin : CS.Spine.Skin
CS.Spine.Skeleton.Skin = nil

---@property readwrite CS.Spine.Skeleton.R : CS.System.Single
CS.Spine.Skeleton.R = nil

---@property readwrite CS.Spine.Skeleton.G : CS.System.Single
CS.Spine.Skeleton.G = nil

---@property readwrite CS.Spine.Skeleton.B : CS.System.Single
CS.Spine.Skeleton.B = nil

---@property readwrite CS.Spine.Skeleton.A : CS.System.Single
CS.Spine.Skeleton.A = nil

---@property readwrite CS.Spine.Skeleton.Time : CS.System.Single
CS.Spine.Skeleton.Time = nil

---@property readwrite CS.Spine.Skeleton.X : CS.System.Single
CS.Spine.Skeleton.X = nil

---@property readwrite CS.Spine.Skeleton.Y : CS.System.Single
CS.Spine.Skeleton.Y = nil

---@property readwrite CS.Spine.Skeleton.ScaleX : CS.System.Single
CS.Spine.Skeleton.ScaleX = nil

---@property readwrite CS.Spine.Skeleton.ScaleY : CS.System.Single
CS.Spine.Skeleton.ScaleY = nil

---@property readwrite CS.Spine.Skeleton.FlipX : CS.System.Boolean
CS.Spine.Skeleton.FlipX = nil

---@property readwrite CS.Spine.Skeleton.FlipY : CS.System.Boolean
CS.Spine.Skeleton.FlipY = nil

---@property readonly CS.Spine.Skeleton.RootBone : CS.Spine.Bone
CS.Spine.Skeleton.RootBone = nil

---@param data : CS.Spine.SkeletonData
---@return CS.Spine.Skeleton
function CS.Spine.Skeleton(data)
end

function CS.Spine.Skeleton:UpdateCache()
end

function CS.Spine.Skeleton:UpdateWorldTransform()
end

---@param parent : CS.Spine.Bone
function CS.Spine.Skeleton:UpdateWorldTransform(parent)
end

function CS.Spine.Skeleton:SetToSetupPose()
end

function CS.Spine.Skeleton:SetBonesToSetupPose()
end

function CS.Spine.Skeleton:SetSlotsToSetupPose()
end

---@param boneName : CS.System.String
---@return CS.Spine.Bone
function CS.Spine.Skeleton:FindBone(boneName)
end

---@param boneName : CS.System.String
---@return CS.System.Int32
function CS.Spine.Skeleton:FindBoneIndex(boneName)
end

---@param slotName : CS.System.String
---@return CS.Spine.Slot
function CS.Spine.Skeleton:FindSlot(slotName)
end

---@param slotName : CS.System.String
---@return CS.System.Int32
function CS.Spine.Skeleton:FindSlotIndex(slotName)
end

---@param skinName : CS.System.String
function CS.Spine.Skeleton:SetSkin(skinName)
end

---@param newSkin : CS.Spine.Skin
function CS.Spine.Skeleton:SetSkin(newSkin)
end

---@param slotName : CS.System.String
---@param attachmentName : CS.System.String
---@return CS.Spine.Attachment
function CS.Spine.Skeleton:GetAttachment(slotName, attachmentName)
end

---@param slotIndex : CS.System.Int32
---@param attachmentName : CS.System.String
---@return CS.Spine.Attachment
function CS.Spine.Skeleton:GetAttachment(slotIndex, attachmentName)
end

---@param slotName : CS.System.String
---@param attachmentName : CS.System.String
function CS.Spine.Skeleton:SetAttachment(slotName, attachmentName)
end

---@param constraintName : CS.System.String
---@return CS.Spine.IkConstraint
function CS.Spine.Skeleton:FindIkConstraint(constraintName)
end

---@param constraintName : CS.System.String
---@return CS.Spine.TransformConstraint
function CS.Spine.Skeleton:FindTransformConstraint(constraintName)
end

---@param constraintName : CS.System.String
---@return CS.Spine.PathConstraint
function CS.Spine.Skeleton:FindPathConstraint(constraintName)
end

---@param delta : CS.System.Single
function CS.Spine.Skeleton:Update(delta)
end

---@param x : CS.System.Single
---@param y : CS.System.Single
---@param width : CS.System.Single
---@param height : CS.System.Single
---@param vertexBuffer : CS.System.Single[]
function CS.Spine.Skeleton:GetBounds(x, y, width, height, vertexBuffer)
end
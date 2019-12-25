---@class CS.Spine.Bone : CS.System.Object
CS.Spine.Bone = {}

---@field public CS.Spine.Bone.yDown : CS.System.Boolean
CS.Spine.Bone.yDown = nil

---@property readonly CS.Spine.Bone.Data : CS.Spine.BoneData
CS.Spine.Bone.Data = nil

---@property readonly CS.Spine.Bone.Skeleton : CS.Spine.Skeleton
CS.Spine.Bone.Skeleton = nil

---@property readonly CS.Spine.Bone.Parent : CS.Spine.Bone
CS.Spine.Bone.Parent = nil

---@property readonly CS.Spine.Bone.Children : CS.Spine.ExposedList
CS.Spine.Bone.Children = nil

---@property readwrite CS.Spine.Bone.X : CS.System.Single
CS.Spine.Bone.X = nil

---@property readwrite CS.Spine.Bone.Y : CS.System.Single
CS.Spine.Bone.Y = nil

---@property readwrite CS.Spine.Bone.Rotation : CS.System.Single
CS.Spine.Bone.Rotation = nil

---@property readwrite CS.Spine.Bone.ScaleX : CS.System.Single
CS.Spine.Bone.ScaleX = nil

---@property readwrite CS.Spine.Bone.ScaleY : CS.System.Single
CS.Spine.Bone.ScaleY = nil

---@property readwrite CS.Spine.Bone.ShearX : CS.System.Single
CS.Spine.Bone.ShearX = nil

---@property readwrite CS.Spine.Bone.ShearY : CS.System.Single
CS.Spine.Bone.ShearY = nil

---@property readwrite CS.Spine.Bone.AppliedRotation : CS.System.Single
CS.Spine.Bone.AppliedRotation = nil

---@property readwrite CS.Spine.Bone.AX : CS.System.Single
CS.Spine.Bone.AX = nil

---@property readwrite CS.Spine.Bone.AY : CS.System.Single
CS.Spine.Bone.AY = nil

---@property readwrite CS.Spine.Bone.AScaleX : CS.System.Single
CS.Spine.Bone.AScaleX = nil

---@property readwrite CS.Spine.Bone.AScaleY : CS.System.Single
CS.Spine.Bone.AScaleY = nil

---@property readwrite CS.Spine.Bone.AShearX : CS.System.Single
CS.Spine.Bone.AShearX = nil

---@property readwrite CS.Spine.Bone.AShearY : CS.System.Single
CS.Spine.Bone.AShearY = nil

---@property readonly CS.Spine.Bone.A : CS.System.Single
CS.Spine.Bone.A = nil

---@property readonly CS.Spine.Bone.B : CS.System.Single
CS.Spine.Bone.B = nil

---@property readonly CS.Spine.Bone.C : CS.System.Single
CS.Spine.Bone.C = nil

---@property readonly CS.Spine.Bone.D : CS.System.Single
CS.Spine.Bone.D = nil

---@property readonly CS.Spine.Bone.WorldX : CS.System.Single
CS.Spine.Bone.WorldX = nil

---@property readonly CS.Spine.Bone.WorldY : CS.System.Single
CS.Spine.Bone.WorldY = nil

---@property readonly CS.Spine.Bone.WorldRotationX : CS.System.Single
CS.Spine.Bone.WorldRotationX = nil

---@property readonly CS.Spine.Bone.WorldRotationY : CS.System.Single
CS.Spine.Bone.WorldRotationY = nil

---@property readonly CS.Spine.Bone.WorldScaleX : CS.System.Single
CS.Spine.Bone.WorldScaleX = nil

---@property readonly CS.Spine.Bone.WorldScaleY : CS.System.Single
CS.Spine.Bone.WorldScaleY = nil

---@property readonly CS.Spine.Bone.WorldToLocalRotationX : CS.System.Single
CS.Spine.Bone.WorldToLocalRotationX = nil

---@property readonly CS.Spine.Bone.WorldToLocalRotationY : CS.System.Single
CS.Spine.Bone.WorldToLocalRotationY = nil

---@param data : CS.Spine.BoneData
---@param skeleton : CS.Spine.Skeleton
---@param parent : CS.Spine.Bone
---@return CS.Spine.Bone
function CS.Spine.Bone(data, skeleton, parent)
end

function CS.Spine.Bone:Update()
end

function CS.Spine.Bone:UpdateWorldTransform()
end

---@param x : CS.System.Single
---@param y : CS.System.Single
---@param rotation : CS.System.Single
---@param scaleX : CS.System.Single
---@param scaleY : CS.System.Single
---@param shearX : CS.System.Single
---@param shearY : CS.System.Single
function CS.Spine.Bone:UpdateWorldTransform(x, y, rotation, scaleX, scaleY, shearX, shearY)
end

function CS.Spine.Bone:SetToSetupPose()
end

---@param worldX : CS.System.Single
---@param worldY : CS.System.Single
---@param localX : CS.System.Single
---@param localY : CS.System.Single
function CS.Spine.Bone:WorldToLocal(worldX, worldY, localX, localY)
end

---@param localX : CS.System.Single
---@param localY : CS.System.Single
---@param worldX : CS.System.Single
---@param worldY : CS.System.Single
function CS.Spine.Bone:LocalToWorld(localX, localY, worldX, worldY)
end

---@param worldRotation : CS.System.Single
---@return CS.System.Single
function CS.Spine.Bone:WorldToLocalRotation(worldRotation)
end

---@param localRotation : CS.System.Single
---@return CS.System.Single
function CS.Spine.Bone:LocalToWorldRotation(localRotation)
end

---@param degrees : CS.System.Single
function CS.Spine.Bone:RotateWorld(degrees)
end

---@return CS.System.String
function CS.Spine.Bone:ToString()
end
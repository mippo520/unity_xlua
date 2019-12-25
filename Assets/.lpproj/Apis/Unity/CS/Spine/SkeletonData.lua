---@class CS.Spine.SkeletonData : CS.System.Object
CS.Spine.SkeletonData = {}

---@property readwrite CS.Spine.SkeletonData.Name : CS.System.String
CS.Spine.SkeletonData.Name = nil

---@property readonly CS.Spine.SkeletonData.Bones : CS.Spine.ExposedList
CS.Spine.SkeletonData.Bones = nil

---@property readonly CS.Spine.SkeletonData.Slots : CS.Spine.ExposedList
CS.Spine.SkeletonData.Slots = nil

---@property readwrite CS.Spine.SkeletonData.Skins : CS.Spine.ExposedList
CS.Spine.SkeletonData.Skins = nil

---@property readwrite CS.Spine.SkeletonData.DefaultSkin : CS.Spine.Skin
CS.Spine.SkeletonData.DefaultSkin = nil

---@property readwrite CS.Spine.SkeletonData.Events : CS.Spine.ExposedList
CS.Spine.SkeletonData.Events = nil

---@property readwrite CS.Spine.SkeletonData.Animations : CS.Spine.ExposedList
CS.Spine.SkeletonData.Animations = nil

---@property readwrite CS.Spine.SkeletonData.IkConstraints : CS.Spine.ExposedList
CS.Spine.SkeletonData.IkConstraints = nil

---@property readwrite CS.Spine.SkeletonData.TransformConstraints : CS.Spine.ExposedList
CS.Spine.SkeletonData.TransformConstraints = nil

---@property readwrite CS.Spine.SkeletonData.PathConstraints : CS.Spine.ExposedList
CS.Spine.SkeletonData.PathConstraints = nil

---@property readwrite CS.Spine.SkeletonData.Width : CS.System.Single
CS.Spine.SkeletonData.Width = nil

---@property readwrite CS.Spine.SkeletonData.Height : CS.System.Single
CS.Spine.SkeletonData.Height = nil

---@property readwrite CS.Spine.SkeletonData.Version : CS.System.String
CS.Spine.SkeletonData.Version = nil

---@property readwrite CS.Spine.SkeletonData.Hash : CS.System.String
CS.Spine.SkeletonData.Hash = nil

---@property readwrite CS.Spine.SkeletonData.ImagesPath : CS.System.String
CS.Spine.SkeletonData.ImagesPath = nil

---@property readwrite CS.Spine.SkeletonData.AudioPath : CS.System.String
CS.Spine.SkeletonData.AudioPath = nil

---@property readwrite CS.Spine.SkeletonData.Fps : CS.System.Single
CS.Spine.SkeletonData.Fps = nil

---@return CS.Spine.SkeletonData
function CS.Spine.SkeletonData()
end

---@param boneName : CS.System.String
---@return CS.Spine.BoneData
function CS.Spine.SkeletonData:FindBone(boneName)
end

---@param boneName : CS.System.String
---@return CS.System.Int32
function CS.Spine.SkeletonData:FindBoneIndex(boneName)
end

---@param slotName : CS.System.String
---@return CS.Spine.SlotData
function CS.Spine.SkeletonData:FindSlot(slotName)
end

---@param slotName : CS.System.String
---@return CS.System.Int32
function CS.Spine.SkeletonData:FindSlotIndex(slotName)
end

---@param skinName : CS.System.String
---@return CS.Spine.Skin
function CS.Spine.SkeletonData:FindSkin(skinName)
end

---@param eventDataName : CS.System.String
---@return CS.Spine.EventData
function CS.Spine.SkeletonData:FindEvent(eventDataName)
end

---@param animationName : CS.System.String
---@return CS.Spine.Animation
function CS.Spine.SkeletonData:FindAnimation(animationName)
end

---@param constraintName : CS.System.String
---@return CS.Spine.IkConstraintData
function CS.Spine.SkeletonData:FindIkConstraint(constraintName)
end

---@param constraintName : CS.System.String
---@return CS.Spine.TransformConstraintData
function CS.Spine.SkeletonData:FindTransformConstraint(constraintName)
end

---@param constraintName : CS.System.String
---@return CS.Spine.PathConstraintData
function CS.Spine.SkeletonData:FindPathConstraint(constraintName)
end

---@param pathConstraintName : CS.System.String
---@return CS.System.Int32
function CS.Spine.SkeletonData:FindPathConstraintIndex(pathConstraintName)
end

---@return CS.System.String
function CS.Spine.SkeletonData:ToString()
end
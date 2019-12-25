---@class CS.Spine.SkeletonBinary : CS.System.Object
CS.Spine.SkeletonBinary = {}

---@field public CS.Spine.SkeletonBinary.BONE_ROTATE : CS.System.Int32
CS.Spine.SkeletonBinary.BONE_ROTATE = nil

---@field public CS.Spine.SkeletonBinary.BONE_TRANSLATE : CS.System.Int32
CS.Spine.SkeletonBinary.BONE_TRANSLATE = nil

---@field public CS.Spine.SkeletonBinary.BONE_SCALE : CS.System.Int32
CS.Spine.SkeletonBinary.BONE_SCALE = nil

---@field public CS.Spine.SkeletonBinary.BONE_SHEAR : CS.System.Int32
CS.Spine.SkeletonBinary.BONE_SHEAR = nil

---@field public CS.Spine.SkeletonBinary.SLOT_ATTACHMENT : CS.System.Int32
CS.Spine.SkeletonBinary.SLOT_ATTACHMENT = nil

---@field public CS.Spine.SkeletonBinary.SLOT_COLOR : CS.System.Int32
CS.Spine.SkeletonBinary.SLOT_COLOR = nil

---@field public CS.Spine.SkeletonBinary.SLOT_TWO_COLOR : CS.System.Int32
CS.Spine.SkeletonBinary.SLOT_TWO_COLOR = nil

---@field public CS.Spine.SkeletonBinary.PATH_POSITION : CS.System.Int32
CS.Spine.SkeletonBinary.PATH_POSITION = nil

---@field public CS.Spine.SkeletonBinary.PATH_SPACING : CS.System.Int32
CS.Spine.SkeletonBinary.PATH_SPACING = nil

---@field public CS.Spine.SkeletonBinary.PATH_MIX : CS.System.Int32
CS.Spine.SkeletonBinary.PATH_MIX = nil

---@field public CS.Spine.SkeletonBinary.CURVE_LINEAR : CS.System.Int32
CS.Spine.SkeletonBinary.CURVE_LINEAR = nil

---@field public CS.Spine.SkeletonBinary.CURVE_STEPPED : CS.System.Int32
CS.Spine.SkeletonBinary.CURVE_STEPPED = nil

---@field public CS.Spine.SkeletonBinary.CURVE_BEZIER : CS.System.Int32
CS.Spine.SkeletonBinary.CURVE_BEZIER = nil

---@field public CS.Spine.SkeletonBinary.TransformModeValues : CS.Spine.TransformMode[]
CS.Spine.SkeletonBinary.TransformModeValues = nil

---@property readwrite CS.Spine.SkeletonBinary.Scale : CS.System.Single
CS.Spine.SkeletonBinary.Scale = nil

---@param atlasArray : CS.Spine.Atlas[]
---@return CS.Spine.SkeletonBinary
function CS.Spine.SkeletonBinary(atlasArray)
end

---@param attachmentLoader : CS.Spine.AttachmentLoader
---@return CS.Spine.SkeletonBinary
function CS.Spine.SkeletonBinary(attachmentLoader)
end

---@param path : CS.System.String
---@return CS.Spine.SkeletonData
function CS.Spine.SkeletonBinary:ReadSkeletonData(path)
end

---@param input : CS.System.IO.Stream
---@return CS.System.String
function CS.Spine.SkeletonBinary.GetVersionString(input)
end

---@param input : CS.System.IO.Stream
---@return CS.Spine.SkeletonData
function CS.Spine.SkeletonBinary:ReadSkeletonData(input)
end
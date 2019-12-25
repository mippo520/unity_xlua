---@class CS.Spine.RegionAttachment : CS.Spine.Attachment
CS.Spine.RegionAttachment = {}

---@field public CS.Spine.RegionAttachment.BLX : CS.System.Int32
CS.Spine.RegionAttachment.BLX = nil

---@field public CS.Spine.RegionAttachment.BLY : CS.System.Int32
CS.Spine.RegionAttachment.BLY = nil

---@field public CS.Spine.RegionAttachment.ULX : CS.System.Int32
CS.Spine.RegionAttachment.ULX = nil

---@field public CS.Spine.RegionAttachment.ULY : CS.System.Int32
CS.Spine.RegionAttachment.ULY = nil

---@field public CS.Spine.RegionAttachment.URX : CS.System.Int32
CS.Spine.RegionAttachment.URX = nil

---@field public CS.Spine.RegionAttachment.URY : CS.System.Int32
CS.Spine.RegionAttachment.URY = nil

---@field public CS.Spine.RegionAttachment.BRX : CS.System.Int32
CS.Spine.RegionAttachment.BRX = nil

---@field public CS.Spine.RegionAttachment.BRY : CS.System.Int32
CS.Spine.RegionAttachment.BRY = nil

---@property readwrite CS.Spine.RegionAttachment.X : CS.System.Single
CS.Spine.RegionAttachment.X = nil

---@property readwrite CS.Spine.RegionAttachment.Y : CS.System.Single
CS.Spine.RegionAttachment.Y = nil

---@property readwrite CS.Spine.RegionAttachment.Rotation : CS.System.Single
CS.Spine.RegionAttachment.Rotation = nil

---@property readwrite CS.Spine.RegionAttachment.ScaleX : CS.System.Single
CS.Spine.RegionAttachment.ScaleX = nil

---@property readwrite CS.Spine.RegionAttachment.ScaleY : CS.System.Single
CS.Spine.RegionAttachment.ScaleY = nil

---@property readwrite CS.Spine.RegionAttachment.Width : CS.System.Single
CS.Spine.RegionAttachment.Width = nil

---@property readwrite CS.Spine.RegionAttachment.Height : CS.System.Single
CS.Spine.RegionAttachment.Height = nil

---@property readwrite CS.Spine.RegionAttachment.R : CS.System.Single
CS.Spine.RegionAttachment.R = nil

---@property readwrite CS.Spine.RegionAttachment.G : CS.System.Single
CS.Spine.RegionAttachment.G = nil

---@property readwrite CS.Spine.RegionAttachment.B : CS.System.Single
CS.Spine.RegionAttachment.B = nil

---@property readwrite CS.Spine.RegionAttachment.A : CS.System.Single
CS.Spine.RegionAttachment.A = nil

---@property readwrite CS.Spine.RegionAttachment.Path : CS.System.String
CS.Spine.RegionAttachment.Path = nil

---@property readwrite CS.Spine.RegionAttachment.RendererObject : CS.System.Object
CS.Spine.RegionAttachment.RendererObject = nil

---@property readwrite CS.Spine.RegionAttachment.RegionOffsetX : CS.System.Single
CS.Spine.RegionAttachment.RegionOffsetX = nil

---@property readwrite CS.Spine.RegionAttachment.RegionOffsetY : CS.System.Single
CS.Spine.RegionAttachment.RegionOffsetY = nil

---@property readwrite CS.Spine.RegionAttachment.RegionWidth : CS.System.Single
CS.Spine.RegionAttachment.RegionWidth = nil

---@property readwrite CS.Spine.RegionAttachment.RegionHeight : CS.System.Single
CS.Spine.RegionAttachment.RegionHeight = nil

---@property readwrite CS.Spine.RegionAttachment.RegionOriginalWidth : CS.System.Single
CS.Spine.RegionAttachment.RegionOriginalWidth = nil

---@property readwrite CS.Spine.RegionAttachment.RegionOriginalHeight : CS.System.Single
CS.Spine.RegionAttachment.RegionOriginalHeight = nil

---@property readonly CS.Spine.RegionAttachment.Offset : CS.System.Single[]
CS.Spine.RegionAttachment.Offset = nil

---@property readonly CS.Spine.RegionAttachment.UVs : CS.System.Single[]
CS.Spine.RegionAttachment.UVs = nil

---@param name : CS.System.String
---@return CS.Spine.RegionAttachment
function CS.Spine.RegionAttachment(name)
end

function CS.Spine.RegionAttachment:UpdateOffset()
end

---@param u : CS.System.Single
---@param v : CS.System.Single
---@param u2 : CS.System.Single
---@param v2 : CS.System.Single
---@param rotate : CS.System.Boolean
function CS.Spine.RegionAttachment:SetUVs(u, v, u2, v2, rotate)
end

---@param bone : CS.Spine.Bone
---@param worldVertices : CS.System.Single[]
---@param offset : CS.System.Int32
---@param stride : CS.System.Int32
function CS.Spine.RegionAttachment:ComputeWorldVertices(bone, worldVertices, offset, stride)
end
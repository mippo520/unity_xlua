---@class CS.Spine.MeshAttachment : CS.Spine.VertexAttachment
CS.Spine.MeshAttachment = {}

---@property readwrite CS.Spine.MeshAttachment.HullLength : CS.System.Int32
CS.Spine.MeshAttachment.HullLength = nil

---@property readwrite CS.Spine.MeshAttachment.RegionUVs : CS.System.Single[]
CS.Spine.MeshAttachment.RegionUVs = nil

---@property readwrite CS.Spine.MeshAttachment.UVs : CS.System.Single[]
CS.Spine.MeshAttachment.UVs = nil

---@property readwrite CS.Spine.MeshAttachment.Triangles : CS.System.Int32[]
CS.Spine.MeshAttachment.Triangles = nil

---@property readwrite CS.Spine.MeshAttachment.R : CS.System.Single
CS.Spine.MeshAttachment.R = nil

---@property readwrite CS.Spine.MeshAttachment.G : CS.System.Single
CS.Spine.MeshAttachment.G = nil

---@property readwrite CS.Spine.MeshAttachment.B : CS.System.Single
CS.Spine.MeshAttachment.B = nil

---@property readwrite CS.Spine.MeshAttachment.A : CS.System.Single
CS.Spine.MeshAttachment.A = nil

---@property readwrite CS.Spine.MeshAttachment.Path : CS.System.String
CS.Spine.MeshAttachment.Path = nil

---@property readwrite CS.Spine.MeshAttachment.RendererObject : CS.System.Object
CS.Spine.MeshAttachment.RendererObject = nil

---@property readwrite CS.Spine.MeshAttachment.RegionU : CS.System.Single
CS.Spine.MeshAttachment.RegionU = nil

---@property readwrite CS.Spine.MeshAttachment.RegionV : CS.System.Single
CS.Spine.MeshAttachment.RegionV = nil

---@property readwrite CS.Spine.MeshAttachment.RegionU2 : CS.System.Single
CS.Spine.MeshAttachment.RegionU2 = nil

---@property readwrite CS.Spine.MeshAttachment.RegionV2 : CS.System.Single
CS.Spine.MeshAttachment.RegionV2 = nil

---@property readwrite CS.Spine.MeshAttachment.RegionRotate : CS.System.Boolean
CS.Spine.MeshAttachment.RegionRotate = nil

---@property readwrite CS.Spine.MeshAttachment.RegionOffsetX : CS.System.Single
CS.Spine.MeshAttachment.RegionOffsetX = nil

---@property readwrite CS.Spine.MeshAttachment.RegionOffsetY : CS.System.Single
CS.Spine.MeshAttachment.RegionOffsetY = nil

---@property readwrite CS.Spine.MeshAttachment.RegionWidth : CS.System.Single
CS.Spine.MeshAttachment.RegionWidth = nil

---@property readwrite CS.Spine.MeshAttachment.RegionHeight : CS.System.Single
CS.Spine.MeshAttachment.RegionHeight = nil

---@property readwrite CS.Spine.MeshAttachment.RegionOriginalWidth : CS.System.Single
CS.Spine.MeshAttachment.RegionOriginalWidth = nil

---@property readwrite CS.Spine.MeshAttachment.RegionOriginalHeight : CS.System.Single
CS.Spine.MeshAttachment.RegionOriginalHeight = nil

---@property readwrite CS.Spine.MeshAttachment.InheritDeform : CS.System.Boolean
CS.Spine.MeshAttachment.InheritDeform = nil

---@property readwrite CS.Spine.MeshAttachment.ParentMesh : CS.Spine.MeshAttachment
CS.Spine.MeshAttachment.ParentMesh = nil

---@property readwrite CS.Spine.MeshAttachment.Edges : CS.System.Int32[]
CS.Spine.MeshAttachment.Edges = nil

---@property readwrite CS.Spine.MeshAttachment.Width : CS.System.Single
CS.Spine.MeshAttachment.Width = nil

---@property readwrite CS.Spine.MeshAttachment.Height : CS.System.Single
CS.Spine.MeshAttachment.Height = nil

---@param name : CS.System.String
---@return CS.Spine.MeshAttachment
function CS.Spine.MeshAttachment(name)
end

function CS.Spine.MeshAttachment:UpdateUVs()
end

---@param sourceAttachment : CS.Spine.VertexAttachment
---@return CS.System.Boolean
function CS.Spine.MeshAttachment:ApplyDeform(sourceAttachment)
end
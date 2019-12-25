---@class CS.Spine.VertexAttachment : CS.Spine.Attachment
CS.Spine.VertexAttachment = {}

---@property readonly CS.Spine.VertexAttachment.Id : CS.System.Int32
CS.Spine.VertexAttachment.Id = nil

---@property readwrite CS.Spine.VertexAttachment.Bones : CS.System.Int32[]
CS.Spine.VertexAttachment.Bones = nil

---@property readwrite CS.Spine.VertexAttachment.Vertices : CS.System.Single[]
CS.Spine.VertexAttachment.Vertices = nil

---@property readwrite CS.Spine.VertexAttachment.WorldVerticesLength : CS.System.Int32
CS.Spine.VertexAttachment.WorldVerticesLength = nil

---@param name : CS.System.String
---@return CS.Spine.VertexAttachment
function CS.Spine.VertexAttachment(name)
end

---@param slot : CS.Spine.Slot
---@param worldVertices : CS.System.Single[]
function CS.Spine.VertexAttachment:ComputeWorldVertices(slot, worldVertices)
end

---@param slot : CS.Spine.Slot
---@param start : CS.System.Int32
---@param count : CS.System.Int32
---@param worldVertices : CS.System.Single[]
---@param offset : CS.System.Int32
---@param stride : CS.System.Int32
function CS.Spine.VertexAttachment:ComputeWorldVertices(slot, start, count, worldVertices, offset, stride)
end

---@param sourceAttachment : CS.Spine.VertexAttachment
---@return CS.System.Boolean
function CS.Spine.VertexAttachment:ApplyDeform(sourceAttachment)
end
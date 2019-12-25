---@class CS.Spine.Unity.SkeletonRendererInstruction : CS.System.Object
CS.Spine.Unity.SkeletonRendererInstruction = {}

---@field public CS.Spine.Unity.SkeletonRendererInstruction.submeshInstructions : CS.Spine.ExposedList
CS.Spine.Unity.SkeletonRendererInstruction.submeshInstructions = nil

---@field public CS.Spine.Unity.SkeletonRendererInstruction.immutableTriangles : CS.System.Boolean
CS.Spine.Unity.SkeletonRendererInstruction.immutableTriangles = nil

---@field public CS.Spine.Unity.SkeletonRendererInstruction.hasActiveClipping : CS.System.Boolean
CS.Spine.Unity.SkeletonRendererInstruction.hasActiveClipping = nil

---@field public CS.Spine.Unity.SkeletonRendererInstruction.rawVertexCount : CS.System.Int32
CS.Spine.Unity.SkeletonRendererInstruction.rawVertexCount = nil

---@field public CS.Spine.Unity.SkeletonRendererInstruction.attachments : CS.Spine.ExposedList
CS.Spine.Unity.SkeletonRendererInstruction.attachments = nil

---@return CS.Spine.Unity.SkeletonRendererInstruction
function CS.Spine.Unity.SkeletonRendererInstruction()
end

function CS.Spine.Unity.SkeletonRendererInstruction:Clear()
end

function CS.Spine.Unity.SkeletonRendererInstruction:Dispose()
end

---@param instructions : CS.Spine.ExposedList
---@param startSubmesh : CS.System.Int32
---@param endSubmesh : CS.System.Int32
function CS.Spine.Unity.SkeletonRendererInstruction:SetWithSubset(instructions, startSubmesh, endSubmesh)
end

---@param other : CS.Spine.Unity.SkeletonRendererInstruction
function CS.Spine.Unity.SkeletonRendererInstruction:Set(other)
end

---@param a : CS.Spine.Unity.SkeletonRendererInstruction
---@param b : CS.Spine.Unity.SkeletonRendererInstruction
---@return CS.System.Boolean
function CS.Spine.Unity.SkeletonRendererInstruction.GeometryNotEqual(a, b)
end
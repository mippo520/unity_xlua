---@class CS.Spine.SkeletonClipping : CS.System.Object
CS.Spine.SkeletonClipping = {}

---@property readonly CS.Spine.SkeletonClipping.ClippedVertices : CS.Spine.ExposedList
CS.Spine.SkeletonClipping.ClippedVertices = nil

---@property readonly CS.Spine.SkeletonClipping.ClippedTriangles : CS.Spine.ExposedList
CS.Spine.SkeletonClipping.ClippedTriangles = nil

---@property readonly CS.Spine.SkeletonClipping.ClippedUVs : CS.Spine.ExposedList
CS.Spine.SkeletonClipping.ClippedUVs = nil

---@property readonly CS.Spine.SkeletonClipping.IsClipping : CS.System.Boolean
CS.Spine.SkeletonClipping.IsClipping = nil

---@return CS.Spine.SkeletonClipping
function CS.Spine.SkeletonClipping()
end

---@param slot : CS.Spine.Slot
---@param clip : CS.Spine.ClippingAttachment
---@return CS.System.Int32
function CS.Spine.SkeletonClipping:ClipStart(slot, clip)
end

---@param slot : CS.Spine.Slot
function CS.Spine.SkeletonClipping:ClipEnd(slot)
end

function CS.Spine.SkeletonClipping:ClipEnd()
end

---@param vertices : CS.System.Single[]
---@param verticesLength : CS.System.Int32
---@param triangles : CS.System.Int32[]
---@param trianglesLength : CS.System.Int32
---@param uvs : CS.System.Single[]
function CS.Spine.SkeletonClipping:ClipTriangles(vertices, verticesLength, triangles, trianglesLength, uvs)
end

---@param polygon : CS.Spine.ExposedList
function CS.Spine.SkeletonClipping.MakeClockwise(polygon)
end
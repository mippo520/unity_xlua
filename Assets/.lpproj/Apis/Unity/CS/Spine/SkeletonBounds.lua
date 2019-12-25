---@class CS.Spine.SkeletonBounds : CS.System.Object
CS.Spine.SkeletonBounds = {}

---@property readwrite CS.Spine.SkeletonBounds.BoundingBoxes : CS.Spine.ExposedList
CS.Spine.SkeletonBounds.BoundingBoxes = nil

---@property readwrite CS.Spine.SkeletonBounds.Polygons : CS.Spine.ExposedList
CS.Spine.SkeletonBounds.Polygons = nil

---@property readwrite CS.Spine.SkeletonBounds.MinX : CS.System.Single
CS.Spine.SkeletonBounds.MinX = nil

---@property readwrite CS.Spine.SkeletonBounds.MinY : CS.System.Single
CS.Spine.SkeletonBounds.MinY = nil

---@property readwrite CS.Spine.SkeletonBounds.MaxX : CS.System.Single
CS.Spine.SkeletonBounds.MaxX = nil

---@property readwrite CS.Spine.SkeletonBounds.MaxY : CS.System.Single
CS.Spine.SkeletonBounds.MaxY = nil

---@property readonly CS.Spine.SkeletonBounds.Width : CS.System.Single
CS.Spine.SkeletonBounds.Width = nil

---@property readonly CS.Spine.SkeletonBounds.Height : CS.System.Single
CS.Spine.SkeletonBounds.Height = nil

---@return CS.Spine.SkeletonBounds
function CS.Spine.SkeletonBounds()
end

---@param skeleton : CS.Spine.Skeleton
---@param updateAabb : CS.System.Boolean
function CS.Spine.SkeletonBounds:Update(skeleton, updateAabb)
end

---@param x : CS.System.Single
---@param y : CS.System.Single
---@return CS.System.Boolean
function CS.Spine.SkeletonBounds:AabbContainsPoint(x, y)
end

---@param x1 : CS.System.Single
---@param y1 : CS.System.Single
---@param x2 : CS.System.Single
---@param y2 : CS.System.Single
---@return CS.System.Boolean
function CS.Spine.SkeletonBounds:AabbIntersectsSegment(x1, y1, x2, y2)
end

---@param bounds : CS.Spine.SkeletonBounds
---@return CS.System.Boolean
function CS.Spine.SkeletonBounds:AabbIntersectsSkeleton(bounds)
end

---@param polygon : CS.Spine.Polygon
---@param x : CS.System.Single
---@param y : CS.System.Single
---@return CS.System.Boolean
function CS.Spine.SkeletonBounds:ContainsPoint(polygon, x, y)
end

---@param x : CS.System.Single
---@param y : CS.System.Single
---@return CS.Spine.BoundingBoxAttachment
function CS.Spine.SkeletonBounds:ContainsPoint(x, y)
end

---@param x1 : CS.System.Single
---@param y1 : CS.System.Single
---@param x2 : CS.System.Single
---@param y2 : CS.System.Single
---@return CS.Spine.BoundingBoxAttachment
function CS.Spine.SkeletonBounds:IntersectsSegment(x1, y1, x2, y2)
end

---@param polygon : CS.Spine.Polygon
---@param x1 : CS.System.Single
---@param y1 : CS.System.Single
---@param x2 : CS.System.Single
---@param y2 : CS.System.Single
---@return CS.System.Boolean
function CS.Spine.SkeletonBounds:IntersectsSegment(polygon, x1, y1, x2, y2)
end

---@param attachment : CS.Spine.BoundingBoxAttachment
---@return CS.Spine.Polygon
function CS.Spine.SkeletonBounds:GetPolygon(attachment)
end
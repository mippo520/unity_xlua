---@class CS.Spine.Unity.Modules.SkeletonRenderSeparator : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.Modules.SkeletonRenderSeparator = {}

---@field public CS.Spine.Unity.Modules.SkeletonRenderSeparator.DefaultSortingOrderIncrement : CS.System.Int32
CS.Spine.Unity.Modules.SkeletonRenderSeparator.DefaultSortingOrderIncrement = nil

---@field public CS.Spine.Unity.Modules.SkeletonRenderSeparator.copyPropertyBlock : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRenderSeparator.copyPropertyBlock = nil

---@field public CS.Spine.Unity.Modules.SkeletonRenderSeparator.copyMeshRendererFlags : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonRenderSeparator.copyMeshRendererFlags = nil

---@field public CS.Spine.Unity.Modules.SkeletonRenderSeparator.partsRenderers : CS.System.Collections.Generic.List
CS.Spine.Unity.Modules.SkeletonRenderSeparator.partsRenderers = nil

---@property readwrite CS.Spine.Unity.Modules.SkeletonRenderSeparator.SkeletonRenderer : CS.Spine.Unity.SkeletonRenderer
CS.Spine.Unity.Modules.SkeletonRenderSeparator.SkeletonRenderer = nil

---@return CS.Spine.Unity.Modules.SkeletonRenderSeparator
function CS.Spine.Unity.Modules.SkeletonRenderSeparator()
end

---@param skeletonRenderer : CS.Spine.Unity.SkeletonRenderer
---@param sortingLayerID : CS.System.Int32
---@param extraPartsRenderers : CS.System.Int32
---@param sortingOrderIncrement : CS.System.Int32
---@param baseSortingOrder : CS.System.Int32
---@param addMinimumPartsRenderers : CS.System.Boolean
---@return CS.Spine.Unity.Modules.SkeletonRenderSeparator
function CS.Spine.Unity.Modules.SkeletonRenderSeparator.AddToSkeletonRenderer(skeletonRenderer, sortingLayerID, extraPartsRenderers, sortingOrderIncrement, baseSortingOrder, addMinimumPartsRenderers)
end

---@param sortingOrderIncrement : CS.System.Int32
---@param name : CS.System.String
---@return CS.Spine.Unity.Modules.SkeletonPartsRenderer
function CS.Spine.Unity.Modules.SkeletonRenderSeparator:AddPartsRenderer(sortingOrderIncrement, name)
end

function CS.Spine.Unity.Modules.SkeletonRenderSeparator:OnEnable()
end

function CS.Spine.Unity.Modules.SkeletonRenderSeparator:OnDisable()
end
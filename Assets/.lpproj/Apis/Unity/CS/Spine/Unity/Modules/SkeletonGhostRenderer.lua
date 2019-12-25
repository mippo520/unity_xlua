---@class CS.Spine.Unity.Modules.SkeletonGhostRenderer : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.Modules.SkeletonGhostRenderer = {}

---@return CS.Spine.Unity.Modules.SkeletonGhostRenderer
function CS.Spine.Unity.Modules.SkeletonGhostRenderer()
end

---@param mesh : CS.UnityEngine.Mesh
---@param materials : CS.UnityEngine.Material[]
---@param color : CS.UnityEngine.Color32
---@param additive : CS.System.Boolean
---@param speed : CS.System.Single
---@param sortingLayerID : CS.System.Int32
---@param sortingOrder : CS.System.Int32
function CS.Spine.Unity.Modules.SkeletonGhostRenderer:Initialize(mesh, materials, color, additive, speed, sortingLayerID, sortingOrder)
end

function CS.Spine.Unity.Modules.SkeletonGhostRenderer:Cleanup()
end
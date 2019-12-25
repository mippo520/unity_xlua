---@class CS.Spine.Unity.Modules.SkeletonPartsRenderer : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.Modules.SkeletonPartsRenderer = {}

---@property readonly CS.Spine.Unity.Modules.SkeletonPartsRenderer.MeshGenerator : CS.Spine.Unity.MeshGenerator
CS.Spine.Unity.Modules.SkeletonPartsRenderer.MeshGenerator = nil

---@property readonly CS.Spine.Unity.Modules.SkeletonPartsRenderer.MeshRenderer : CS.UnityEngine.MeshRenderer
CS.Spine.Unity.Modules.SkeletonPartsRenderer.MeshRenderer = nil

---@property readonly CS.Spine.Unity.Modules.SkeletonPartsRenderer.MeshFilter : CS.UnityEngine.MeshFilter
CS.Spine.Unity.Modules.SkeletonPartsRenderer.MeshFilter = nil

---@return CS.Spine.Unity.Modules.SkeletonPartsRenderer
function CS.Spine.Unity.Modules.SkeletonPartsRenderer()
end

function CS.Spine.Unity.Modules.SkeletonPartsRenderer:ClearMesh()
end

---@param instructions : CS.Spine.ExposedList
---@param startSubmesh : CS.System.Int32
---@param endSubmesh : CS.System.Int32
function CS.Spine.Unity.Modules.SkeletonPartsRenderer:RenderParts(instructions, startSubmesh, endSubmesh)
end

---@param block : CS.UnityEngine.MaterialPropertyBlock
function CS.Spine.Unity.Modules.SkeletonPartsRenderer:SetPropertyBlock(block)
end

---@param parent : CS.UnityEngine.Transform
---@param name : CS.System.String
---@param sortingOrder : CS.System.Int32
---@return CS.Spine.Unity.Modules.SkeletonPartsRenderer
function CS.Spine.Unity.Modules.SkeletonPartsRenderer.NewPartsRendererGameObject(parent, name, sortingOrder)
end
---@class CS.Spine.Unity.SkeletonRenderer : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.SkeletonRenderer = {}

---@field public CS.Spine.Unity.SkeletonRenderer.skeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
CS.Spine.Unity.SkeletonRenderer.skeletonDataAsset = nil

---@field public CS.Spine.Unity.SkeletonRenderer.initialSkinName : CS.System.String
CS.Spine.Unity.SkeletonRenderer.initialSkinName = nil

---@field public CS.Spine.Unity.SkeletonRenderer.initialFlipX : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.initialFlipX = nil

---@field public CS.Spine.Unity.SkeletonRenderer.initialFlipY : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.initialFlipY = nil

---@field public CS.Spine.Unity.SkeletonRenderer.separatorSlots : CS.System.Collections.Generic.List
CS.Spine.Unity.SkeletonRenderer.separatorSlots = nil

---@field public CS.Spine.Unity.SkeletonRenderer.zSpacing : CS.System.Single
CS.Spine.Unity.SkeletonRenderer.zSpacing = nil

---@field public CS.Spine.Unity.SkeletonRenderer.useClipping : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.useClipping = nil

---@field public CS.Spine.Unity.SkeletonRenderer.immutableTriangles : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.immutableTriangles = nil

---@field public CS.Spine.Unity.SkeletonRenderer.pmaVertexColors : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.pmaVertexColors = nil

---@field public CS.Spine.Unity.SkeletonRenderer.clearStateOnDisable : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.clearStateOnDisable = nil

---@field public CS.Spine.Unity.SkeletonRenderer.tintBlack : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.tintBlack = nil

---@field public CS.Spine.Unity.SkeletonRenderer.singleSubmesh : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.singleSubmesh = nil

---@field public CS.Spine.Unity.SkeletonRenderer.addNormals : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.addNormals = nil

---@field public CS.Spine.Unity.SkeletonRenderer.calculateTangents : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.calculateTangents = nil

---@field public CS.Spine.Unity.SkeletonRenderer.maskInteraction : CS.UnityEngine.SpriteMaskInteraction
CS.Spine.Unity.SkeletonRenderer.maskInteraction = nil

---@field public CS.Spine.Unity.SkeletonRenderer.maskMaterials : CS.Spine.Unity.SpriteMaskInteractionMaterials
CS.Spine.Unity.SkeletonRenderer.maskMaterials = nil

---@field public CS.Spine.Unity.SkeletonRenderer.STENCIL_COMP_PARAM_ID : CS.System.Int32
CS.Spine.Unity.SkeletonRenderer.STENCIL_COMP_PARAM_ID = nil

---@field public CS.Spine.Unity.SkeletonRenderer.STENCIL_COMP_MASKINTERACTION_NONE : CS.UnityEngine.Rendering.CompareFunction
CS.Spine.Unity.SkeletonRenderer.STENCIL_COMP_MASKINTERACTION_NONE = nil

---@field public CS.Spine.Unity.SkeletonRenderer.STENCIL_COMP_MASKINTERACTION_VISIBLE_INSIDE : CS.UnityEngine.Rendering.CompareFunction
CS.Spine.Unity.SkeletonRenderer.STENCIL_COMP_MASKINTERACTION_VISIBLE_INSIDE = nil

---@field public CS.Spine.Unity.SkeletonRenderer.STENCIL_COMP_MASKINTERACTION_VISIBLE_OUTSIDE : CS.UnityEngine.Rendering.CompareFunction
CS.Spine.Unity.SkeletonRenderer.STENCIL_COMP_MASKINTERACTION_VISIBLE_OUTSIDE = nil

---@field public CS.Spine.Unity.SkeletonRenderer.disableRenderingOnOverride : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.disableRenderingOnOverride = nil

---@field public CS.Spine.Unity.SkeletonRenderer.valid : CS.System.Boolean
CS.Spine.Unity.SkeletonRenderer.valid = nil

---@field public CS.Spine.Unity.SkeletonRenderer.skeleton : CS.Spine.Skeleton
CS.Spine.Unity.SkeletonRenderer.skeleton = nil

---@property readonly CS.Spine.Unity.SkeletonRenderer.CustomMaterialOverride : CS.System.Collections.Generic.Dictionary
CS.Spine.Unity.SkeletonRenderer.CustomMaterialOverride = nil

---@property readonly CS.Spine.Unity.SkeletonRenderer.CustomSlotMaterials : CS.System.Collections.Generic.Dictionary
CS.Spine.Unity.SkeletonRenderer.CustomSlotMaterials = nil

---@property readonly CS.Spine.Unity.SkeletonRenderer.Skeleton : CS.Spine.Skeleton
CS.Spine.Unity.SkeletonRenderer.Skeleton = nil

---@property readonly CS.Spine.Unity.SkeletonRenderer.SkeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
CS.Spine.Unity.SkeletonRenderer.SkeletonDataAsset = nil

---@return CS.Spine.Unity.SkeletonRenderer
function CS.Spine.Unity.SkeletonRenderer()
end

---@param value : CS.Spine.Unity.InstructionDelegate
function CS.Spine.Unity.SkeletonRenderer:add_GenerateMeshOverride(value)
end

---@param value : CS.Spine.Unity.InstructionDelegate
function CS.Spine.Unity.SkeletonRenderer:remove_GenerateMeshOverride(value)
end

---@param value : CS.Spine.Unity.MeshGeneratorDelegate
function CS.Spine.Unity.SkeletonRenderer:add_OnPostProcessVertices(value)
end

---@param value : CS.Spine.Unity.MeshGeneratorDelegate
function CS.Spine.Unity.SkeletonRenderer:remove_OnPostProcessVertices(value)
end

---@param value : CS.Spine.Unity.SkeletonRendererDelegate
function CS.Spine.Unity.SkeletonRenderer:add_OnRebuild(value)
end

---@param value : CS.Spine.Unity.SkeletonRendererDelegate
function CS.Spine.Unity.SkeletonRenderer:remove_OnRebuild(value)
end

---@param settings : CS.Spine.Unity.Settings
function CS.Spine.Unity.SkeletonRenderer:SetMeshSettings(settings)
end

function CS.Spine.Unity.SkeletonRenderer:Awake()
end

function CS.Spine.Unity.SkeletonRenderer:ClearState()
end

---@param minimumVertexCount : CS.System.Int32
function CS.Spine.Unity.SkeletonRenderer:EnsureMeshGeneratorCapacity(minimumVertexCount)
end

---@param overwrite : CS.System.Boolean
function CS.Spine.Unity.SkeletonRenderer:Initialize(overwrite)
end

function CS.Spine.Unity.SkeletonRenderer:LateUpdate()
end

---@param startsWith : CS.System.String
---@param clearExistingSeparators : CS.System.Boolean
---@param updateStringArray : CS.System.Boolean
function CS.Spine.Unity.SkeletonRenderer:FindAndApplySeparatorSlots(startsWith, clearExistingSeparators, updateStringArray)
end

---@param slotNamePredicate : CS.System.Func
---@param clearExistingSeparators : CS.System.Boolean
---@param updateStringArray : CS.System.Boolean
function CS.Spine.Unity.SkeletonRenderer:FindAndApplySeparatorSlots(slotNamePredicate, clearExistingSeparators, updateStringArray)
end

function CS.Spine.Unity.SkeletonRenderer:ReapplySeparatorSlotNames()
end
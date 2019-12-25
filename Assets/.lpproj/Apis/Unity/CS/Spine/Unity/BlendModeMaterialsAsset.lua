---@class CS.Spine.Unity.BlendModeMaterialsAsset : CS.Spine.Unity.SkeletonDataModifierAsset
CS.Spine.Unity.BlendModeMaterialsAsset = {}

---@field public CS.Spine.Unity.BlendModeMaterialsAsset.multiplyMaterialTemplate : CS.UnityEngine.Material
CS.Spine.Unity.BlendModeMaterialsAsset.multiplyMaterialTemplate = nil

---@field public CS.Spine.Unity.BlendModeMaterialsAsset.screenMaterialTemplate : CS.UnityEngine.Material
CS.Spine.Unity.BlendModeMaterialsAsset.screenMaterialTemplate = nil

---@field public CS.Spine.Unity.BlendModeMaterialsAsset.additiveMaterialTemplate : CS.UnityEngine.Material
CS.Spine.Unity.BlendModeMaterialsAsset.additiveMaterialTemplate = nil

---@field public CS.Spine.Unity.BlendModeMaterialsAsset.applyAdditiveMaterial : CS.System.Boolean
CS.Spine.Unity.BlendModeMaterialsAsset.applyAdditiveMaterial = nil

---@return CS.Spine.Unity.BlendModeMaterialsAsset
function CS.Spine.Unity.BlendModeMaterialsAsset()
end

---@param skeletonData : CS.Spine.SkeletonData
function CS.Spine.Unity.BlendModeMaterialsAsset:Apply(skeletonData)
end

---@param skeletonData : CS.Spine.SkeletonData
---@param multiplyTemplate : CS.UnityEngine.Material
---@param screenTemplate : CS.UnityEngine.Material
---@param additiveTemplate : CS.UnityEngine.Material
---@param includeAdditiveSlots : CS.System.Boolean
function CS.Spine.Unity.BlendModeMaterialsAsset.ApplyMaterials(skeletonData, multiplyTemplate, screenTemplate, additiveTemplate, includeAdditiveSlots)
end
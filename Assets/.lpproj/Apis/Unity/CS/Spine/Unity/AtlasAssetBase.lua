---@class CS.Spine.Unity.AtlasAssetBase : CS.UnityEngine.ScriptableObject
CS.Spine.Unity.AtlasAssetBase = {}

---@property readonly CS.Spine.Unity.AtlasAssetBase.PrimaryMaterial : CS.UnityEngine.Material
CS.Spine.Unity.AtlasAssetBase.PrimaryMaterial = nil

---@property readonly CS.Spine.Unity.AtlasAssetBase.Materials : CS.System.Collections.Generic.IEnumerable
CS.Spine.Unity.AtlasAssetBase.Materials = nil

---@property readonly CS.Spine.Unity.AtlasAssetBase.MaterialCount : CS.System.Int32
CS.Spine.Unity.AtlasAssetBase.MaterialCount = nil

---@property readonly CS.Spine.Unity.AtlasAssetBase.IsLoaded : CS.System.Boolean
CS.Spine.Unity.AtlasAssetBase.IsLoaded = nil

function CS.Spine.Unity.AtlasAssetBase:Clear()
end

---@return CS.Spine.Atlas
function CS.Spine.Unity.AtlasAssetBase:GetAtlas()
end
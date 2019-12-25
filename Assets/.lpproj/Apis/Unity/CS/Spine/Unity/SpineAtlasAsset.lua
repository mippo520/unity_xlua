---@class CS.Spine.Unity.SpineAtlasAsset : CS.Spine.Unity.AtlasAssetBase
CS.Spine.Unity.SpineAtlasAsset = {}

---@field public CS.Spine.Unity.SpineAtlasAsset.atlasFile : CS.UnityEngine.TextAsset
CS.Spine.Unity.SpineAtlasAsset.atlasFile = nil

---@field public CS.Spine.Unity.SpineAtlasAsset.materials : CS.UnityEngine.Material[]
CS.Spine.Unity.SpineAtlasAsset.materials = nil

---@property readonly CS.Spine.Unity.SpineAtlasAsset.IsLoaded : CS.System.Boolean
CS.Spine.Unity.SpineAtlasAsset.IsLoaded = nil

---@property readonly CS.Spine.Unity.SpineAtlasAsset.Materials : CS.System.Collections.Generic.IEnumerable
CS.Spine.Unity.SpineAtlasAsset.Materials = nil

---@property readonly CS.Spine.Unity.SpineAtlasAsset.MaterialCount : CS.System.Int32
CS.Spine.Unity.SpineAtlasAsset.MaterialCount = nil

---@property readonly CS.Spine.Unity.SpineAtlasAsset.PrimaryMaterial : CS.UnityEngine.Material
CS.Spine.Unity.SpineAtlasAsset.PrimaryMaterial = nil

---@return CS.Spine.Unity.SpineAtlasAsset
function CS.Spine.Unity.SpineAtlasAsset()
end

---@param atlasText : CS.UnityEngine.TextAsset
---@param materials : CS.UnityEngine.Material[]
---@param initialize : CS.System.Boolean
---@return CS.Spine.Unity.SpineAtlasAsset
function CS.Spine.Unity.SpineAtlasAsset.CreateRuntimeInstance(atlasText, materials, initialize)
end

---@param atlasText : CS.UnityEngine.TextAsset
---@param textures : CS.UnityEngine.Texture2D[]
---@param materialPropertySource : CS.UnityEngine.Material
---@param initialize : CS.System.Boolean
---@return CS.Spine.Unity.SpineAtlasAsset
function CS.Spine.Unity.SpineAtlasAsset.CreateRuntimeInstance(atlasText, textures, materialPropertySource, initialize)
end

---@param atlasText : CS.UnityEngine.TextAsset
---@param textures : CS.UnityEngine.Texture2D[]
---@param shader : CS.UnityEngine.Shader
---@param initialize : CS.System.Boolean
---@return CS.Spine.Unity.SpineAtlasAsset
function CS.Spine.Unity.SpineAtlasAsset.CreateRuntimeInstance(atlasText, textures, shader, initialize)
end

function CS.Spine.Unity.SpineAtlasAsset:Clear()
end

---@return CS.Spine.Atlas
function CS.Spine.Unity.SpineAtlasAsset:GetAtlas()
end

---@param name : CS.System.String
---@param mesh : CS.UnityEngine.Mesh
---@param material : CS.UnityEngine.Material
---@param scale : CS.System.Single
---@return CS.UnityEngine.Mesh
function CS.Spine.Unity.SpineAtlasAsset:GenerateMesh(name, mesh, material, scale)
end
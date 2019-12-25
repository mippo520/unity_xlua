---@class CS.Spine.Unity.SkeletonGraphic : CS.UnityEngine.UI.MaskableGraphic
CS.Spine.Unity.SkeletonGraphic = {}

---@field public CS.Spine.Unity.SkeletonGraphic.skeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
CS.Spine.Unity.SkeletonGraphic.skeletonDataAsset = nil

---@field public CS.Spine.Unity.SkeletonGraphic.initialSkinName : CS.System.String
CS.Spine.Unity.SkeletonGraphic.initialSkinName = nil

---@field public CS.Spine.Unity.SkeletonGraphic.initialFlipX : CS.System.Boolean
CS.Spine.Unity.SkeletonGraphic.initialFlipX = nil

---@field public CS.Spine.Unity.SkeletonGraphic.initialFlipY : CS.System.Boolean
CS.Spine.Unity.SkeletonGraphic.initialFlipY = nil

---@field public CS.Spine.Unity.SkeletonGraphic.startingAnimation : CS.System.String
CS.Spine.Unity.SkeletonGraphic.startingAnimation = nil

---@field public CS.Spine.Unity.SkeletonGraphic.startingLoop : CS.System.Boolean
CS.Spine.Unity.SkeletonGraphic.startingLoop = nil

---@field public CS.Spine.Unity.SkeletonGraphic.timeScale : CS.System.Single
CS.Spine.Unity.SkeletonGraphic.timeScale = nil

---@field public CS.Spine.Unity.SkeletonGraphic.freeze : CS.System.Boolean
CS.Spine.Unity.SkeletonGraphic.freeze = nil

---@field public CS.Spine.Unity.SkeletonGraphic.unscaledTime : CS.System.Boolean
CS.Spine.Unity.SkeletonGraphic.unscaledTime = nil

---@property readonly CS.Spine.Unity.SkeletonGraphic.SkeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
CS.Spine.Unity.SkeletonGraphic.SkeletonDataAsset = nil

---@property readwrite CS.Spine.Unity.SkeletonGraphic.OverrideTexture : CS.UnityEngine.Texture
CS.Spine.Unity.SkeletonGraphic.OverrideTexture = nil

---@property readonly CS.Spine.Unity.SkeletonGraphic.mainTexture : CS.UnityEngine.Texture
CS.Spine.Unity.SkeletonGraphic.mainTexture = nil

---@property readwrite CS.Spine.Unity.SkeletonGraphic.Skeleton : CS.Spine.Skeleton
CS.Spine.Unity.SkeletonGraphic.Skeleton = nil

---@property readonly CS.Spine.Unity.SkeletonGraphic.SkeletonData : CS.Spine.SkeletonData
CS.Spine.Unity.SkeletonGraphic.SkeletonData = nil

---@property readonly CS.Spine.Unity.SkeletonGraphic.IsValid : CS.System.Boolean
CS.Spine.Unity.SkeletonGraphic.IsValid = nil

---@property readonly CS.Spine.Unity.SkeletonGraphic.AnimationState : CS.Spine.AnimationState
CS.Spine.Unity.SkeletonGraphic.AnimationState = nil

---@property readonly CS.Spine.Unity.SkeletonGraphic.MeshGenerator : CS.Spine.Unity.MeshGenerator
CS.Spine.Unity.SkeletonGraphic.MeshGenerator = nil

---@return CS.Spine.Unity.SkeletonGraphic
function CS.Spine.Unity.SkeletonGraphic()
end

---@param skeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
---@param parent : CS.UnityEngine.Transform
---@param material : CS.UnityEngine.Material
---@return CS.Spine.Unity.SkeletonGraphic
function CS.Spine.Unity.SkeletonGraphic.NewSkeletonGraphicGameObject(skeletonDataAsset, parent, material)
end

---@param gameObject : CS.UnityEngine.GameObject
---@param skeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
---@param material : CS.UnityEngine.Material
---@return CS.Spine.Unity.SkeletonGraphic
function CS.Spine.Unity.SkeletonGraphic.AddSkeletonGraphicComponent(gameObject, skeletonDataAsset, material)
end

---@param update : CS.UnityEngine.UI.CanvasUpdate
function CS.Spine.Unity.SkeletonGraphic:Rebuild(update)
end

function CS.Spine.Unity.SkeletonGraphic:Update()
end

---@param deltaTime : CS.System.Single
function CS.Spine.Unity.SkeletonGraphic:Update(deltaTime)
end

function CS.Spine.Unity.SkeletonGraphic:LateUpdate()
end

---@return CS.UnityEngine.Mesh
function CS.Spine.Unity.SkeletonGraphic:GetLastMesh()
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonGraphic:add_UpdateLocal(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonGraphic:remove_UpdateLocal(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonGraphic:add_UpdateWorld(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonGraphic:remove_UpdateWorld(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonGraphic:add_UpdateComplete(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonGraphic:remove_UpdateComplete(value)
end

---@param value : CS.Spine.Unity.MeshGeneratorDelegate
function CS.Spine.Unity.SkeletonGraphic:add_OnPostProcessVertices(value)
end

---@param value : CS.Spine.Unity.MeshGeneratorDelegate
function CS.Spine.Unity.SkeletonGraphic:remove_OnPostProcessVertices(value)
end

function CS.Spine.Unity.SkeletonGraphic:Clear()
end

---@param overwrite : CS.System.Boolean
function CS.Spine.Unity.SkeletonGraphic:Initialize(overwrite)
end

function CS.Spine.Unity.SkeletonGraphic:UpdateMesh()
end
---@class CS.Spine.Unity.Modules.SkeletonGraphicMirror : CS.UnityEngine.MonoBehaviour
CS.Spine.Unity.Modules.SkeletonGraphicMirror = {}

---@field public CS.Spine.Unity.Modules.SkeletonGraphicMirror.source : CS.Spine.Unity.SkeletonRenderer
CS.Spine.Unity.Modules.SkeletonGraphicMirror.source = nil

---@field public CS.Spine.Unity.Modules.SkeletonGraphicMirror.mirrorOnStart : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonGraphicMirror.mirrorOnStart = nil

---@field public CS.Spine.Unity.Modules.SkeletonGraphicMirror.restoreOnDisable : CS.System.Boolean
CS.Spine.Unity.Modules.SkeletonGraphicMirror.restoreOnDisable = nil

---@return CS.Spine.Unity.Modules.SkeletonGraphicMirror
function CS.Spine.Unity.Modules.SkeletonGraphicMirror()
end

function CS.Spine.Unity.Modules.SkeletonGraphicMirror:StartMirroring()
end

---@param newOverrideTexture : CS.UnityEngine.Texture2D
function CS.Spine.Unity.Modules.SkeletonGraphicMirror:UpdateTexture(newOverrideTexture)
end

function CS.Spine.Unity.Modules.SkeletonGraphicMirror:RestoreIndependentSkeleton()
end
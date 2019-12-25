---@class CS.Spine.Unity.MecanimTranslator : CS.System.Object
CS.Spine.Unity.MecanimTranslator = {}

---@field public CS.Spine.Unity.MecanimTranslator.autoReset : CS.System.Boolean
CS.Spine.Unity.MecanimTranslator.autoReset = nil

---@field public CS.Spine.Unity.MecanimTranslator.layerMixModes : CS.MixMode[]
CS.Spine.Unity.MecanimTranslator.layerMixModes = nil

---@field public CS.Spine.Unity.MecanimTranslator.layerBlendModes : CS.Spine.MixBlend[]
CS.Spine.Unity.MecanimTranslator.layerBlendModes = nil

---@property readonly CS.Spine.Unity.MecanimTranslator.Animator : CS.UnityEngine.Animator
CS.Spine.Unity.MecanimTranslator.Animator = nil

---@return CS.Spine.Unity.MecanimTranslator
function CS.Spine.Unity.MecanimTranslator()
end

---@param animator : CS.UnityEngine.Animator
---@param skeletonDataAsset : CS.Spine.Unity.SkeletonDataAsset
function CS.Spine.Unity.MecanimTranslator:Initialize(animator, skeletonDataAsset)
end

---@param skeleton : CS.Spine.Skeleton
function CS.Spine.Unity.MecanimTranslator:Apply(skeleton)
end
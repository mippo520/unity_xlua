---@class CS.Spine.Unity.SkeletonMecanim : CS.Spine.Unity.SkeletonRenderer
CS.Spine.Unity.SkeletonMecanim = {}

---@property readonly CS.Spine.Unity.SkeletonMecanim.Translator : CS.Spine.Unity.MecanimTranslator
CS.Spine.Unity.SkeletonMecanim.Translator = nil

---@return CS.Spine.Unity.SkeletonMecanim
function CS.Spine.Unity.SkeletonMecanim()
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonMecanim:add_UpdateLocal(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonMecanim:remove_UpdateLocal(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonMecanim:add_UpdateWorld(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonMecanim:remove_UpdateWorld(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonMecanim:add_UpdateComplete(value)
end

---@param value : CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.SkeletonMecanim:remove_UpdateComplete(value)
end

---@param overwrite : CS.System.Boolean
function CS.Spine.Unity.SkeletonMecanim:Initialize(overwrite)
end

function CS.Spine.Unity.SkeletonMecanim:Update()
end
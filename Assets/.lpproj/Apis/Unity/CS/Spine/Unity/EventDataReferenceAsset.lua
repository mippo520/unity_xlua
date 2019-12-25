---@class CS.Spine.Unity.EventDataReferenceAsset : CS.UnityEngine.ScriptableObject
CS.Spine.Unity.EventDataReferenceAsset = {}

---@property readonly CS.Spine.Unity.EventDataReferenceAsset.EventData : CS.Spine.EventData
CS.Spine.Unity.EventDataReferenceAsset.EventData = nil

---@return CS.Spine.Unity.EventDataReferenceAsset
function CS.Spine.Unity.EventDataReferenceAsset()
end

function CS.Spine.Unity.EventDataReferenceAsset:Initialize()
end

---@param asset : CS.Spine.Unity.EventDataReferenceAsset
---@return CS.Spine.EventData
function CS.Spine.Unity.EventDataReferenceAsset.op_Implicit(asset)
end
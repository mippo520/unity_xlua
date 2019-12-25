---@class CS.Assets.Common.Tools.EngineExt : CS.System.Object
CS.Assets.Common.Tools.EngineExt = {}

---@field public CS.Assets.Common.Tools.EngineExt.s_DontDestroyParent : CS.UnityEngine.GameObject
CS.Assets.Common.Tools.EngineExt.s_DontDestroyParent = nil

---@return CS.Assets.Common.Tools.EngineExt
function CS.Assets.Common.Tools.EngineExt()
end

---@param ray : CS.UnityEngine.Ray
---@param hitInfo : CS.UnityEngine.RaycastHit
---@return CS.System.Boolean
function CS.Assets.Common.Tools.EngineExt.Raycast(ray, hitInfo)
end

---@param min : CS.System.Int32
---@param max : CS.System.Int32
---@return CS.System.Int32
function CS.Assets.Common.Tools.EngineExt.RandomInt(min, max)
end
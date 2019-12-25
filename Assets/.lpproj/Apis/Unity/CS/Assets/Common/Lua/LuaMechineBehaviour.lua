---@class CS.Assets.Common.Lua.LuaMechineBehaviour : CS.UnityEngine.StateMachineBehaviour
CS.Assets.Common.Lua.LuaMechineBehaviour = {}

---@field public CS.Assets.Common.Lua.LuaMechineBehaviour.luaScript : CS.System.String
CS.Assets.Common.Lua.LuaMechineBehaviour.luaScript = nil

---@return CS.Assets.Common.Lua.LuaMechineBehaviour
function CS.Assets.Common.Lua.LuaMechineBehaviour()
end

---@param animator : CS.UnityEngine.Animator
---@param stateInfo : CS.UnityEngine.AnimatorStateInfo
---@param layerIndex : CS.System.Int32
function CS.Assets.Common.Lua.LuaMechineBehaviour:OnStateEnter(animator, stateInfo, layerIndex)
end

---@param animator : CS.UnityEngine.Animator
---@param stateInfo : CS.UnityEngine.AnimatorStateInfo
---@param layerIndex : CS.System.Int32
function CS.Assets.Common.Lua.LuaMechineBehaviour:OnStateExit(animator, stateInfo, layerIndex)
end

---@param animator : CS.UnityEngine.Animator
---@param stateInfo : CS.UnityEngine.AnimatorStateInfo
---@param layerIndex : CS.System.Int32
function CS.Assets.Common.Lua.LuaMechineBehaviour:OnStateIK(animator, stateInfo, layerIndex)
end

---@param animator : CS.UnityEngine.Animator
---@param stateMachinePathHash : CS.System.Int32
function CS.Assets.Common.Lua.LuaMechineBehaviour:OnStateMachineEnter(animator, stateMachinePathHash)
end

---@param animator : CS.UnityEngine.Animator
---@param stateMachinePathHash : CS.System.Int32
function CS.Assets.Common.Lua.LuaMechineBehaviour:OnStateMachineExit(animator, stateMachinePathHash)
end

---@param animator : CS.UnityEngine.Animator
---@param stateInfo : CS.UnityEngine.AnimatorStateInfo
---@param layerIndex : CS.System.Int32
function CS.Assets.Common.Lua.LuaMechineBehaviour:OnStateMove(animator, stateInfo, layerIndex)
end

---@param animator : CS.UnityEngine.Animator
---@param stateInfo : CS.UnityEngine.AnimatorStateInfo
---@param layerIndex : CS.System.Int32
function CS.Assets.Common.Lua.LuaMechineBehaviour:OnStateUpdate(animator, stateInfo, layerIndex)
end
---@class CS.Assets.Common.Lua.LuaMachineBehaviour : CS.UnityEngine.StateMachineBehaviour
CS.Assets.Common.Lua.LuaMachineBehaviour = {}

---@field public CS.Assets.Common.Lua.LuaMachineBehaviour.luaScript : CS.System.String
CS.Assets.Common.Lua.LuaMachineBehaviour.luaScript = nil

---@return CS.Assets.Common.Lua.LuaMachineBehaviour
function CS.Assets.Common.Lua.LuaMachineBehaviour()
end

---@param animator : CS.UnityEngine.Animator
---@param stateInfo : CS.UnityEngine.AnimatorStateInfo
---@param layerIndex : CS.System.Int32
function CS.Assets.Common.Lua.LuaMachineBehaviour:OnStateEnter(animator, stateInfo, layerIndex)
end

---@param animator : CS.UnityEngine.Animator
---@param stateInfo : CS.UnityEngine.AnimatorStateInfo
---@param layerIndex : CS.System.Int32
function CS.Assets.Common.Lua.LuaMachineBehaviour:OnStateExit(animator, stateInfo, layerIndex)
end

---@param animator : CS.UnityEngine.Animator
---@param stateInfo : CS.UnityEngine.AnimatorStateInfo
---@param layerIndex : CS.System.Int32
function CS.Assets.Common.Lua.LuaMachineBehaviour:OnStateIK(animator, stateInfo, layerIndex)
end

---@param animator : CS.UnityEngine.Animator
---@param stateMachinePathHash : CS.System.Int32
function CS.Assets.Common.Lua.LuaMachineBehaviour:OnStateMachineEnter(animator, stateMachinePathHash)
end

---@param animator : CS.UnityEngine.Animator
---@param stateMachinePathHash : CS.System.Int32
function CS.Assets.Common.Lua.LuaMachineBehaviour:OnStateMachineExit(animator, stateMachinePathHash)
end

---@param animator : CS.UnityEngine.Animator
---@param stateInfo : CS.UnityEngine.AnimatorStateInfo
---@param layerIndex : CS.System.Int32
function CS.Assets.Common.Lua.LuaMachineBehaviour:OnStateMove(animator, stateInfo, layerIndex)
end

---@param animator : CS.UnityEngine.Animator
---@param stateInfo : CS.UnityEngine.AnimatorStateInfo
---@param layerIndex : CS.System.Int32
function CS.Assets.Common.Lua.LuaMachineBehaviour:OnStateUpdate(animator, stateInfo, layerIndex)
end
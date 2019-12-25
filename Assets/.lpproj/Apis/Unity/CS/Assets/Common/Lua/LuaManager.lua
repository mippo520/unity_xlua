---@class CS.Assets.Common.Lua.LuaManager : CS.Assets.Common.Singleton.GameObjSingleton
CS.Assets.Common.Lua.LuaManager = {}

---@field public CS.Assets.Common.Lua.LuaManager.s_CreateBehaviour : CS.XLua.LuaFunction
CS.Assets.Common.Lua.LuaManager.s_CreateBehaviour = nil

---@field public CS.Assets.Common.Lua.LuaManager.s_GetBehaviour : CS.XLua.LuaFunction
CS.Assets.Common.Lua.LuaManager.s_GetBehaviour = nil

---@property readonly CS.Assets.Common.Lua.LuaManager.Env : CS.XLua.LuaEnv
CS.Assets.Common.Lua.LuaManager.Env = nil

---@return CS.Assets.Common.Lua.LuaManager
function CS.Assets.Common.Lua.LuaManager()
end

---@return CS.System.Int64
function CS.Assets.Common.Lua.LuaManager:GetId()
end

---@param id : CS.System.Int64
---@param script : CS.System.String
---@return CS.XLua.LuaTable
function CS.Assets.Common.Lua.LuaManager:CreateBehaviour(id, script)
end

---@param id : CS.System.Int64
---@return CS.XLua.LuaTable
function CS.Assets.Common.Lua.LuaManager:GetBehaviour(id)
end

function CS.Assets.Common.Lua.LuaManager:startup()
end
---@class CS.Assets.Common.Lua.LuaBehaviour : CS.UnityEngine.MonoBehaviour
CS.Assets.Common.Lua.LuaBehaviour = {}

---@field public CS.Assets.Common.Lua.LuaBehaviour.luaScript : CS.System.String
CS.Assets.Common.Lua.LuaBehaviour.luaScript = nil

---@field public CS.Assets.Common.Lua.LuaBehaviour.luaBehaviour : CS.XLua.LuaTable
CS.Assets.Common.Lua.LuaBehaviour.luaBehaviour = nil

---@field public CS.Assets.Common.Lua.LuaBehaviour.listParams : CS.System.Collections.Generic.List
CS.Assets.Common.Lua.LuaBehaviour.listParams = nil

---@field public CS.Assets.Common.Lua.LuaBehaviour.listStrings : CS.System.Collections.Generic.List
CS.Assets.Common.Lua.LuaBehaviour.listStrings = nil

---@property readonly CS.Assets.Common.Lua.LuaBehaviour.id : CS.System.Int64
CS.Assets.Common.Lua.LuaBehaviour.id = nil

---@return CS.Assets.Common.Lua.LuaBehaviour
function CS.Assets.Common.Lua.LuaBehaviour()
end
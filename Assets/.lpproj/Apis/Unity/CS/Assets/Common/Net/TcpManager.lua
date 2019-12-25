---@class CS.Assets.Common.Net.TcpManager : CS.Assets.Common.Net.NetManager
CS.Assets.Common.Net.TcpManager = {}

---@return CS.Assets.Common.Net.TcpManager
function CS.Assets.Common.Net.TcpManager()
end

---@param endian : CS.Assets.Common.Net.EndianType
---@param packageLenthSize : CS.System.Int32
---@param creator : CS.Assets.Common.Net.IPackageCreator
function CS.Assets.Common.Net.TcpManager:Init(endian, packageLenthSize, creator)
end

---@param creator : CS.Assets.Common.Net.IPackageCreator
function CS.Assets.Common.Net.TcpManager:SetPackageCreator(creator)
end

---@param ip : CS.System.String
---@param port : CS.System.Int32
---@param callback : CS.System.Action
function CS.Assets.Common.Net.TcpManager:Connect(ip, port, callback)
end

function CS.Assets.Common.Net.TcpManager:Reconnect()
end
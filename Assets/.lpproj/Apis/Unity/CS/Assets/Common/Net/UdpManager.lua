---@class CS.Assets.Common.Net.UdpManager : CS.Assets.Common.Net.NetManager
CS.Assets.Common.Net.UdpManager = {}

---@return CS.Assets.Common.Net.UdpManager
function CS.Assets.Common.Net.UdpManager()
end

---@param endian : CS.Assets.Common.Net.EndianType
---@param ip : CS.System.String
---@param port : CS.System.Int32
---@param creator : CS.Assets.Common.Net.IPackageCreator
function CS.Assets.Common.Net.UdpManager:Init(endian, ip, port, creator)
end

---@param creator : CS.Assets.Common.Net.IPackageCreator
function CS.Assets.Common.Net.UdpManager:SetPackageCreator(creator)
end

---@param isPassive : CS.System.Boolean
function CS.Assets.Common.Net.UdpManager:Close(isPassive)
end
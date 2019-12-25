---@class CS.Assets.Common.Net.PackageCreator.UdpPackageCreator : CS.Assets.Common.Net.IPackageCreator
CS.Assets.Common.Net.PackageCreator.UdpPackageCreator = {}

---@property readwrite CS.Assets.Common.Net.PackageCreator.UdpPackageCreator.endPoint : CS.System.Net.EndPoint
CS.Assets.Common.Net.PackageCreator.UdpPackageCreator.endPoint = nil

---@return CS.Assets.Common.Net.PackageCreator.UdpPackageCreator
function CS.Assets.Common.Net.PackageCreator.UdpPackageCreator()
end

function CS.Assets.Common.Net.PackageCreator.UdpPackageCreator:Receive()
end

---@param data : CS.System.Byte[]
function CS.Assets.Common.Net.PackageCreator.UdpPackageCreator:Send(data)
end
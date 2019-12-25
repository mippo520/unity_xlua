---@class CS.Assets.Common.Net.IPackageCreator : CS.System.Object
CS.Assets.Common.Net.IPackageCreator = {}

---@property readwrite CS.Assets.Common.Net.IPackageCreator.endianType : CS.Assets.Common.Net.EndianType
CS.Assets.Common.Net.IPackageCreator.endianType = nil

---@property readwrite CS.Assets.Common.Net.IPackageCreator.packageLenSize : CS.System.Int32
CS.Assets.Common.Net.IPackageCreator.packageLenSize = nil

---@property readwrite CS.Assets.Common.Net.IPackageCreator.socket : CS.System.Net.Sockets.Socket
CS.Assets.Common.Net.IPackageCreator.socket = nil

---@property readwrite CS.Assets.Common.Net.IPackageCreator.manager : CS.Assets.Common.Net.INetInterface
CS.Assets.Common.Net.IPackageCreator.manager = nil

function CS.Assets.Common.Net.IPackageCreator:Receive()
end

---@param data : CS.System.Byte[]
function CS.Assets.Common.Net.IPackageCreator:Send(data)
end
---@class CS.Assets.Common.Net.INetInterface
CS.Assets.Common.Net.INetInterface = {}

---@param isPassive : CS.System.Boolean
function CS.Assets.Common.Net.INetInterface:Close(isPassive)
end

---@param creator : CS.Assets.Common.Net.IPackageCreator
function CS.Assets.Common.Net.INetInterface:SetPackageCreator(creator)
end

function CS.Assets.Common.Net.INetInterface:StartReceive()
end

function CS.Assets.Common.Net.INetInterface:ConsultFinish()
end

---@param data : CS.System.Byte[]
---@param lenth : CS.System.Int32
function CS.Assets.Common.Net.INetInterface:ReceiveCallback(data, lenth)
end
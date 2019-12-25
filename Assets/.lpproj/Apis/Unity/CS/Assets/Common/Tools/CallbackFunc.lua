---@class CS.Assets.Common.Tools.CallbackFunc : CS.System.MulticastDelegate
CS.Assets.Common.Tools.CallbackFunc = {}

---@param object : CS.System.Object
---@param method : CS.System.IntPtr
---@return CS.Assets.Common.Tools.CallbackFunc
function CS.Assets.Common.Tools.CallbackFunc(object, method)
end

---@param data : CS.System.Byte[]
function CS.Assets.Common.Tools.CallbackFunc:Invoke(data)
end

---@param data : CS.System.Byte[]
---@param callback : CS.System.AsyncCallback
---@param object : CS.System.Object
---@return CS.System.IAsyncResult
function CS.Assets.Common.Tools.CallbackFunc:BeginInvoke(data, callback, object)
end

---@param data : CS.System.Byte[]
---@param result : CS.System.IAsyncResult
function CS.Assets.Common.Tools.CallbackFunc:EndInvoke(data, result)
end
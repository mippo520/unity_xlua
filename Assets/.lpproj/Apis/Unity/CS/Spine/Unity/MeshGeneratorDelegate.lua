---@class CS.Spine.Unity.MeshGeneratorDelegate : CS.System.MulticastDelegate
CS.Spine.Unity.MeshGeneratorDelegate = {}

---@param object : CS.System.Object
---@param method : CS.System.IntPtr
---@return CS.Spine.Unity.MeshGeneratorDelegate
function CS.Spine.Unity.MeshGeneratorDelegate(object, method)
end

---@param buffers : CS.Spine.Unity.MeshGeneratorBuffers
function CS.Spine.Unity.MeshGeneratorDelegate:Invoke(buffers)
end

---@param buffers : CS.Spine.Unity.MeshGeneratorBuffers
---@param callback : CS.System.AsyncCallback
---@param object : CS.System.Object
---@return CS.System.IAsyncResult
function CS.Spine.Unity.MeshGeneratorDelegate:BeginInvoke(buffers, callback, object)
end

---@param result : CS.System.IAsyncResult
function CS.Spine.Unity.MeshGeneratorDelegate:EndInvoke(result)
end
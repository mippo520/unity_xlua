---@class CS.Spine.Unity.UpdateBonesDelegate : CS.System.MulticastDelegate
CS.Spine.Unity.UpdateBonesDelegate = {}

---@param object : CS.System.Object
---@param method : CS.System.IntPtr
---@return CS.Spine.Unity.UpdateBonesDelegate
function CS.Spine.Unity.UpdateBonesDelegate(object, method)
end

---@param animated : CS.Spine.Unity.ISkeletonAnimation
function CS.Spine.Unity.UpdateBonesDelegate:Invoke(animated)
end

---@param animated : CS.Spine.Unity.ISkeletonAnimation
---@param callback : CS.System.AsyncCallback
---@param object : CS.System.Object
---@return CS.System.IAsyncResult
function CS.Spine.Unity.UpdateBonesDelegate:BeginInvoke(animated, callback, object)
end

---@param result : CS.System.IAsyncResult
function CS.Spine.Unity.UpdateBonesDelegate:EndInvoke(result)
end
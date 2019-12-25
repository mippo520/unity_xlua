---@class CS.Spine.Unity.SkeletonUtilityDelegate : CS.System.MulticastDelegate
CS.Spine.Unity.SkeletonUtilityDelegate = {}

---@param object : CS.System.Object
---@param method : CS.System.IntPtr
---@return CS.Spine.Unity.SkeletonUtilityDelegate
function CS.Spine.Unity.SkeletonUtilityDelegate(object, method)
end

function CS.Spine.Unity.SkeletonUtilityDelegate:Invoke()
end

---@param callback : CS.System.AsyncCallback
---@param object : CS.System.Object
---@return CS.System.IAsyncResult
function CS.Spine.Unity.SkeletonUtilityDelegate:BeginInvoke(callback, object)
end

---@param result : CS.System.IAsyncResult
function CS.Spine.Unity.SkeletonUtilityDelegate:EndInvoke(result)
end
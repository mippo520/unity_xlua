---@class CS.Spine.Unity.SkeletonRendererDelegate : CS.System.MulticastDelegate
CS.Spine.Unity.SkeletonRendererDelegate = {}

---@param object : CS.System.Object
---@param method : CS.System.IntPtr
---@return CS.Spine.Unity.SkeletonRendererDelegate
function CS.Spine.Unity.SkeletonRendererDelegate(object, method)
end

---@param skeletonRenderer : CS.Spine.Unity.SkeletonRenderer
function CS.Spine.Unity.SkeletonRendererDelegate:Invoke(skeletonRenderer)
end

---@param skeletonRenderer : CS.Spine.Unity.SkeletonRenderer
---@param callback : CS.System.AsyncCallback
---@param object : CS.System.Object
---@return CS.System.IAsyncResult
function CS.Spine.Unity.SkeletonRendererDelegate:BeginInvoke(skeletonRenderer, callback, object)
end

---@param result : CS.System.IAsyncResult
function CS.Spine.Unity.SkeletonRendererDelegate:EndInvoke(result)
end
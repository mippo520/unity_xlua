---@class CS.Spine.Unity.Playables.SpineEventDelegate : CS.System.MulticastDelegate
CS.Spine.Unity.Playables.SpineEventDelegate = {}

---@param object : CS.System.Object
---@param method : CS.System.IntPtr
---@return CS.Spine.Unity.Playables.SpineEventDelegate
function CS.Spine.Unity.Playables.SpineEventDelegate(object, method)
end

---@param e : CS.Spine.Event
function CS.Spine.Unity.Playables.SpineEventDelegate:Invoke(e)
end

---@param e : CS.Spine.Event
---@param callback : CS.System.AsyncCallback
---@param object : CS.System.Object
---@return CS.System.IAsyncResult
function CS.Spine.Unity.Playables.SpineEventDelegate:BeginInvoke(e, callback, object)
end

---@param result : CS.System.IAsyncResult
function CS.Spine.Unity.Playables.SpineEventDelegate:EndInvoke(result)
end
---@class CS.Spine.TrackEntryEventDelegate : CS.System.MulticastDelegate
CS.Spine.TrackEntryEventDelegate = {}

---@param object : CS.System.Object
---@param method : CS.System.IntPtr
---@return CS.Spine.TrackEntryEventDelegate
function CS.Spine.TrackEntryEventDelegate(object, method)
end

---@param trackEntry : CS.Spine.TrackEntry
---@param e : CS.Spine.Event
function CS.Spine.TrackEntryEventDelegate:Invoke(trackEntry, e)
end

---@param trackEntry : CS.Spine.TrackEntry
---@param e : CS.Spine.Event
---@param callback : CS.System.AsyncCallback
---@param object : CS.System.Object
---@return CS.System.IAsyncResult
function CS.Spine.TrackEntryEventDelegate:BeginInvoke(trackEntry, e, callback, object)
end

---@param result : CS.System.IAsyncResult
function CS.Spine.TrackEntryEventDelegate:EndInvoke(result)
end
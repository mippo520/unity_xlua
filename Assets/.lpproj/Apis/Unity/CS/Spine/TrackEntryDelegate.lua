---@class CS.Spine.TrackEntryDelegate : CS.System.MulticastDelegate
CS.Spine.TrackEntryDelegate = {}

---@param object : CS.System.Object
---@param method : CS.System.IntPtr
---@return CS.Spine.TrackEntryDelegate
function CS.Spine.TrackEntryDelegate(object, method)
end

---@param trackEntry : CS.Spine.TrackEntry
function CS.Spine.TrackEntryDelegate:Invoke(trackEntry)
end

---@param trackEntry : CS.Spine.TrackEntry
---@param callback : CS.System.AsyncCallback
---@param object : CS.System.Object
---@return CS.System.IAsyncResult
function CS.Spine.TrackEntryDelegate:BeginInvoke(trackEntry, callback, object)
end

---@param result : CS.System.IAsyncResult
function CS.Spine.TrackEntryDelegate:EndInvoke(result)
end
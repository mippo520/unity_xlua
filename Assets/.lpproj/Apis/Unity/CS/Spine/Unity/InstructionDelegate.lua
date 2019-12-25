---@class CS.Spine.Unity.InstructionDelegate : CS.System.MulticastDelegate
CS.Spine.Unity.InstructionDelegate = {}

---@param object : CS.System.Object
---@param method : CS.System.IntPtr
---@return CS.Spine.Unity.InstructionDelegate
function CS.Spine.Unity.InstructionDelegate(object, method)
end

---@param instruction : CS.Spine.Unity.SkeletonRendererInstruction
function CS.Spine.Unity.InstructionDelegate:Invoke(instruction)
end

---@param instruction : CS.Spine.Unity.SkeletonRendererInstruction
---@param callback : CS.System.AsyncCallback
---@param object : CS.System.Object
---@return CS.System.IAsyncResult
function CS.Spine.Unity.InstructionDelegate:BeginInvoke(instruction, callback, object)
end

---@param result : CS.System.IAsyncResult
function CS.Spine.Unity.InstructionDelegate:EndInvoke(result)
end
---@class CS.Spine.Unity.MeshRendererBuffers : CS.System.Object
CS.Spine.Unity.MeshRendererBuffers = {}

---@return CS.Spine.Unity.MeshRendererBuffers
function CS.Spine.Unity.MeshRendererBuffers()
end

function CS.Spine.Unity.MeshRendererBuffers:Initialize()
end

---@return CS.UnityEngine.Material[]
function CS.Spine.Unity.MeshRendererBuffers:GetUpdatedSharedMaterialsArray()
end

---@return CS.System.Boolean
function CS.Spine.Unity.MeshRendererBuffers:MaterialsChangedInLastUpdate()
end

---@param instructions : CS.Spine.ExposedList
function CS.Spine.Unity.MeshRendererBuffers:UpdateSharedMaterials(instructions)
end

---@return CS.Spine.Unity.SmartMesh
function CS.Spine.Unity.MeshRendererBuffers:GetNextMesh()
end

function CS.Spine.Unity.MeshRendererBuffers:Clear()
end

function CS.Spine.Unity.MeshRendererBuffers:Dispose()
end
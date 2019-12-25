---@class CS.Spine.Unity.MeshGenerator : CS.System.Object
CS.Spine.Unity.MeshGenerator = {}

---@field public CS.Spine.Unity.MeshGenerator.settings : CS.Spine.Unity.Settings
CS.Spine.Unity.MeshGenerator.settings = nil

---@property readonly CS.Spine.Unity.MeshGenerator.VertexCount : CS.System.Int32
CS.Spine.Unity.MeshGenerator.VertexCount = nil

---@property readonly CS.Spine.Unity.MeshGenerator.Buffers : CS.Spine.Unity.MeshGeneratorBuffers
CS.Spine.Unity.MeshGenerator.Buffers = nil

---@return CS.Spine.Unity.MeshGenerator
function CS.Spine.Unity.MeshGenerator()
end

---@param instructionOutput : CS.Spine.Unity.SkeletonRendererInstruction
---@param skeleton : CS.Spine.Skeleton
---@param material : CS.UnityEngine.Material
function CS.Spine.Unity.MeshGenerator.GenerateSingleSubmeshInstruction(instructionOutput, skeleton, material)
end

---@param instructionOutput : CS.Spine.Unity.SkeletonRendererInstruction
---@param skeleton : CS.Spine.Skeleton
---@param customSlotMaterials : CS.System.Collections.Generic.Dictionary
---@param separatorSlots : CS.System.Collections.Generic.List
---@param generateMeshOverride : CS.System.Boolean
---@param immutableTriangles : CS.System.Boolean
function CS.Spine.Unity.MeshGenerator.GenerateSkeletonRendererInstruction(instructionOutput, skeleton, customSlotMaterials, separatorSlots, generateMeshOverride, immutableTriangles)
end

---@param workingSubmeshInstructions : CS.Spine.ExposedList
---@param customMaterialOverride : CS.System.Collections.Generic.Dictionary
function CS.Spine.Unity.MeshGenerator.TryReplaceMaterials(workingSubmeshInstructions, customMaterialOverride)
end

function CS.Spine.Unity.MeshGenerator:Begin()
end

---@param instruction : CS.Spine.Unity.SubmeshInstruction
---@param updateTriangles : CS.System.Boolean
function CS.Spine.Unity.MeshGenerator:AddSubmesh(instruction, updateTriangles)
end

---@param instruction : CS.Spine.Unity.SkeletonRendererInstruction
---@param updateTriangles : CS.System.Boolean
function CS.Spine.Unity.MeshGenerator:BuildMesh(instruction, updateTriangles)
end

---@param instruction : CS.Spine.Unity.SkeletonRendererInstruction
---@param updateTriangles : CS.System.Boolean
function CS.Spine.Unity.MeshGenerator:BuildMeshWithArrays(instruction, updateTriangles)
end

---@param scale : CS.System.Single
function CS.Spine.Unity.MeshGenerator:ScaleVertexData(scale)
end

---@param mesh : CS.UnityEngine.Mesh
function CS.Spine.Unity.MeshGenerator:FillVertexData(mesh)
end

---@param mesh : CS.UnityEngine.Mesh
function CS.Spine.Unity.MeshGenerator:FillLateVertexData(mesh)
end

---@param mesh : CS.UnityEngine.Mesh
function CS.Spine.Unity.MeshGenerator:FillTriangles(mesh)
end

---@param mesh : CS.UnityEngine.Mesh
function CS.Spine.Unity.MeshGenerator:FillTrianglesSingle(mesh)
end

---@param minimumVertexCount : CS.System.Int32
---@param inlcudeTintBlack : CS.System.Boolean
---@param includeTangents : CS.System.Boolean
---@param includeNormals : CS.System.Boolean
function CS.Spine.Unity.MeshGenerator:EnsureVertexCapacity(minimumVertexCount, inlcudeTintBlack, includeTangents, includeNormals)
end

function CS.Spine.Unity.MeshGenerator:TrimExcess()
end

---@param mesh : CS.UnityEngine.Mesh
---@param regionAttachment : CS.Spine.RegionAttachment
function CS.Spine.Unity.MeshGenerator.FillMeshLocal(mesh, regionAttachment)
end

---@param mesh : CS.UnityEngine.Mesh
---@param meshAttachment : CS.Spine.MeshAttachment
---@param skeletonData : CS.Spine.SkeletonData
function CS.Spine.Unity.MeshGenerator.FillMeshLocal(mesh, meshAttachment, skeletonData)
end
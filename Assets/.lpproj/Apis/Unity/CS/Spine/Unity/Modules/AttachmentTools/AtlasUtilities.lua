---@class CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities : CS.System.Object
CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities = {}

---@param t : CS.UnityEngine.Texture2D
---@param materialPropertySource : CS.UnityEngine.Material
---@param scale : CS.System.Single
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToAtlasRegion(t, materialPropertySource, scale)
end

---@param t : CS.UnityEngine.Texture2D
---@param shader : CS.UnityEngine.Shader
---@param scale : CS.System.Single
---@param materialPropertySource : CS.UnityEngine.Material
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToAtlasRegion(t, shader, scale, materialPropertySource)
end

---@param t : CS.UnityEngine.Texture2D
---@param materialPropertySource : CS.UnityEngine.Material
---@param textureFormat : CS.UnityEngine.TextureFormat
---@param mipmaps : CS.System.Boolean
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToAtlasRegionPMAClone(t, materialPropertySource, textureFormat, mipmaps)
end

---@param t : CS.UnityEngine.Texture2D
---@param shader : CS.UnityEngine.Shader
---@param textureFormat : CS.UnityEngine.TextureFormat
---@param mipmaps : CS.System.Boolean
---@param materialPropertySource : CS.UnityEngine.Material
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToAtlasRegionPMAClone(t, shader, textureFormat, mipmaps, materialPropertySource)
end

---@param m : CS.UnityEngine.Material
---@return CS.Spine.AtlasPage
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToSpineAtlasPage(m)
end

---@param s : CS.UnityEngine.Sprite
---@param page : CS.Spine.AtlasPage
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToAtlasRegion(s, page)
end

---@param s : CS.UnityEngine.Sprite
---@param material : CS.UnityEngine.Material
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToAtlasRegion(s, material)
end

---@param s : CS.UnityEngine.Sprite
---@param materialPropertySource : CS.UnityEngine.Material
---@param textureFormat : CS.UnityEngine.TextureFormat
---@param mipmaps : CS.System.Boolean
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToAtlasRegionPMAClone(s, materialPropertySource, textureFormat, mipmaps)
end

---@param s : CS.UnityEngine.Sprite
---@param shader : CS.UnityEngine.Shader
---@param textureFormat : CS.UnityEngine.TextureFormat
---@param mipmaps : CS.System.Boolean
---@param materialPropertySource : CS.UnityEngine.Material
---@return CS.Spine.AtlasRegion
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToAtlasRegionPMAClone(s, shader, textureFormat, mipmaps, materialPropertySource)
end

---@param sourceAttachments : CS.System.Collections.Generic.List
---@param outputAttachments : CS.System.Collections.Generic.List
---@param materialPropertySource : CS.UnityEngine.Material
---@param outputMaterial : CS.UnityEngine.Material
---@param outputTexture : CS.UnityEngine.Texture2D
---@param maxAtlasSize : CS.System.Int32
---@param padding : CS.System.Int32
---@param textureFormat : CS.UnityEngine.TextureFormat
---@param mipmaps : CS.System.Boolean
---@param newAssetName : CS.System.String
---@param clearCache : CS.System.Boolean
---@param useOriginalNonrenderables : CS.System.Boolean
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.GetRepackedAttachments(sourceAttachments, outputAttachments, materialPropertySource, outputMaterial, outputTexture, maxAtlasSize, padding, textureFormat, mipmaps, newAssetName, clearCache, useOriginalNonrenderables)
end

---@param o : CS.Spine.Skin
---@param newName : CS.System.String
---@param materialPropertySource : CS.UnityEngine.Material
---@param outputMaterial : CS.UnityEngine.Material
---@param outputTexture : CS.UnityEngine.Texture2D
---@param maxAtlasSize : CS.System.Int32
---@param padding : CS.System.Int32
---@param textureFormat : CS.UnityEngine.TextureFormat
---@param mipmaps : CS.System.Boolean
---@param useOriginalNonrenderables : CS.System.Boolean
---@return CS.Spine.Skin
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.GetRepackedSkin(o, newName, materialPropertySource, outputMaterial, outputTexture, maxAtlasSize, padding, textureFormat, mipmaps, useOriginalNonrenderables)
end

---@param o : CS.Spine.Skin
---@param newName : CS.System.String
---@param shader : CS.UnityEngine.Shader
---@param outputMaterial : CS.UnityEngine.Material
---@param outputTexture : CS.UnityEngine.Texture2D
---@param maxAtlasSize : CS.System.Int32
---@param padding : CS.System.Int32
---@param textureFormat : CS.UnityEngine.TextureFormat
---@param mipmaps : CS.System.Boolean
---@param materialPropertySource : CS.UnityEngine.Material
---@param clearCache : CS.System.Boolean
---@param useOriginalNonrenderables : CS.System.Boolean
---@return CS.Spine.Skin
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.GetRepackedSkin(o, newName, shader, outputMaterial, outputTexture, maxAtlasSize, padding, textureFormat, mipmaps, materialPropertySource, clearCache, useOriginalNonrenderables)
end

---@param ar : CS.Spine.AtlasRegion
---@param pixelsPerUnit : CS.System.Single
---@return CS.UnityEngine.Sprite
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToSprite(ar, pixelsPerUnit)
end

function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ClearCache()
end

---@param ar : CS.Spine.AtlasRegion
---@param textureFormat : CS.UnityEngine.TextureFormat
---@param mipmaps : CS.System.Boolean
---@return CS.UnityEngine.Texture2D
function CS.Spine.Unity.Modules.AttachmentTools.AtlasUtilities.ToTexture(ar, textureFormat, mipmaps)
end
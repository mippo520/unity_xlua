---@class CS.Spine.Atlas : CS.System.Object
CS.Spine.Atlas = {}

---@param reader : CS.System.IO.TextReader
---@param dir : CS.System.String
---@param textureLoader : CS.Spine.TextureLoader
---@return CS.Spine.Atlas
function CS.Spine.Atlas(reader, dir, textureLoader)
end

---@param pages : CS.System.Collections.Generic.List
---@param regions : CS.System.Collections.Generic.List
---@return CS.Spine.Atlas
function CS.Spine.Atlas(pages, regions)
end

---@return CS.System.Collections.Generic.IEnumerator
function CS.Spine.Atlas:GetEnumerator()
end

function CS.Spine.Atlas:FlipV()
end

---@param name : CS.System.String
---@return CS.Spine.AtlasRegion
function CS.Spine.Atlas:FindRegion(name)
end

function CS.Spine.Atlas:Dispose()
end
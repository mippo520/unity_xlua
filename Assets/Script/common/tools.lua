
local Tools = {}

function Tools.Hash(data)
    local len = string.len(data)
    local hash = 1315423911
    for i = 1, len do
        local c = string.byte( data, i )
        local d = (hash << 5) & 0xffffffff
        local e = (d + c + (hash >> 2)) & 0xffffffff
        hash = (hash ~ e) & 0xffffffff
    end
    return hash
end

function Tools.Sign(...)
    local args = {...}
    local content = ""
    for i, v in ipairs(args) do
        content = content .. tostring(v)
    end
    content = content .. "vgcli"
    return FileManager.md5(content)
end

function Tools.Assert(obj, message)
    if not obj then
        Info.Error("Tools Assert! " .. message)
        assert(false)
    end
end

function Tools.IsNumberEqual(n1, n2, decimals)
    local num = 0
    if "number" == type(decimals) then
        num = 10 ^ -math.floor(decimals)
    else
        num = 0.000001
    end
    local n = n1 - n2
    if n < num and n > -num then
        return true
    else
        return false
    end
end

function Tools.SetVisible(canvasGrp,value)
	canvasGrp.alpha = value and 1 or 0
	canvasGrp.interactable = value
	canvasGrp.blocksRaycasts = value
end

return Tools

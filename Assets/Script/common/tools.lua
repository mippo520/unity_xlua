
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
    end
end

function Tools.IsNumberEqual(n1, n2)
    local n = n1 - n2
    if n < 0.00001 and n > -0.00001 then
        return true
    else
        return false
    end
end

return Tools

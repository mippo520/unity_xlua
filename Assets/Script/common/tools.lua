
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

return Tools

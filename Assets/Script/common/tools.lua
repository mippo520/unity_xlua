
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

return Tools

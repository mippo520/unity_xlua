local AStarTest = class("AStarTest", DialogBehaviour)
local CSAStar = CS.Assets.AStar
local AStarInst = CSAStar.AStar.GetInstance()

function AStarTest:_awake()
    local map = {}
    for i = 0, 99 do
        local x = i % 10
        local y = math.floor(i / 10)
        local grid = CSAStar.AStarGrid()
        local pos = CSAStar.AStarPos(x, y)
        grid.pos = pos
        if y >= #map then
            table.insert(map, {})
        end
        table.insert(map[y+1], grid)
    end
    AStarInst:createMap(map)
    local path = AStarInst:search(CSAStar.AStarPos(1, 3), CSAStar.AStarPos(5, 6))
    local log = "path is "
    for k, v in pairs(path) do
        log = log .. string.format( "[%d,%d]", v.x, v.y )
    end
    Info.Debug(log)
end

return AStarTest
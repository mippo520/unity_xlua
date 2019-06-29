local Timer = require("common.time.timer")
local TimeManager = class("TimeManager")

local sInstance = nil

function TimeManager.GetInstance()
    if nil == sInstance then
        sInstance = TimeManager.new()
    end
    return sInstance
end

function TimeManager:ctor()
    self.mapIdTimer = {}
    self.arrId = {}
    self.id = 0
end


function TimeManager:init()
    self.currentTime = Time.now()
end

function TimeManager:update()
    local curTime = Time.now()
    local dt = curTime - self.currentTime
    EventManager.GetInstance():fireEvent(Event.FrameUpdate, dt)
    self.currentTime = curTime
    while #self.arrId > 0 do
        local id = self.arrId[1]
        local timer = self.mapIdTimer[id]
        if timer:getTime() <= self.currentTime then
            timer:call()
            if self.arrId[1] == id then
                table.remove(self.arrId, 1)
            end
            self.mapIdTimer[id] = nil
        else
            break
        end
    end
end

function TimeManager:now()
    return self.currentTime
end

function TimeManager:registTimer(time, obj, func)
    local bInsert = false
    for idx, id in ipairs(self.arrId) do
        local timer = self.mapIdTimer[id]
        if timer then
            if timer:getTime() > time then
                self.id = self.id + 1
                table.insert(self.arrId, idx, self.id)
                local newTimer = Timer.new(self.id, time, obj, func)
                self.mapIdTimer[self.id] = newTimer
                bInsert = true
                break
            elseif timer:getTime() == time and timer:getObj() == obj then
                Info.Error("TimeManager:registTimer error! Already regist the timer!")
                return
            end
        end
    end

    if not bInsert then
        self.id = self.id + 1
        table.insert(self.arrId, self.id)
        local newTimer = Timer.new(self.id, time, obj, func)
        self.mapIdTimer[self.id] = newTimer
    end
    return self.id
end

function TimeManager:unregistTimer(id)
    if self.mapIdTimer[id] then
        self.mapIdTimer[id] = nil
    end

    for i, v in ipairs(self.arrId) do
        if v == id then
            table.remove(self.arrId, i)
            break
        end
    end
end

return TimeManager

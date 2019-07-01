local Timer = require("common.time.timer")
local TimeManager = class("TimeManager")

local sInstance = nil

function _addTimer(self, timer)
    if not timer then
        Info.Error("_addTimer error! timer is null")
        return
    end

    if self.mapIdTimer[timer._id] then
        Info.Error("_addTimer error! timer is exist! id is " .. timer._id)
        return
    end

    local bInsert = false
    for idx, id in ipairs(self.arrId) do
        local timerTmp = self.mapIdTimer[id]
        if timerTmp and timerTmp._time >= timer._time then
            table.insert(self.arrId, idx, timer._id)
            bInsert = true
            break
        end
    end        
    if not bInsert then
        table.insert(self.arrId, timer._id)
    end
    self.mapIdTimer[timer._id] = timer
end

function _modifyTimer(self, time, obj, func, interval, count)
    local bInsert = false
    for idx, id in ipairs(self.arrId) do
        local timer = self.mapIdTimer[id]
        if timer then
            if timer._time > time then
                self.id = self.id + 1
                table.insert(self.arrId, idx, self.id)
                local newTimer = Timer.new(self.id, time, obj, func, interval, count)
                self.mapIdTimer[self.id] = newTimer
                bInsert = true
                break
            elseif timer._time == time and timer._obj == obj and timer._func == func then
                Info.Error("TimeManager:registTimer error! Already regist the timer!")
                return
            end
        end
    end

    if not bInsert then
        self.id = self.id + 1
        table.insert(self.arrId, self.id)
        local newTimer = Timer.new(self.id, time, obj, func, interval, count)
        self.mapIdTimer[self.id] = newTimer
    end
    return self.id
end

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
    self.arrInsertTimer = {}
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
        if timer._time <= self.currentTime then
            timer:call()
            if self.arrId[1] == id then
                table.remove(self.arrId, 1)
                if timer:updateTime() then
                    table.insert(self.arrInsertTimer, timer)
                end
            end
            self.mapIdTimer[id] = nil
        else
            break
        end
    end

    for _, timer in ipairs(self.arrInsertTimer) do
        _addTimer(self, timer)
    end
    self.arrInsertTimer = {}
end

function TimeManager:now()
    return self.currentTime
end

function TimeManager:onceTimer(interval, obj, func)
    local time = self:now() + interval
    return _modifyTimer(self, time, obj, func, 0, 0)
end

function TimeManager:loopTimer(firstInterval, interval, obj, func, count)
    local time = self:now() + firstInterval
    return _modifyTimer(self, time, obj, func, interval, count)
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

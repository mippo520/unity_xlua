local Timer = require("common.time.timer")
local TimeManager = class("TimeManager")

local function _addTimer(self, timer)
    if not timer then
        Info.Error("_addTimer error! timer is null")
        return
    end

    local bInsert = false
    for idx, timerTmp in ipairs(self.arrTimer) do
        if timerTmp._time >= timer._time then
            table.insert(self.arrTimer, idx, timer)
            bInsert = true
            break
        end
    end        
    if not bInsert then
        table.insert(self.arrTimer, timer)
    end
end

local function _modifyTimer(self, time, obj, func, interval, count, ...)
    local bInsert = false
    for idx, timer in ipairs(self.arrTimer) do
        if timer._time > time then
            self.id = self.id + 1
            local newTimer = Timer.new(self.id, time, obj, func, interval, count, ...)
            table.insert(self.arrTimer, idx, newTimer)
            bInsert = true
            break
        elseif timer._time == time and timer._obj == obj and timer._func == func then
            Info.Error("TimeManager:registTimer error! Already regist the timer!")
            return
        end
    end

    if not bInsert then
        self.id = self.id + 1
        local newTimer = Timer.new(self.id, time, obj, func, interval, count, ...)
        table.insert(self.arrTimer, newTimer)
    end
    return self.id
end

function TimeManager:ctor()
    self.arrTimer = {}
    self.id = 0
    self.arrInsertTimer = {}
	self.serverTime = nil
    self.offset = 0 -- 时区
	self.tagServerTime = {}
end


function TimeManager:init()
    self.currentTime = Time.now()       -- 本地时间
    self.serverTime = self.currentTime  -- 服务器时间
end

function TimeManager:setServerTime(time, offset, tag)
	if not tag then
		self.serverTime = time
		self.offset = offset
	else
		local timeInfo = self.tagServerTime[tag]
		if not timeInfo then
			timeInfo = {}
			self.tagServerTime[tag] = timeInfo
		end
		timeInfo.time = time
		timeInfo.offset = offset
	end
end

function TimeManager:update()
    local curTime = Time.now()
    local dt = curTime - self.currentTime
    EventManagerInst:fireEvent(Event.FrameUpdate, dt)
    self.currentTime = curTime
    self.serverTime = self.serverTime + dt
	for _, timeInfo in pairs(self.tagServerTime) do
		timeInfo.time = timeInfo.time + dt
	end
    while #self.arrTimer > 0 do
        local timer = self.arrTimer[1]
        if timer._time <= self.currentTime then
            timer:call()
            if #self.arrTimer > 0 and self.arrTimer[1]._id == timer._id then
                table.remove(self.arrTimer, 1)
                if timer:updateTime() then
                    table.insert(self.arrInsertTimer, timer)
                end
            end
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
    return self.serverTime, self.offset
end

function TimeManager:serverTime(tag)
	return self.tagServerTime[tag]
end

function TimeManager:onceTimer(interval, obj, func, ...)
    if interval < 0 then
        interval = 0
    end
    local time = self.currentTime + interval
    return _modifyTimer(self, time, obj, func, 0, 0, ...)
end

function TimeManager:loopTimer(firstInterval, interval, obj, func, count, ...)
    if interval <= 0 then
        Info.Error("TimeManager:loopTimer error! interval = " .. interval)
        return
    end
    if firstInterval < 0 then
        firstInterval = 0
    end

    local time = self.currentTime + firstInterval
    return _modifyTimer(self, time, obj, func, interval, count, ...)
end


function TimeManager:stopTimer(id)
    local bRet = false

    for i, timer in ipairs(self.arrTimer) do
        if timer._id == id then
            table.remove(self.arrTimer, i)
            bRet = true
            break
        end
    end
    return bRet
end

if not _TimeManagerInst then
    _TimeManagerInst = TimeManager.new()
end
return _TimeManagerInst

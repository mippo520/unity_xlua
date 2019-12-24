local scene = require("scene.scene")
local update = class("update", scene)
local HotUpdateRes = CSCommon.Resource.HotUpdateRes

local function _updateComplete(self)
    UnitySceneManager.LoadSceneAsync(SceneType.Load)
end

local function _updateSpeed(self)
	if 0 == percent or 0 == timeOffset then
		self.speed.text = ""
	else
		local timeOffset = Now() - self.beginTime
		local curSize = self.totalSize * self.slider.value * 1000 / timeOffset
		if curSize < 1000 then
			self.speed.text = string.format("%.02f", curSize) .. "B/S"
		else
			curSize = curSize / 1024
			if curSize < 1000 then
				self.speed.text = string.format("%.02f", curSize) .. "KB/S"
			else
				curSize = curSize / 1024
				self.speed.text = string.format("%.02f", curSize) .. "M/S"
			end
		end
	end
end

local function _beginDownload(self)
    self.beginTime = Now()
    self.canvasGroup.alpha = 1

    ResourcesManagerInst:Hotupdate(function (res, totalSize, msg)
        if HotUpdateRes.Complete == res then
            Version:set(msg)
            self.slider.value = 1
            self.percent.text = "100%"
            self.speed.text = ""
            self:onceTimer(500, function ()
				self.canvasGroup.alpha = 0
				DialogManagerInst:open(DialogType.UpdateTips, nil, function ()
						Progress:restart()
					end, "update_finish")
            end)
			if self.speedTimer > 0 then
				TimeManagerInst:stopTimer(self.speedTimer)
				self.speedTimer = 0
			end
        else
			self.canvasGroup.alpha = 0
			DialogManagerInst:open(DialogType.UpdateTips, nil, function ()
					Progress:restart()
				end, "update_error")
        	Info.Error("hot update download error! " .. msg);
        end
    end, function (percent)
        Info.Debug("download complete percent is " .. tostring(percent))
        self.slider.value = percent
        self.percent.text = string.format("%.02f", percent * 100) .. "%"
    end, HttpResponseWaitTime / 1000)
	
	self.speedTimer = self:loopTimer(100, 1000, _updateSpeed, "forever")
end

function update:_awake()
	scene._awake(self)
	self.name = "update"
    self.totalSize = 0
    self.beginTime = 0
	self.connectTimer = 0
	self.speedTimer = 0
end

function update:_start()
    ResourcesManagerInst:LoadAssetBundleAsync({"config/language"}, nil, function (arrRes)
        LanguageManagerInst:init()

        if not NeedHotUpdate then
            Version:set("0.0.0")
            _updateComplete(self)
            return
        end
        ResourcesManagerInst:CompareUpdateFile(function (res, totalSize, msg)
            if HotUpdateRes.Complete == res then
                Version:set(msg)
                _updateComplete(self)
            elseif HotUpdateRes.Begin == res then
                local size = totalSize / 1024
                local unit = "M"
                if size < 1000 then
                    unit = "K"
                else
                    size = size / 1024
                end
                DialogManagerInst:open(DialogType.UpdateTips, nil, handler(self, _beginDownload), "check_download", size, unit)
                self.totalSize = totalSize
            else
                DialogManagerInst:open(DialogType.UpdateTips, nil, function ()
                    Progress:restart()
                end, "update_error")
            end
			if self.connectTimer > 0 then
				TimeManagerInst:stopTimer(self.connectTimer)
				self.connectTimer = 0
			else
				self.connectCG.alpha = 0
			end
        end, HttpResponseWaitTime / 1000)
			
		self.connectTimer = self:onceTimer(500, function ()
				self.connectTimer = 0
				self.connectCG.alpha = 1
			end)
    end)
	
end

return update

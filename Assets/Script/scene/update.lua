local update = class("update", Behaviour)
local HotUpdateRes = CS.Assets.Common.Resource.HotUpdateRes

local function _updateComplete(self)
    UnitySceneManager.LoadSceneAsync(SceneType.Load)
end

local function _beginDownload(self)
    self.beginTime = Now()
    self.canvasGroup.alpha = 1
    self.canvasGroup.interactable = true
    self.canvasGroup.blocksRaycasts = true

    ResourcesManagerInst:Hotupdate(function (res, totalSize, err)
        if HotUpdateRes.Complete == res then
            self.slider.value = 1
            self.percentText.text = "100%"
            self.speedText.text = ""
            TimeManagerInst:onceTimer(800, self, function ()
                Progress.restart()
            end)
        else
            Info.Error("hot update download error! " .. err);
        end
    end, function (percent)
        Info.Debug("download complete percent is " .. tostring(percent))
        self.slider.value = percent
        self.percentText.text = string.format("%.02f", percent * 100) .. "%"
        local timeOffset = Now() - self.beginTime
        if 0 == percent or 0 == timeOffset then
            self.speedText.text = ""
        else
            local curSize = self.totalSize * percent * 1000 / timeOffset
            if curSize < 1000 then
                self.speedText.text = string.format("%.02f", curSize) .. "B/S"
            else
                curSize = curSize / 1024
                if curSize < 1000 then
                    self.speedText.text = string.format("%.02f", curSize) .. "KB/S"
                else
                    curSize = curSize / 1024
                    self.speedText.text = string.format("%.02f", curSize) .. "M/S"
                end
            end    
        end
    end)
end

function update:_awake()
    self:registEvent(Event.HotUpdateBeginDownload, handler(self, _beginDownload))
    self.slider = self.gameObject.transform:GetChild(0):GetComponent(typeof(UnityUI.Slider))
    self.percentText = self.gameObject.transform:GetChild(1):GetComponent(typeof(UnityUI.Text))
    self.speedText = self.gameObject.transform:GetChild(2):GetComponent(typeof(UnityUI.Text))
    self.canvasGroup = self.gameObject:GetComponent(typeof(Unity.CanvasGroup))
    self.totalSize = 0
    self.beginTime = 0
end

function update:_start()
    ResourcesManagerInst:CompareUpdateFile(function (res, totalSize, err)
        if HotUpdateRes.Complete == res then
            _updateComplete(self)
        elseif HotUpdateRes.Begin == res then
            local size = totalSize / 1024
            local unit = "M"
            if size < 1000 then
                unit = "K"
            else
                size = size / 1024
            end
            DialogManagerInst:open(DialogType.Tips, function ()
                EventManagerInst:fireEvent(Event.HotUpdateBeginDownload)   
            end, "check_download", size, unit)
            self.totalSize = totalSize
        else
            Info.Error("CompareUpdateFile error! " .. err);
        end
    end)
end

return update

local update = class("update", Behaviour)
local HotUpdateRes = CSCommon.Resource.HotUpdateRes

local function _updateComplete(self)
    UnitySceneManager.LoadSceneAsync(SceneType.Load)
end

local function _beginDownload(self)
    self.beginTime = Now()
    self.canvasGroup.alpha = 1
    self.canvasGroup.interactable = true
    self.canvasGroup.blocksRaycasts = true

    ResourcesManagerInst:Hotupdate(function (res, totalSize, msg)
        if HotUpdateRes.Complete == res then
            Version:set(msg)
            self.slider.value = 1
            self.percent.text = "100%"
            self.speed.text = ""
            TimeManagerInst:onceTimer(800, self, function ()
                Progress:restart()
            end)
        else
            Info.Error("hot update download error! " .. msg);
        end
    end, function (percent)
        Info.Debug("download complete percent is " .. tostring(percent))
        self.slider.value = percent
        self.percent.text = string.format("%.02f", percent * 100) .. "%"
        local timeOffset = Now() - self.beginTime
        if 0 == percent or 0 == timeOffset then
            self.speed.text = ""
        else
            local curSize = self.totalSize * percent * 1000 / timeOffset
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
    end)
end

function update:_awake()
    self.canvasGroup.alpha = 0
    self.canvasGroup.interactable = false
    self.canvasGroup.blocksRaycasts = false
    self.totalSize = 0
    self.beginTime = 0
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
                DialogManagerInst:open(DialogType.Tips, nil, handler(self, _beginDownload), "check_download", size, unit)
                self.totalSize = totalSize
            else
                DialogManagerInst:open(DialogType.Tips, nil, function ()
                    Progress:restart()
                end, "update_error")
            end
        end)
    end)
end

return update

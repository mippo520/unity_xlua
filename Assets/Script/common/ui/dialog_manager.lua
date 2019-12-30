local DialogManager = class("DialogManager")
local Dialog = require("common.ui.dialog")

DialogManager.SortOrder = 100

function DialogManager:ctor()
    self.mapDialog = {}
	self.onlyOneDialog = {}
	self.fullScreen = {}
end

function DialogManager:open(dialogType, openCallback, ...)
	if dialogType.OnlyOne then
		local dialog = self.onlyOneDialog[dialogType.Type]
		if dialog then
			if openCallback then
				openCallback(dialog.id)
			end
			return
		end
	end
    local args = {...}
    ResourcesManagerInst:LoadAssetBundleAsync(dialogType.AssetBundles, nil, function (arrRes)
	        local dialog = Dialog.new()
	        local res = ResourcesManagerInst:LoadAsset(dialogType.Path)

        	-- 设置自适应
			local s = Unity.Screen.safeArea
			local orignScale = s.height / s.width
			
			local canvasScaler = res:GetComponent(typeof(UnityUI.CanvasScaler))
			canvasScaler.uiScaleMode = UnityUI.CanvasScaler.ScaleMode.ScaleWithScreenSize
			if orignScale > 1 then
				canvasScaler.matchWidthOrHeight = 0
				canvasScaler.referenceResolution = Unity.Vector2(720, 1280)
			else
				canvasScaler.matchWidthOrHeight = 1
				canvasScaler.referenceResolution = Unity.Vector2(1280, 720)
			end
	
			orignScale = orignScale - 0.05
			if orignScale < 1.9 then
				orignScale = 1.9
			end
	        local effectiveHeight = s.width * orignScale;
	        if s.height > effectiveHeight then
	            local offset = s.height - effectiveHeight
	            local rt = res.transform:Find("wrap"):GetComponent(typeof(Unity.RectTransform))
	            rt:SetInsetAndSizeFromParentEdge(Unity.RectTransform.Edge.Top, offset, -offset);
	            rt.anchorMin = Unity.Vector2.zero;
	            rt.anchorMax = Unity.Vector2.one;
	        end
	        
	        Tools.Assert(res, dialogType.Path .. " is null!")  
	        dialog.res = Unity.Object.Instantiate(res)
	
	        -- 设置层级
	        local canvas = dialog.res:GetComponent(typeof(Unity.Canvas))
	        if dialogType.SortOrder then
	            canvas.sortingOrder = dialogType.SortOrder
	        else
	            canvas.sortingOrder = DialogManager.SortOrder
	            DialogManager.SortOrder = DialogManager.SortOrder + 1
	        end	
			
			local luaBehaviour = dialog.res:GetComponent(typeof(CSLuaBehaviour))
			-- 统计全屏对话框
			if dialogType.FullScreen then
				self.fullScreen[luaBehaviour.id] = 1
				EventManagerInst:fireEvent(Event.OpenFullScreenDialog)
			end
	
	        dialog.id = luaBehaviour.id
	        dialog.data = clone(dialogType)
	        self.mapDialog[dialog.id] = dialog
	        local luaObj = BehaviourManager.getBehaviour(luaBehaviour.id)
	        if luaObj.setValues then
				luaObj:setValues(table.unpack(args))
	        end
			dialog.luaObj = luaObj
			
			if dialogType.OnlyOne then
				self.onlyOneDialog[dialogType.Type] = dialog
			end
	        if openCallback then
	            openCallback(luaBehaviour.id)
	        end			
	    end)
end

function DialogManager:get(id)
    return self.mapDialog[id]
end

function DialogManager:close(id)
    local dialog = self.mapDialog[id]
    if not dialog then
        Info.Error("close dialog error! id = " .. id)
        return
    end
	
	if dialog.data.OnlyOne then
		self.onlyOneDialog[dialog.data.Type] = nil
	end
	
	if dialog.data.FullScreen and self.fullScreen[id] then
		self.fullScreen[id] = nil
		
		local count = 0
		for _, _ in pairs(self.fullScreen) do
			count = count + 1
			break
		end
		
		if 0 == count then
			EventManagerInst:fireEvent(Event.FullScreenDialogClear)
		end
	end
    dialog:close()
end

function DialogManager:clearAll()
    for k, v in pairs(self.mapDialog) do
        v:closeComplete()
    end
    self.mapDialog = {}
end


function DialogManager:destroy(id)
	local dialog = self.mapDialog[id]
	if dialog and dialog.data.FullScreen and self.fullScreen[id] then
		self.fullScreen[id] = nil

		local count = 0
		for _, _ in pairs(self.fullScreen) do
			count = count + 1
			break
		end

		if 0 == count then
			EventManagerInst:fireEvent(Event.FullScreenDialogClear)
		end
	end

    self.mapDialog[id] = nil
end

if not _DialogManagerInst then
    _DialogManagerInst = DialogManager.new()
end
return _DialogManagerInst


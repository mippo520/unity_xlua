local DialogManager = class("DialogManager")
local Dialog = require("common.ui.dialog")

local sInstance = nil

function DialogManager.GetInstance()
    if nil == sInstance then
        sInstance = DialogManager.new()
    end
    return sInstance
end

function DialogManager:ctor()
    self.mapDialog = {}
end

function DialogManager:open(dialogType, callback, ...)
    local args = {...}
    ResourcesManagerInst:LoadAssetBundleAsync(dialogType.AssetBundles, nil, function (arrRes)
        local dialog = Dialog.new()
        local res = ResourcesManagerInst:LoadAsset(dialogType.Path)
        dialog.res = Unity.Object.Instantiate(res)
        local luaBehaviour = dialog.res:GetComponent(typeof(CSLuaBehaviour))
        dialog.id = luaBehaviour.id
        dialog.data = clone(dialogType)
        self.mapDialog[dialog.id] = dialog

        if callback then
            callback(dialog.id, table.unpack(args))
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

    dialog:close()
    self.mapDialog[id] = nil
end

function DialogManager:closeAll()
    for k, v in pairs(self.mapDialog) do
        v:close()
    end
    self.mapDialog = {}
end

return DialogManager

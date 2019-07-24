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

function DialogManager:open(dialogType, ...)
    local args = {...}
    ResourcesManagerInst:LoadAssetBundleAsync(dialogType.AssetBundles, nil, function (arrRes)
        local dialog = Dialog.new()
        local res = ResourcesManagerInst:LoadAsset(dialogType.Path)
        Tools.Assert(res, dialogType.Path .. " is null!")
        dialog.res = Unity.Object.Instantiate(res)
        local luaBehaviour = dialog.res:GetComponent(typeof(CSLuaBehaviour))
        dialog.id = luaBehaviour.id
        dialog.data = clone(dialogType)
        self.mapDialog[dialog.id] = dialog
        local behaviour = BehaviourManager.getBehaviour(luaBehaviour.id)
        if behaviour.setValues then
            behaviour:setValues(table.unpack(args))
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
end

function DialogManager:clearAll()
    for k, v in pairs(self.mapDialog) do
        v:closeComplete()
    end
    self.mapDialog = {}
end


function DialogManager:destroy(id)
    self.mapDialog[id] = nil
end


return DialogManager

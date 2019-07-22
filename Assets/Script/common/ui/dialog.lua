local Dialog = class("Dialog")

function Dialog:ctor()
    self.res = nil
    self.id = 0
    self.data = {}
end

function Dialog:close()
    local behaviour = BehaviourManager.getBehaviour(self.id)
    behaviour:close()
end

function Dialog:closeComplete()
    if self.res then
        Unity.Object.Destroy(self.res)
    end
    if self.data.AssetBundles then
        ResourcesManagerInst:UnloadAssetBundle(self.data.AssetBundles)
    end
    DialogManagerInst:destroy(self.id)
end


return Dialog

local Dialog = class("Dialog")

function Dialog:ctor()
    self.res = nil
    self.id = 0
    self.data = {}
end

function Dialog:close()
    if self.res then
        Unity.Object.Destroy(self.res)
    end
    if self.data.AssetBundles then
        ResourcesManagerInst:UnloadAssetBundle(self.data.AssetBundles)
    end
end


return Dialog

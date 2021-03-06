local Dialog = class("Dialog")

function Dialog:ctor()
    self.res = nil
    self.id = 0
    self.data = {}
    self.inClose = false
	self.luaObj = nil
end

function Dialog:close()
    if not self.inClose then
		self.inClose = true
        local behaviour = BehaviourManager.getBehaviour(self.id)
        behaviour:close()
    end
end

function Dialog:closeComplete()
    if self.res then
        Unity.Object.Destroy(self.res)
    end
    if self.data.AssetBundles then
        ResourcesManagerInst:UnloadAssetBundle(self.data.AssetBundles)
    end
end


return Dialog

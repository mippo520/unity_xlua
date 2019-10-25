local Dancer = class("Dancer")

function Dancer:ctor(id)
    self.id = id
    self.obj = nil
    self.pos = nil
    self.AssetBundle = {"prefabs/3d/character/girl01"}
    self.asset = "Assets/Prefabs/3d/Character/girl01.prefab"
    ResourcesManagerInst:LoadAssetBundleAsync(self.AssetBundle, nil, function ()
        if self.id > 0 then
            self.obj = Unity.Object.Instantiate(ResourcesManagerInst:LoadAsset(self.asset))
            self.obj.transform.name = StageDefine.dancer_key .. tostring(id)
            if self.pos then
                self:setPosition(self.pos)
            end
        end
    end)
end

function Dancer:release()
    self.id = 0
    if self.obj then
        Unity.Object.Destroy(self.obj)
        ResourcesManagerInst:UnloadAssetBundle(self.AssetBundles)
    end
end

function Dancer:setPosition(pos)
    self.pos = pos
    if self.obj then
        local rt = self.obj:GetComponent(typeof(Unity.Transform))
        rt.position = Unity.Vector3(pos.x, pos.y, pos.z)
    end
end

return Dancer
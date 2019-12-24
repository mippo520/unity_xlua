local CopyMaterial = class("CopyMaterial", Behaviour)

function CopyMaterial:_start()
	self.renderer.material = Unity.Material(self.renderer.material)
end


return CopyMaterial
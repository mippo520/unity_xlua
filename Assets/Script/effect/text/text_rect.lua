local TextRect = class("TextRect", Behaviour)

local function _refresh(self)
	if self.text.material then
		local rectTransform = self.rt
		local s = Unity.Screen.safeArea
		s.width = s.width / ApplicationInst.deviceScale
		s.height = s.height / ApplicationInst.deviceScale
		local x = rectTransform.position.x / ApplicationInst.deviceScale - rectTransform.pivot.x * rectTransform.rect.width - s.width / 2
		local y = rectTransform.position.y / ApplicationInst.deviceScale + rectTransform.pivot.y * rectTransform.rect.height - s.height / 2
		local rect = Unity.Vector4(x, y, rectTransform.rect.width, rectTransform.rect.height)
		self.text.material:SetVector("_Rect", rect)
	end
end

function TextRect:ctor()
	Behaviour.ctor(self)
	self.executeInEditMode = true
	self.needUpdate = false
	self.needNewMaterial = false
end

function TextRect:_awake()
	self.rt = self.gameObject:GetComponent(typeof(Unity.RectTransform))
	self.text = self.gameObject:GetComponent(typeof(UnityUI.Text))
end

function TextRect:_start()
	self.text.material = Unity.Material(self.mat)
	_refresh(self)
end

function TextRect:_update()
	if self.needUpdate then
		if self.needNewMaterial then
			self.text.material = Unity.Material(self.mat)
		end
		_refresh(self)
	end
end

function TextRect:destroy()
	Behaviour.destroy(self)
	self.text.material = nil
end

return TextRect
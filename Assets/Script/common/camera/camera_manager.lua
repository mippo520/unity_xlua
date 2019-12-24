local CameraManager = class("CameraManager")

function CameraManager:lookAtDir()
	local luaBeh = Behaviour.getLuaBehaviour(Unity.Camera.main, "camera")
	if luaBeh then
		return luaBeh.lookDir
	end
	return nil
end


if not _CameraManagerInst then
	_CameraManagerInst = CameraManager.new()
end

return _CameraManagerInst
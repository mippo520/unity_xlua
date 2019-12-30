local RoleManager = class("RoleManager")

function RoleManager:ctor()
	self.roles = {}
end

function RoleManager:init()
	local gameScene = SceneManagerInst:getCurrent()
	gameScene.gcLuaObj.onFrame:addListener(self, RoleManager.update)
end

function RoleManager:setRoleStatus(frame)
	if frame:size() > 0 then
		for i = 0, frame:size() - 1 do
			local status = frame:get(i)
			local role = self.roles[status.scene_obj_id]
			if not role then
				role = Role.new()
				role:init()
				self.roles[status.scene_obj_id] = role
			end
			role:setStatus(status)
		end
	end
end

function RoleManager:stop()
	for _, role in pairs(self.roles) do
		role:stop()
	end
end

function RoleManager:doAction(frame)
	if frame:size() > 0 then
		for i = 0, frame:size() - 1 do
			local act = frame:get(i)
			local role = self.roles[act.objId]
			if role then
				role:doAction(act)
			else
				Info.Warn("RoleManager:setRoleStatus Error! Can not found this role! id is " .. status.id)
			end
		end
	end
end

function RoleManager:update(dt)
	for id, role in pairs(self.roles) do
		role:update(dt)
	end
end

if not _RoleManagerInst then
	_RoleManagerInst = RoleManager.new()
end

return _RoleManagerInst

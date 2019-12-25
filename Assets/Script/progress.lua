
if CS.UnityEngine.RuntimePlatform.WindowsEditor == CS.UnityEngine.Application.platform or CS.UnityEngine.RuntimePlatform.OSXEditor == CS.UnityEngine.Application.platform then	
	require('LuaDebuggee').StartDebug('127.0.0.1', 9826)
	
	local _, LuaDebuggee = pcall(require, 'LuaDebuggee')
	if LuaDebuggee and LuaDebuggee.StartDebug then
		if LuaDebuggee.StartDebug('127.0.0.1', 9826) then
			print('LuaPerfect: Successfully connected to debugger!')
		else
			print('LuaPerfect: Failed to connect debugger!')
		end
	else
		print('LuaPerfect: Check documents at: https://luaperfect.net')
	end
end

require("setting")
require("define.common")
require("define.engine_extend")

Progress = class("Progress")

function Progress:start()
	Unity.Application.targetFrameRate = FrameRate
	ApplicationInst:deviceZoom()
    TcpManagerInst:init()
    TimeManagerInst:init()
	
    UnitySceneManager.LoadSceneAsync(SceneType.Update)
end

function Progress:update()
    EventManagerInst:update()
    TimeManagerInst:update()
end

function Progress:appQuit()
    TcpManagerInst:release()
	UdpManagerInst:release()
end

function Progress:restart()
    UnitySceneManager.LoadSceneAsync(SceneType.Launcher)
end

function Progress:enterGame()
    UnitySceneManager.LoadSceneAsync(SceneType.Game)
end


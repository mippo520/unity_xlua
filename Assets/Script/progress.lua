
if CS.UnityEngine.RuntimePlatform.WindowsEditor == CS.UnityEngine.Application.platform or CS.UnityEngine.RuntimePlatform.OSXEditor == CS.UnityEngine.Application.platform then
    local util = require 'xlua.util'
    local yield_return = (require 'xlua.cs_coroutine').yield_return
    local BREAKINFOFUNC, XPCALLFUNC = require("luadebug")("localhost", 7003)
    local co = coroutine.create(
    function()
        while true do
            yield_return(CS.UnityEngine.WaitForSeconds(0.1))
            BREAKINFOFUNC()
        end
    end)
    coroutine.resume(co)
end

require("setting")
require("define.common")
require("define.engine_extend")

Progress = class("Progress")

function Progress:start()
    NetManagerInst:init()
    TimeManagerInst:init()

    UnitySceneManager.LoadSceneAsync(SceneType.Update)
end

function Progress:update()
    EventManagerInst:update()
    TimeManagerInst:update()
end

function Progress:appQuit()
    NetManagerInst:release()
end

function Progress:restart()
    UnitySceneManager.LoadSceneAsync(SceneType.Launcher)
end

function Progress:enterGame()
    UnitySceneManager.LoadSceneAsync(SceneType.Game)
end


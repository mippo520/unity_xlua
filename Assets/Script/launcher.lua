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

require("setting")
require("define.common")

Launcher = {}

function Launcher.start()
    NetManager.GetInstance():init()
    TimeManager.GetInstance():init()

    Info.Debug("current scene is " .. CS.UnityEngine.SceneManagement.SceneManager.GetActiveScene().name)
    CS.UnityEngine.SceneManagement.SceneManager.LoadScene("Main", CS.UnityEngine.SceneManagement.LoadSceneMode.Additive)
    Info.Debug("current scene is " .. CS.UnityEngine.SceneManagement.SceneManager.GetActiveScene().name)
end

function Launcher.update()
    EventManager.GetInstance():update()
    TimeManager.GetInstance():update()
end

function Launcher.appQuit()
    NetManager.GetInstance():release()
end


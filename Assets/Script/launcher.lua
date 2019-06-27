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

require("define.common")


Launcher = {}

function Launcher.start()
    NetManager:init()
    EventManager:AddEvent(Event.ConnectSuccess, Launcher, Launcher.connectSuccess)
    EventManager:AddEvent(Event.ConnectFailed, Launcher, Launcher.connectFailed)
    EventManager:AddEvent(Event.Disconnect, Launcher, Launcher.disconnect)

    CS.UnityEngine.SceneManagement.SceneManager.LoadScene("Main", CS.UnityEngine.SceneManagement.LoadSceneMode.Additive)
end

function Launcher.update()
    EventManager:Update()
end

function Launcher.appQuit()
    NetManager:release()
end

function Launcher:connectSuccess()
    Info.Debug(" launcher connect success! ")
end

function Launcher:connectFailed()
    Info.Debug(" launcher connect failed! ")
end

function Launcher:disconnect()
    Info.Debug(" launcher disconnect! ")
end

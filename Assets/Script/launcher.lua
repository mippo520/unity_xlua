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
    NetManager.GetInstance():init()
    EventManager.GetInstance():RegistEvent(Event.ConnectSuccess, Launcher, Launcher.connectSuccess)
    EventManager.GetInstance():RegistEvent(Event.ConnectFailed, Launcher, Launcher.connectFailed)
    EventManager.GetInstance():RegistEvent(Event.Disconnect, Launcher, Launcher.disconnect)
    NetManager.GetInstance():registMessage("c_gs.S2CLogin", Launcher, Launcher.recv)

    CS.UnityEngine.SceneManagement.SceneManager.LoadScene("Main", CS.UnityEngine.SceneManagement.LoadSceneMode.Additive)
end

function Launcher.update()
    EventManager.GetInstance():Update()
end

function Launcher.appQuit()
    NetManager.GetInstance():release()
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

function Launcher:recv(msg)
    Info.Debug(" receive v = " .. msg.open_server_time)
end

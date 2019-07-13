
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

Launcher = {}

function Launcher.start()

    NetManagerInst:init()
    TimeManagerInst:init()
    FileManagerInst:readAllBytesAsync("pb", "Assets/Proto/pb.txt", function (data)
        Protoc:load(data)
        NetManagerInst:registPairMessage("c_gs.C2S_Login", "c_gs.S2C_Login")
        UnitySceneManager.LoadSceneAsync("Main")
    end)

end

function Launcher.update()
    EventManagerInst:update()
    TimeManagerInst:update()
end

function Launcher.appQuit()
    NetManagerInst:release()
end


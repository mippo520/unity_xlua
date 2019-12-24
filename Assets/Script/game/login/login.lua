local login = class("login", DialogBehaviour)
local NumberAni = require("animate.ui.text.number")
local LoginController = require("game.login.login_controller")

function login:ctor()
    DialogBehaviour.ctor(self)
    self.ctrl = LoginController.new()

end

function login:_awake()
    self:DoBindText(Version, self.version)
    self:DoBindInputField(AccountDataInst.username, self.username)
    self:DoBindInputField(AccountDataInst.password, self.password)
    self:DoBindInputField(self.ctrl.gateHttpAddr, self.httpAddr)
    
    self:registEvent(Event.LoginSuccess, function ()
        self:closeSelf()
    end)
end


function login:_start()

    self:addListener(self.loginBtn.onClick, function ()
        self.ctrl:login()
    end)

    self:addListener(self.registBtn.onClick, function ()

        DialogManagerInst:open(DialogType.SpecialUITest)
    end)

    self:addListener(self.simBtn.onClick, function ()
        PossessionManagerInst:setBigNumber(Enum.ItemID.gold, 100000, 0)
        PossessionManagerInst:set(Enum.ItemID.diamond, 1001)
        PossessionManagerInst:set(Enum.ItemID.cash, 1000)
        Progress:enterGame()
    end)

end

return login

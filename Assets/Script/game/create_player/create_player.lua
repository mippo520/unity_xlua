local CreatePlayer = class("CreatePlayer", DialogBehaviour)
local CreatePlayerController = require("game.create_player.create_player_controller")

function CreatePlayer:ctor()
    DialogBehaviour.ctor(self)
    self.controller = CreatePlayerController.new()
    self.name = BindProperty.new("")
    self.head = BindProperty.new("")
end

function CreatePlayer:_awake()
    self:DoBindInputField(self.name, self.nameInput)
    self:DoBindInputField(self.head, self.headInput)
    self:addListener(self.createBtn.onClick, function ()
        self.controller:create(self.name:get(), self.head:get())
    end)
end

return CreatePlayer

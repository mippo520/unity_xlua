local ScaleFade = class("ScaleFade", Behaviour)

local ScaleFadeDefine = require("animate.ui.scale_fade.define")

function ScaleFade:ctor()
    self.super.ctor(self)
    self.animator = nil
end

function ScaleFade:_awake()
    self.animator = self.gameObject:GetComponent(typeof(Unity.Animator))
end

function ScaleFade:_start()
    self.animator:SetInteger(ScaleFadeDefine.state, ScaleFadeDefine.In)
end

function ScaleFade:close()
    self.animator:SetInteger(ScaleFadeDefine.state, ScaleFadeDefine.Out)
end

function ScaleFade:closeComplete()
    local rootLuaBehaviour = Behaviour.getLuaBehaviour(self.gameObject.transform.parent.gameObject)
    rootLuaBehaviour:closeComplete()
end


return ScaleFade
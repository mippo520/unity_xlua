local ScaleFade = class("ScaleFade", Behaviour)

local ScaleFadeState = {
    Idle = 0,
    Out = 1,
    In = 2,
}

function ScaleFade:ctor()
    self.super.ctor(self)
    self.state = "state"
    self.animator = nil
end

function ScaleFade:_awake()
    self.animator = self.gameObject:GetComponent(typeof(Unity.Animator))
end

function ScaleFade:_start()
    self.animator:SetInteger(self.state, ScaleFadeState.In)
end

function ScaleFade:_destroy()
    self.animator:SetInteger(self.state, ScaleFadeState.Out)
end


return ScaleFade
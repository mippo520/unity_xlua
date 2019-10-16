local SpineTest = class("SpineTest", DialogBehaviour)
local n = 0
function SpineTest:_awake()
    self:addListener(self.btn.onClick, function ()
        if 0 == n then
            self.spine.AnimationState:SetAnimation(0, "blink", true)
            n = 1
        else
            self.spine.AnimationState:SetAnimation(0, "main", true)
            n = 0
        end
    end)
end

function SpineTest:_start()
end

return SpineTest
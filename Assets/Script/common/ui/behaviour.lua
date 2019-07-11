
local Behaviour = class("Behaviour")

function Behaviour:awake()
    print("=============================================")
    print(self.__gc)
    print("=============================================")
    if self._awake then
        self:_awake()
    end
end

function Behaviour:start()
    if self._start then
        self:_start()
    end
end

function Behaviour:update()
    if self._update then
        self:_update()
    end
end

function Behaviour:destroy()
    if self._destroy then
        self:_destroy()
    end
    BehaviourManager.remove(self.id)
end

return Behaviour

local Tips = class("Tips", DialogBehaviour)

function Tips:ctor()
    DialogBehaviour.ctor(self)
    self.updateSize = 0
end

function Tips:setValues(callback, formatKey, ...)
    self.formatKey = formatKey
    self.args = {...}
    self.clickCallback = callback
end

function Tips:_start()
    local text = self.wrap.transform:GetChild(0).gameObject:GetComponent(typeof(UnityUI.Text))
    self:setFormatText(text, self.formatKey, table.unpack(self.args))
    
    local loginBtn = self.wrap.transform:GetChild(1).gameObject:GetComponent(typeof(UnityUI.Button))
    self:addListener(loginBtn.onClick, function ()
        if self.clickCallback then
            self.clickCallback()
        end
        self:closeSelf()
    end)
end

return Tips

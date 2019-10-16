local Notice = class("Notice", DialogBehaviour)

function Notice:ctor()
    DialogBehaviour.ctor(self)
    self.contents = {}
    self.bShow = false
end

function Notice:_awake()
    self.content.text = ""
end

function Notice:setValues(content)
    table.insert(self.contents, content)
    if #self.contents > 100 then
        table.remove(self.contents, 1)
    end
end

function Notice:clear()
    self.bShow = false
    self.contents = {}
    self.content.text = ""
end

return Notice
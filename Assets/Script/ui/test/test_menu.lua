local TestMenu = class("TestMenu", ListView)

function TestMenu:ctor()
    ListView.ctor(self)

    self.items = {
        {
            title = "PackageTest", 
            id = DialogType.PackageTest,
        }, 
        {
            title = "RvoTest", 
            id = DialogType.RvoTest,
        }, 
        {
            title = "ScrollTest", 
            id = DialogType.ScrollTest,
        }, 
        {
            title = "ShaderTest", 
            id = DialogType.ShaderTest,
        }
    }
end 

function TestMenu:_getCount()
    return #self.items
end


function TestMenu:_initCell(cellBehaviour)
    cellBehaviour.title.text = self.items[cellBehaviour.index + 1].title
end


function TestMenu:onCellClicked(cellBehaviour)
    DialogManagerInst:open(self.items[cellBehaviour.index + 1].id)
end

return TestMenu
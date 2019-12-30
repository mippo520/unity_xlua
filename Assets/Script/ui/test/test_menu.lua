local TestMenu = class("TestMenu", ListView)

local function _opGame()
	UnitySceneManager.LoadSceneAsync(SceneType.Game)
end

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
		},
		{
			title = "UdpTest",
			cb = _opGame,
		}
    }
end 

function TestMenu:_getCount()
    return #self.items
end


function TestMenu:_initCell(cellBehaviour, index)
    cellBehaviour.title.text = self.items[index + 1].title
end


function TestMenu:onCellClicked(cellBehaviour)

	local item = self.items[cellBehaviour.index + 1]
	if item.cb then
		item.cb()
	else
		DialogManagerInst:open(item.id)
	end
end

return TestMenu
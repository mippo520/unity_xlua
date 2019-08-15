local PackageTest = class("HScroll", GridView)

function PackageTest:ctor()
    GridView.ctor(self)
    self.count = 15
end

function PackageTest:_getCount()
    return self.count
end

function PackageTest:_initCell(cellBehaviour, index)
    if index < self.count then
        cellBehaviour.title.text = "cell idex is " .. index
    else
        local cg = cellBehaviour.gameObject:GetComponent(typeof(Unity.CanvasGroup))
        cg.alpha = 0
        cg.interactable = false
        cg.blocksRaycasts = false
    end
    return cellBehaviour
end

function PackageTest:onCellClicked(cellBehaviour)
    Info.Debug("Item clicked,  index is " .. cellBehaviour.index)
end

return PackageTest

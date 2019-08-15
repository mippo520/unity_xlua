local HScroll = class("HScroll", ListView)


function HScroll:_getCount()
    return 20
end

function HScroll:_initCell(cellBehaviour)
    cellBehaviour.content.text = "cell idex is " .. cellBehaviour.index
    return cellBehaviour
end

function HScroll:onCellClicked(cellBehaviour)
    Info.Debug("cell index is " .. cellBehaviour.index)
end

return HScroll

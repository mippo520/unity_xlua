local HScroll = class("HScroll", ListView)


function HScroll:_getCount()
    return 20
end

function HScroll:_initCell(cellBehaviour, index)
    cellBehaviour.content.text = "cell idex is " .. index
    return cellBehaviour
end


return HScroll

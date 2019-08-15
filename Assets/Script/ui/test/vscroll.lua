local VScroll = class("VScroll", ListView)


function VScroll:_getCount()
    return 30
end

function VScroll:_initCell(cellBehaviour)
    cellBehaviour.name.text = "index " .. tostring(cellBehaviour.index)
    if 0 == cellBehaviour.index % 2 then
        cellBehaviour.content.text = "sdbserbsebsgfbdsnbrsnrnsdbserbsebsgfbdsnbrsnrnsdbserbsebsgfbdsnbrsnrn"
    else
        cellBehaviour.content.text = "sdbserbsebsgfbdsnbrsnrnsdbserbsebs"
    end
    -- 自适应文本要马上计算高度
    cellBehaviour.content:GetComponent(typeof(UnityUI.ContentSizeFitter)):SetLayoutVertical()
    -- 高度会变化的cell马上刷新高度
    UnityUI.LayoutRebuilder.ForceRebuildLayoutImmediate(cellBehaviour.gameObject:GetComponent(typeof(Unity.RectTransform)));
    return cellBehaviour
end

return VScroll

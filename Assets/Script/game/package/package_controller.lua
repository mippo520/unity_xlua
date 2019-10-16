local PackageController = class("PackageController")

------- private begin ----------
local function _s2c_heap_container_thing_list(self, msg)
    for _, item in ipairs(msg.items) do
        PackageInst:set(item.uid, item)
    end

    EventManagerInst:fireEvent(Event.PackageUpdate)

end
------- private end ----------


function PackageController:init()
    NetManagerInst:registMessage(c_gs.S2C_HeapContainerThingList, self, _s2c_heap_container_thing_list)
end

if not _PackageControllerInst then
    _PackageControllerInst = PackageController.new()
end

return _PackageControllerInst

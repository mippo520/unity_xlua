local Package = class("Package")

function Package:ctor()
    self.containers = {}
end

function Package:get(tid)
    return self.container[tid]
end

function Package:set(tid, item)
    self.container[tid] = item
end

if not _PackageInst then
    _PackageInst = Package.new()
end

return _PackageInst
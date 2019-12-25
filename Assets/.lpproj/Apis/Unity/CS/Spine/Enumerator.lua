---@class CS.Spine.Enumerator : CS.System.ValueType
CS.Spine.Enumerator = {}

---@property readonly CS.Spine.Enumerator.Current : CS.T
CS.Spine.Enumerator.Current = nil

function CS.Spine.Enumerator:Dispose()
end

---@return CS.System.Boolean
function CS.Spine.Enumerator:MoveNext()
end
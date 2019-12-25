---@module CS.Spine
CS.Spine = {}

---@class CS.Spine.Animation : CS.System.Object
CS.Spine.Animation = {}

---@property readwrite CS.Spine.Animation.Timelines : CS.Spine.ExposedList
CS.Spine.Animation.Timelines = nil

---@property readwrite CS.Spine.Animation.Duration : CS.System.Single
CS.Spine.Animation.Duration = nil

---@property readonly CS.Spine.Animation.Name : CS.System.String
CS.Spine.Animation.Name = nil

---@param name : CS.System.String
---@param timelines : CS.Spine.ExposedList
---@param duration : CS.System.Single
---@return CS.Spine.Animation
function CS.Spine.Animation(name, timelines, duration)
end

---@param skeleton : CS.Spine.Skeleton
---@param lastTime : CS.System.Single
---@param time : CS.System.Single
---@param loop : CS.System.Boolean
---@param events : CS.Spine.ExposedList
---@param alpha : CS.System.Single
---@param blend : CS.Spine.MixBlend
---@param direction : CS.Spine.MixDirection
function CS.Spine.Animation:Apply(skeleton, lastTime, time, loop, events, alpha, blend, direction)
end

---@return CS.System.String
function CS.Spine.Animation:ToString()
end
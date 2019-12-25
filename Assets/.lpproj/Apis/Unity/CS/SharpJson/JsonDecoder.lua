---@class CS.SharpJson.JsonDecoder : CS.System.Object
CS.SharpJson.JsonDecoder = {}

---@property readwrite CS.SharpJson.JsonDecoder.errorMessage : CS.System.String
CS.SharpJson.JsonDecoder.errorMessage = nil

---@property readwrite CS.SharpJson.JsonDecoder.parseNumbersAsFloat : CS.System.Boolean
CS.SharpJson.JsonDecoder.parseNumbersAsFloat = nil

---@return CS.SharpJson.JsonDecoder
function CS.SharpJson.JsonDecoder()
end

---@param text : CS.System.String
---@return CS.System.Object
function CS.SharpJson.JsonDecoder:Decode(text)
end

---@param text : CS.System.String
---@return CS.System.Object
function CS.SharpJson.JsonDecoder.DecodeText(text)
end
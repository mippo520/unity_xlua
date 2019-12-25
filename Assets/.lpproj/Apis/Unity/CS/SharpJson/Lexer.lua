---@module CS.SharpJson
CS.SharpJson = {}

---@class CS.SharpJson.Lexer : CS.System.Object
CS.SharpJson.Lexer = {}

---@property readonly CS.SharpJson.Lexer.hasError : CS.System.Boolean
CS.SharpJson.Lexer.hasError = nil

---@property readwrite CS.SharpJson.Lexer.lineNumber : CS.System.Int32
CS.SharpJson.Lexer.lineNumber = nil

---@property readwrite CS.SharpJson.Lexer.parseNumbersAsFloat : CS.System.Boolean
CS.SharpJson.Lexer.parseNumbersAsFloat = nil

---@param text : CS.System.String
---@return CS.SharpJson.Lexer
function CS.SharpJson.Lexer(text)
end

function CS.SharpJson.Lexer:Reset()
end

---@return CS.System.String
function CS.SharpJson.Lexer:ParseString()
end

---@return CS.System.Single
function CS.SharpJson.Lexer:ParseFloatNumber()
end

---@return CS.System.Double
function CS.SharpJson.Lexer:ParseDoubleNumber()
end

---@return CS.SharpJson.Token
function CS.SharpJson.Lexer:LookAhead()
end

---@return CS.SharpJson.Token
function CS.SharpJson.Lexer:NextToken()
end
local NetManager = class("NetManager")

function NetManager:ctor()
	self.mapIdMsg = {}
	self.mapMsgId = {}
	self.mapPairMsg = {}
end

function NetManager:addMsgInfo(msg)
	if not self.mapMsgId[msg] then
		local id = Tools.Hash(msg)
		self.mapIdMsg[id] = msg
		self.mapMsgId[msg] = id
	end
end

function NetManager:_PbUnpack(id, data)
	local pb = nil
	local msg = self.mapIdMsg[id]
	if msg then
		pb = assert(PB.decode(msg, data))
	else
		-- Info.Error("receive message error! id = " .. id)
		Info.Warn("receive message error! id = " .. id)
	end
	return msg, pb
end

function NetManager:pbUnpack(data, size)
	local id = string.unpack(">I4", data)
	local body = string.sub( data, 5, size)
	return self:_PbUnpack(id, body)
end

function NetManager:pbPack(msg, data)
	local pack = nil
	local id = self.mapMsgId[msg]
	if not id then
		Info.Error("TcpManager:send error! message type is " .. msg)
		return pack
	end

	pack = string.pack(">I4", id)
	local bytes = assert(PB.encode(msg, data))
	pack = pack .. bytes 
	return pack
end

function NetManager:registMessage(msg, obj, callback)
	self:addMsgInfo(msg)

	EventManagerInst:registEvent(msg, obj, callback)
end

function NetManager:registPairMessage(sendMsg, recvMsg)
	self:addMsgInfo(sendMsg)
	self:addMsgInfo(recvMsg)
	if self.mapPairMsg[sendMsg] then
		Info.Error("TcpManager:registPairMessage error! pair " .. sendMsg .. " and " .. recvMsg .. " is already registed!")
	end
	self.mapPairMsg[sendMsg] = recvMsg
end

return NetManager
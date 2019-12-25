local NetManager = class("NetManager")

function NetManager:ctor()
	self.mapIdMsg = {}
	self.mapMsgId = {}

end

function NetManager:addMsgInfo(self, msg)
	if not self.mapMsgId[msg] then
		local id = Tools.Hash(msg)
		self.mapIdMsg[id] = msg
		self.mapMsgId[msg] = id
	end
end

function NetManager:pbUnpack(data, size)
	local pb = nil
	local id = string.unpack(">I4", data)
	local msg = self.mapIdMsg[id]
	if msg then
		local body = string.sub( data, 5, size)
		pb = assert(PB.decode(msg, body))
	else
		-- Info.Error("receive message error! id = " .. id)
		Info.Warn("receive message error! id = " .. id)
	end
	return msg, pb
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

return NetManager
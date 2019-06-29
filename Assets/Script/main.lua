
main = {}
local self = nil

local function receiveLogin(self, msg)
    local text = self.transform:GetChild(4).gameObject
    text:GetComponent(typeof(UnityUI.Text)).text = msg.server_time
end
local function connectSuccess(self, msg)
    local text = self.transform:GetChild(4).gameObject
    text:GetComponent(typeof(UnityUI.Text)).text = "connectsuccess"
end
local function close(self, msg)
    local text = self.transform:GetChild(4).gameObject
    text:GetComponent(typeof(UnityUI.Text)).text = "close"
end
local function Disconnect(self, msg)
    local text = self.transform:GetChild(4).gameObject
    text:GetComponent(typeof(UnityUI.Text)).text = "disconnect"
end

function main.awake(gameObject)
    print("main.Awake")
    self = gameObject
    EventManager.GetInstance():RegistEvent(Event.ConnectSuccess, self, connectSuccess)
    EventManager.GetInstance():RegistEvent(Event.Closed, self, close)
    EventManager.GetInstance():RegistEvent(Event.Disconnect, self, Disconnect)

    NetManager.GetInstance():registMessage("c_gs.S2CLogin", self, receiveLogin)
end

function main.start()
    local btn = self.transform:GetChild(0).gameObject
    btn:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
        
        FileManager.GetInstance():readAllBytesAsync("pb", "Assets/Proto/msg_login.proto", function (data)
            Protoc:load(data)
            NetManager.GetInstance():connect("192.168.3.192", 9101)
   
        end)

    end)

    local btn2 = self.transform:GetChild(1).gameObject
    btn2:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
        
        NetManager.GetInstance():send("c_gs.C2SLogin", {
            account_id = 10086,
            token = "seal;kngilwea"
        })

    end)

    local btn3 = self.transform:GetChild(2).gameObject
    btn3:GetComponent(typeof(UnityUI.Button)).onClick:AddListener(function ()
        
        NetManager.GetInstance():close()

    end)


end

function main.update()
end

function main.onDestroy()
    print("main.OnDestroy")
end
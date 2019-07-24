local regist = class("regist", DialogBehaviour)


function regist:_start()
    -- self:StartCoroutine(function ()
    --     coroutine.yield(Unity.WaitForSeconds(1))

    --     Info.Debug("coroutine!")
    -- end)

    local input = self.wrap.transform:GetChild(0).gameObject:GetComponent(typeof(UnityUI.InputField))

    local input1 = self.wrap.transform:GetChild(1).gameObject:GetComponent(typeof(UnityUI.InputField))

    local btn = self.wrap.transform:GetChild(2).gameObject:GetComponent(typeof(UnityUI.Button))
    self:addListener(btn.onClick, function ()
        -- local account_name = input.text
        -- local password = input1.text
        -- local time = Now()
        -- local sign = account_name .. password .. tostring(time) .. "vgcli"
        
        -- HttpManagerInst:Get("http://192.168.3.192:8000/register", 
        -- {
        --     account_name = account_name,
        --     password = password,
        --     time = time,
        --     sign = FileManager.md5(sign),
        -- }, 
        -- function (id, state, content)
        --     local res = RapidJson.decode(content)
        --     if Error.Success == res.code then
        --         self:closeSelf()
        --         DialogManagerInst:open(DialogType.Login)
        --     end
        -- end)        

        UnitySceneManager.LoadSceneAsync(SceneType.Update)
    end)
end


return regist

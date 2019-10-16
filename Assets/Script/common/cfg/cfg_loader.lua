local CfgLoader = class("CfgLoader")

function CfgLoader:ctor()
    self.path = ""
    self.content = {}
end

function CfgLoader:init()
    local content = FileManagerInst:readAllBytes(self.path)
    local content_table = RapidJson.decode(content)
    for _, record in ipairs(content_table.RECORDS) do
        local recordTable = {}
        for i, key in ipairs(content_table.TITLES) do
            recordTable[key] = record[i]
        end
        table.insert(self.content, recordTable)
    end
end

return CfgLoader
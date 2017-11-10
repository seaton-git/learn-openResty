---
--- Created by Seaton.
--- DateTime: 2017/11/9 0009 15:51
---

local upload = require('resty.upload')
local util = require('common.util')

local chunk_size = 4096
local form = upload:new(chunk_size)
local file
local save_path = ".//workspace/upload/"

local FileUpload = {}

--获取文件名
function FileUpload:get_filename(res)
    local filename = ngx.re.match(res,'(.+)filename="(.+)"(.*)')
    if filename then
        return filename[2]
    end
end

--获取文件扩展名
function FileUpload:getExtension(str)
    return str:match(".+%.(%w+)$")
end

function FileUpload:save_file()
    while true do
        local typ, res, err = form:read()
        if not typ then
            ngx.say("{error:'error', msg:'"..tostring(err).."',imgurl:''}")
            return
        end
        if typ == "header" then
            if res[1] ~= "Content-Type" then
                local file_id = util.create_uuid()
                local filen_ame = self:get_filename(res[2])
                local extension = self:getExtension(filen_ame)
                local file_name = save_path ..file_id.."."..extension
                if file_name then
                    file = io.open(file_name, "wb+")
                    if not file then
                        return {
                            code = 10021,
                            msg = 'failed to open file',
                            data= {}
                        }
                    end
                end
            end
        elseif typ == "body" then
            if file then
                file:write(res)
            end
        elseif typ == "part_end" then
            file:close()
            file = nil
        elseif typ == "eof" then
            break
        else
            -- do nothing
        end
    end
    return {
        code = 0,
        msg = 'success',
        data= {}
    }
end

return FileUpload
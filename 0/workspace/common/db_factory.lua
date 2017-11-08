---
--- Created by Seaton.
--- DateTime: 2017/11/8 0008 15:19
---

local mysql = require('resty.mysql')

local MySQL = {}

function MySQL:getClient() -- 创建连接
    if ngx.ctx[MySQL] then
        return ngx.ctx[MySQL]
    end

    local client, err = mysql:new()

    if not client then
        ngx.log(4, 'client failed')
    end

    client:set_timeout(3000)

    local options = {
        host = '127.0.0.1',
        port = 3306,
        user = 'root',
        password = 'root',
        database = 'db_pet'
    }

    local res, err, errno, sqlstate = client:connect(options)

    if not res then
        ngx.say('res nil')
    end

    ngx.ctx[MySQL] = client
    return ngx.ctx[MySQL]
end

function MySQL:close() -- 关闭连接
    if ngx.ctx[MySQL] then
        ngx.ctx[MySQL]:set_keepalive(0, 100)
        ngx.ctx[MySQL] = nil
    end
end

-- 查询

function MySQL:query(query)

    local res, err, errno, sqlstate = self:getClient():query(query)

    if not res then
        return {
            code = errno,
            msg = '操作失败',
            data = res
        }
    end

    self:close()
    return {
        code = 0,
        msg = '操作成功',
        data = res
    }
end

return MySQL


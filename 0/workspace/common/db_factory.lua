---
--- Created by Seaton.
--- DateTime: 2017/10/26 0026 14:22
---

local mysql = require('resty.mysql')

function close_db(db)
    if not db then
        return
    end
    db:close()
end

-- 创建实例
db, err = mysql:new()

if not db then
    ngx.say('new mysql error:', err)
    return
end

-- 设置超时时间（毫秒）
db:set_timeout(2000)

props = {
    host = '127.0.0.1',
    port = 3306,
    database = 'lua',
    user = 'root',
    password = 'root',
    charset = 'utf8'
}

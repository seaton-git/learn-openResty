---
--- Created by Seaton.
--- DateTime: 2017/9/27 0027 18:05
---

require('common.db_factory')
local cjson = require("cjson")

res, err, errno, sqlstate = db:connect(props)  -- 创建连接

local select_sql = 'select id, name from tb_test'
res, err, errno, sqlstate = db:query(select_sql)  -- 执行sql
if not res then
    ngx.say('connect to mysql error: ', err, ', errno: ', errno, ', sqlstate: ', sqlstate)
    return close_db(db)
else
    ngx.say(cjson.encode(res))
    return close_db(db)
end










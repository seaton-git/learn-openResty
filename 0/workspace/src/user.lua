---
--- Created by Seaton.
--- DateTime: 2017/9/27 0027 18:05
---

local db = require('common.db_factory')
local util = require('common.util')
local cjson = require("cjson.safe")

local uri = ngx.var.request_uri
local method = string.match(uri, [[[^/]+$]])
local params = string.find(method, '?')
if params then
    method = string.sub(method, 0, params - 1)
end
method = string.sub(method, 1)

local methods = {
    ['select'] = function() -- 查询
        ngx.say(cjson.encode(db:query('select * from tb_user')))
    end,

    ['reg'] = function() -- 注册
        ngx.req.read_body()
        local data = ngx.req.get_post_args()
        local id = util.create_uuid()

        local reg_sql = string.format('insert into tb_user (ID, NICK_NAME, CELL_NUMBER, PASSWORD, MODEIFY_DATE) values ("%s", "%s", "%s", "%s", "%s")',
            id,
            data.nick_name,
            data.cell_number,
            ngx.md5(data.password),
            ngx.localtime()
        )

        ngx.say(cjson.encode(db:query(reg_sql)))
    end
}

if methods[method] then
    methods[method]()
end










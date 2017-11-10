---
--- Created by Seaton.
--- DateTime: 2017/9/27 0027 18:05
---

local util = require('common.util')
local upload = require('common.upload')
local cjson = require("cjson.safe")

local uri = ngx.var.request_uri
local method = string.match(uri, [[[^/]+$]])
local params = string.find(method, '?')
if params then
    method = string.sub(method, 0, params - 1)
end
method = string.sub(method, 1)

local methods = {


    ['update_head_img'] = function()
        local res = upload:save_file()
        ngx.say(cjson.encode(res))
    end
}

if methods[method] then
    methods[method]()
end










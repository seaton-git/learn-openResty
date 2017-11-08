---
--- Created by Seaton.
--- DateTime: 2017/11/7 0007 15:57
---
local uuid = require('resty.jit-uuid')

return {
    ['create_uuid'] = function() -- 创建uuid
        return uuid.generate_v4()
    end
}

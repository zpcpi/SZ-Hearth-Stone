--[[4011

]]
local G = require "gf"
local L = {}
local t = G.api

t['com_set_value'] = function (com, attr, value)
    com[attr] = value
end

t['zpc_test'] = function (a, b, c, d, e, f)
    G.call('角色_设置水晶数据', '我方', '最大值', a)
    G.call('角色_设置水晶数据', '我方', '当前值', b)
    G.call('角色_设置水晶数据', '我方', '锁定值', c)
    G.call('角色_设置水晶数据', '我方', '下回锁定值', d)
    G.call('角色_设置水晶数据', '我方', '预览值', e)
    G.call('角色_设置水晶数据', '我方', '预览锁定值', f)
end
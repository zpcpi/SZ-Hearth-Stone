--[[4011

]]
local G = require "gf"
local L = {}
local t = G.api

t['com_set_value'] = function (com, attr, value)
    com[attr] = value
end

t['zpc_test'] = function ()
    G.call('网络通用_广播消息', 'asd', 1, false, {}, {[1] = 1, ['2'] = '2'})
end
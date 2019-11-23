--[[4011

]]
local G = require "gf"
local L = {}
local t = G.api

t['com_set_value'] = function (com, attr, value)
    com[attr] = value
end


t['asdasd'] = function ()
    local rlib = G.call('Create_Randomlib', G.QueryName(0x100c0003))

    rlib:添加数据({1, 10})
    rlib:添加数据({2, 5})
    rlib:添加数据({3, 0})
    rlib:添加数据({4, 10})
    rlib:添加数据({5, 5})
    rlib:添加数据({6, 0})
    rlib:添加数据({7, 5})
    rlib:添加数据({8, 10})
    rlib:添加数据({9, 0})

    rlib.boolean_是否循环 = true

    rlib:初始化(false, true)

    local r = rlib(90000)
    local tt = {}
    for k,v in ipairs(r) do
        tt[v] = (tt[v] or 0) + 1
    end



    --G.show_table(r)
    G.show_table(tt)
end

t['zpc_test'] = function ()
    local skill = G.QueryName(0x10130001)
    local code = skill.逻辑功能[1].功能测试.lua
    G.show_table(code())
end
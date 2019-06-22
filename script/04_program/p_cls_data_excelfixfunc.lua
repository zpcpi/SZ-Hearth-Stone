--[[4019

]]
local G = require "gf"
local L = {}
local t = G.api

--type=excel_fix
t['o_item_过滤出菜肴'] = function(_o_item_物品列表)
    local iter = function (v)
        return v['__类型'] == 0x11040015
    end

    return G.call('数组_过滤器', _o_item_物品列表, iter)
end


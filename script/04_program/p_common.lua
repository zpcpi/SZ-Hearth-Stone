--[[4010

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
t['通用_概率判断'] = function(percent_概率)
    percent_概率 = percent_概率 * 100
    return G.random(100) < percent_概率
end
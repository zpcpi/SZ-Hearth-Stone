--[[4009

]]
local G = require "gf"
local L = {}
local t = G.api

t['对决_初始化战场'] = function(estr_battle_type_对决类型)
    if estr_battle_type_对决类型 == '1v1' then 
        G.misc().对决类型 = estr_battle_type_对决类型
        G.addUI('v_battle_1v1')
    elseif estr_battle_type_对决类型 == '2v2' then 
    end
end

--ret=estr_battle_type
t['对决_获取对决类型'] = function()
    return G.misc().对决类型
end
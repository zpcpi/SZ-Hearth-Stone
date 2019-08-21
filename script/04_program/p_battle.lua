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

t['对决_获取对决玩家信息列表'] = function()
    return G.misc().对决玩家信息列表
end

t['对决_增加对决玩家信息'] = function(o_battle_player_对决玩家, boolean_是主机)
    local o_misc = G.misc()
    if o_misc.对决玩家信息列表 == nil then 
        o_misc.对决玩家信息列表 = {}
    end
    table.insert(o_misc.对决玩家信息列表, o_battle_player_对决玩家)
    o_battle_player_对决玩家.是主机 = boolean_是主机
end
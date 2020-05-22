--[[4014

]]
local G = require "gf"
local L = {}
local t = G.api

--ret=o_battle_role
t['对决_获取对决角色_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    if estr_absolute_id_type_绝对身份 == nil or G['对决角色'] == nil then 
        return nil
    end
    return G['对决角色'][estr_absolute_id_type_绝对身份]
end

--ret=int
t['对决_获取对决角色生命值_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local o_battle_role_对决角色 = G.call('对决_获取对决角色_绝对身份', estr_absolute_id_type_绝对身份)
    if o_battle_role_对决角色 == nil then 
        return 0
    end
    return o_battle_role_对决角色.生命值 or 0
end

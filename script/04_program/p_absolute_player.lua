--[[400d

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
t['角色_添加手牌_绝对身份'] = function(estr_absolute_id_type_绝对身份, o_card_卡牌)
    local o_misc = G.misc()
    local int_当前手牌数量 = G.call('角色_获取手牌数量_绝对身份', estr_absolute_id_type_绝对身份)
    o_misc.手牌数量[estr_absolute_id_type_绝对身份] = int_当前手牌数量 + 1

    if o_misc.手牌信息 == nil then
        o_misc.手牌信息 = {}
    end
    if o_misc.手牌信息[estr_absolute_id_type_绝对身份] == nil then
        o_misc.手牌信息[estr_absolute_id_type_绝对身份] = {}
    end

    table.insert(o_misc.手牌信息[estr_absolute_id_type_绝对身份], o_card_卡牌)
end

--hide=true
t['角色_移除手牌_绝对身份'] = function(estr_absolute_id_type_绝对身份, int_手牌序号)
    local o_misc = G.misc()
    local int_当前手牌数量 = G.call('角色_获取手牌数量_绝对身份', estr_absolute_id_type_绝对身份)
    o_misc.手牌数量[estr_absolute_id_type_绝对身份] = int_当前手牌数量 - 1

    if o_misc.手牌信息 == nil then
        o_misc.手牌信息 = {}
    end
    if o_misc.手牌信息[estr_absolute_id_type_绝对身份] == nil then
        o_misc.手牌信息[estr_absolute_id_type_绝对身份] = {}
    end

    table.remove(o_misc.手牌信息[estr_absolute_id_type_绝对身份], int_手牌序号)
end

--hide=true
t['角色_获取手牌数量_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local o_misc = G.misc()
    if o_misc.手牌数量 == nil then 
        o_misc.手牌数量 = {}
    end

    return o_misc.手牌数量[estr_absolute_id_type_绝对身份] or 0
end
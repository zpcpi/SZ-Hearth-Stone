--[[4008

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
t['角色_添加手牌_相对身份'] = function(estr_player_相对身份)
    local o_misc = G.misc()
    if o_misc.卡牌数量 == nil then 
        o_misc.卡牌数量 = {}
    end
    o_misc.卡牌数量[estr_player_相对身份] = o_misc.卡牌数量[estr_player_相对身份] or 0
    o_misc.卡牌数量[estr_player_相对身份] = o_misc.卡牌数量[estr_player_相对身份] + 1

    if G.call('网络通用_能否广播') then 
        local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
        G.call('网络通用_广播消息', '角色_添加手牌_绝对身份', estr_absolute_id_type_绝对身份)
    end
end

--hide=true
t['角色_添加手牌_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)
    G.call('角色_添加手牌_相对身份', estr_player_相对身份)
end

--hide=true
t['角色_移除手牌_相对身份'] = function(estr_player_相对身份)
    local o_misc = G.misc()
    if o_misc.卡牌数量 == nil then 
        o_misc.卡牌数量 = {}
    end
    o_misc.卡牌数量[estr_player_相对身份] = o_misc.卡牌数量[estr_player_相对身份] or 0
    o_misc.卡牌数量[estr_player_相对身份] = o_misc.卡牌数量[estr_player_相对身份] - 1

    if G.call('网络通用_能否广播') then 
        local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
        G.call('网络通用_广播消息', '角色_移除手牌_绝对身份', estr_absolute_id_type_绝对身份)
    end
end

--hide=true
t['角色_移除手牌_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)
    G.call('角色_移除手牌_相对身份', estr_player_相对身份)
end

--hide=true
t['角色_获取手牌数量'] = function(estr_player_玩家)
    local o_misc = G.misc()
    return o_misc.卡牌数量[estr_player_玩家]
end
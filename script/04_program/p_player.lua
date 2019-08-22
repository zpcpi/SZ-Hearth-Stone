--[[4008

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
t['角色_添加手牌'] = function(estr_player_玩家)
    local o_misc = G.misc()
    estr_player_玩家 = estr_player_玩家 or '我方'
    if o_misc.卡牌数量 == nil then 
        o_misc.卡牌数量 = {}
    end
    o_misc.卡牌数量[estr_player_玩家] = o_misc.卡牌数量[estr_player_玩家] or 0
    o_misc.卡牌数量[estr_player_玩家] = o_misc.卡牌数量[estr_player_玩家] + 1

    if estr_player_玩家 == '我方' then 
        G.call('网络通用_广播消息', '角色_添加手牌', '敌方1')
    end
end

--hide=true
t['角色_移除手牌'] = function(estr_player_玩家)
    local o_misc = G.misc()
    estr_player_玩家 = estr_player_玩家 or '我方'
    if o_misc.卡牌数量 == nil then 
        o_misc.卡牌数量 = {}
    end
    o_misc.卡牌数量[estr_player_玩家] = o_misc.卡牌数量[estr_player_玩家] or 0
    o_misc.卡牌数量[estr_player_玩家] = o_misc.卡牌数量[estr_player_玩家] - 1
    if o_misc.卡牌数量[estr_player_玩家] < 0 then 
        o_misc.卡牌数量[estr_player_玩家] = 0
    end
    if estr_player_玩家 == '我方' then 
        G.call('网络通用_广播消息', '角色_移除手牌', '敌方1')
    end
end

--hide=true
t['角色_获取手牌数量'] = function(estr_player_玩家)
    local o_misc = G.misc()
    return o_misc.卡牌数量[estr_player_玩家]
end
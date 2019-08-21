--[[4008

]]
local G = require "gf"
local L = {}
local t = G.api

t['系统_初始化玩家信息'] = function()
    local o_misc = G.misc()
    if o_misc.玩家信息 == nil then 
        o_misc.玩家信息 = {}
    end
end

t['系统_设置玩家名称'] = function(string_名称)
    local o_misc = G.misc()
    if o_misc.玩家信息 == nil then 
        o_misc.玩家信息 = {}
    end
    o_misc.玩家信息.玩家名称 = string_名称
end

--hide=true
t['角色_添加手牌'] = function(estr_player_玩家)
    local o_misc = G.misc()
    estr_player_玩家 = estr_player_玩家 or '我方'
    if o_misc.卡牌数量 == nil then 
        o_misc.卡牌数量 = {}
    end
    o_misc.卡牌数量[estr_player_玩家] = o_misc.卡牌数量[estr_player_玩家] or 0
    o_misc.卡牌数量[estr_player_玩家] = o_misc.卡牌数量[estr_player_玩家] + 1
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
end

--hide=true
t['角色_获取手牌数量'] = function(estr_player_玩家)
    local o_misc = G.misc()
    return o_misc.卡牌数量[estr_player_玩家]
end
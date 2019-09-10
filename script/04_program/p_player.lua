--[[4008

]]
local G = require "gf"
local L = {}
local t = G.api

t['角色_身份映射'] = function ()

end

--hide=true
t['角色_添加手牌'] = function(estr_player_玩家, o_card_卡牌实例)
    local o_misc = G.misc()
    if not estr_player_玩家 then 
        return 
    end
    if o_misc.卡牌数量 == nil then 
        o_misc.卡牌数量 = {}
    end
    -- TODO: 添加卡牌实例
    o_misc.卡牌数量[estr_player_玩家] = o_misc.卡牌数量[estr_player_玩家] or 0
    o_misc.卡牌数量[estr_player_玩家] = o_misc.卡牌数量[estr_player_玩家] + 1

    if G.call('角色_身份是自己', estr_player_玩家) then
        G.call('网络通用_广播消息', '角色_添加手牌', estr_player_玩家)
    end
end

--hide=true
t['角色_移除手牌'] = function(estr_player_玩家, o_card_卡牌实例)
    local o_misc = G.misc()
    if not estr_player_玩家 then 
        return 
    end
    if o_misc.卡牌数量 == nil then 
        o_misc.卡牌数量 = {}
    end
    o_misc.卡牌数量[estr_player_玩家] = o_misc.卡牌数量[estr_player_玩家] or 0
    o_misc.卡牌数量[estr_player_玩家] = o_misc.卡牌数量[estr_player_玩家] - 1
    if o_misc.卡牌数量[estr_player_玩家] < 0 then 
        o_misc.卡牌数量[estr_player_玩家] = 0
    end
    if G.call('角色_身份是自己', estr_player_玩家) then
        G.call('网络通用_广播消息', '角色_移除手牌', estr_player_玩家)
    end
end

--hide=true
t['角色_获取手牌数量'] = function(estr_player_玩家)
    local o_misc = G.misc()
    return o_misc.卡牌数量[estr_player_玩家]
end

t['角色_身份是自己'] = function (estr_player_玩家)
    return estr_player_玩家 == G.misc().玩家信息.身份标识
end

t['角色_获取自己身份标识'] = function ()
    return G.misc().玩家信息.身份标识
end

t['角色_获取对手身份标识'] = function (estr_player_玩家)
    for k, v in ipairs(G.misc().对决玩家信息列表) do 
        if v ~= G.misc().玩家信息.身份标识 then 
            return v.身份标识
        end
    end
    return ""
end
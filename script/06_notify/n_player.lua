local G = require "gf"
local noti = G.notify

function noti.角色_添加手牌(estr_player_玩家)
    local script_战场

    estr_player_玩家 = estr_player_玩家 or '我方'
    -- TODO: 判断当前游戏模式
    if true then 
        -- TODO: 1v1 条件
        script_战场 = G.getUI('v_battle_1v1').c_battle_1v1
    else
        -- TODO: 2v2 条件
        script_战场 = G.getUI('v_battle_2v2').c_battle_2v2
    end
    script_战场:AddPlayerCard(estr_player_玩家)

    local cardCount = G.call('角色_获取手牌数量', estr_player_玩家)
    local node_animactor = script_战场:GetAnimActor(estr_player_玩家)
    local c_animactor = node_animactor.c_animactor
    c_animactor.__o_animquest = {
        [1] = {
            [1] = G.call('动画系统_创建quest', c_animactor, G.QueryName(0x10010005 + cardCount - 1)),
        },
    }
    c_animactor:run_animactor()
end

function noti.角色_移除手牌(estr_player_玩家)
    local script_战场

    estr_player_玩家 = estr_player_玩家 or '我方'
    -- TODO: 判断当前游戏模式
    if true then 
        -- TODO: 1v1 条件
        script_战场 = G.getUI('v_battle_1v1').c_battle_1v1
    else
        -- TODO: 2v2 条件
        script_战场 = G.getUI('v_battle_2v2').c_battle_2v2
    end
    script_战场:RemovePlayerCard(estr_player_玩家, 1)

    local cardCount = G.call('角色_获取手牌数量', estr_player_玩家)
    local node_animactor = script_战场:GetAnimActor(estr_player_玩家)
    local c_animactor = node_animactor.c_animactor
    c_animactor.__o_animquest = {
        [1] = {
            [1] = G.call('动画系统_创建quest', c_animactor, G.QueryName(0x10010005 + cardCount - 1)),
        },
    }
    c_animactor:run_animactor()
end
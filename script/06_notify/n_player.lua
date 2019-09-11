local G = require "gf"
local noti = G.notify

function noti.角色_添加手牌_相对身份(estr_player_玩家)
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
end

function noti.角色_移除手牌_相对身份(estr_player_玩家)
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
end
local G = require "gf"
local noti = G.notify

function noti.角色_添加手牌_绝对身份(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_动画系统 = o_misc.主动画系统
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    local script_手牌组件
    local int_当前手牌数量
    if estr_player_相对身份 == '我方' then
        script_手牌组件 = script_战场.selfHandcard.c_handcards_self
        int_当前手牌数量 =  G.call('角色_获取手牌数量', estr_player_相对身份)
    elseif estr_player_相对身份 == '敌方1' then
        script_手牌组件 = script_战场.enemyHandcard.c_handcards_enemy
        int_当前手牌数量 =  G.call('角色_获取手牌数量', estr_player_相对身份)
    else
        return
    end

    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 200, {
            {script_手牌组件.addCard, script_手牌组件, G.QueryName(i_card_卡牌)},
        })
    )
    script_动画系统:add_animquest(
        G.call('动画系统_创建quest', script_动画系统, G.QueryName(script_手牌组件.AnimBaseID + int_当前手牌数量 - 1))
    )
end

function noti.角色_移除手牌_绝对身份(estr_absolute_id_type_绝对身份, int_手牌序号)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_动画系统 = o_misc.主动画系统
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    local script_手牌组件
    local int_当前手牌数量
    if estr_player_相对身份 == '我方' then
        script_手牌组件 = script_战场.selfHandcard.c_handcards_self
        int_当前手牌数量 =  G.call('角色_获取手牌数量', estr_player_相对身份)
    elseif estr_player_相对身份 == '敌方1' then
        script_手牌组件 = script_战场.enemyHandcard.c_handcards_enemy
        int_当前手牌数量 =  G.call('角色_获取手牌数量', estr_player_相对身份)
    else
        return
    end

    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, false, 30, {
            {script_手牌组件.removeCard, script_手牌组件, int_手牌序号},
        })
    )
    if int_当前手牌数量 > 0 then
        script_动画系统:add_animquest(
            G.call('动画系统_创建quest', script_动画系统, G.QueryName(script_手牌组件.AnimBaseID + int_当前手牌数量 - 1))
        )
    end
end

function noti.角色_战场_设置英雄_绝对身份(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_动画系统 = o_misc.主动画系统
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    local script_战场英雄组件
    if estr_player_相对身份 == '我方' then
        script_战场英雄组件 = script_战场.selfBattlehero.c_battlehero_self
    elseif estr_player_相对身份 == '敌方1' then
        script_战场英雄组件 = script_战场.enemyBattlehero.c_battlehero_enemy
    else
        return
    end

    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 200, {
            {script_战场英雄组件.setData, script_战场英雄组件, G.QueryName(i_card_卡牌)},
        })
    )
end

function noti.角色_战场_设置英雄技能_绝对身份(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_动画系统 = o_misc.主动画系统
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    local script_战场英雄组件
    if estr_player_相对身份 == '我方' then
        script_战场英雄组件 = script_战场.selfBattlehero.c_battlehero_self
    elseif estr_player_相对身份 == '敌方1' then
        script_战场英雄组件 = script_战场.enemyBattlehero.c_battlehero_enemy
    else
        return
    end

    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 200, {
            {script_战场英雄组件.setData, script_战场英雄组件, G.QueryName(i_card_卡牌)},
        })
    )
end

function noti.角色_战场_设置武器_绝对身份(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_动画系统 = o_misc.主动画系统
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    local script_战场英雄组件
    if estr_player_相对身份 == '我方' then
        script_战场英雄组件 = script_战场.selfBattlehero.c_battlehero_self
    elseif estr_player_相对身份 == '敌方1' then
        script_战场英雄组件 = script_战场.enemyBattlehero.c_battlehero_enemy
    else
        return
    end

    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 200, {
            {script_战场英雄组件.setData, script_战场英雄组件, G.QueryName(i_card_卡牌)},
        })
    )
end

function noti.角色_战场_添加随从_绝对身份(estr_absolute_id_type_绝对身份, i_card_卡牌, int_随从编号)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    local script_战场随从组件
    if estr_player_相对身份 == '我方' then
        script_战场随从组件 = script_战场.selfBattleminion.c_battleminion_self
    elseif estr_player_相对身份 == '敌方1' then
        script_战场随从组件 = script_战场.enemyBattleminion.c_battleminion_enemy
    else
        return
    end

    script_战场随从组件:addMinion(G.QueryName(i_card_卡牌), int_随从编号)
    script_战场随从组件:set_minion_pos()
end

function noti.角色_设置水晶数据_绝对身份(estr_absolute_id_type_绝对身份, estr_mana_type_修改类型, int_value)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_动画系统 = o_misc.主动画系统
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    local script_水晶组件
    if estr_player_相对身份 == '我方' then
        script_水晶组件 = script_战场.selfBattlemana.c_battlemana_self
    elseif estr_player_相对身份 == '敌方1' then
        script_水晶组件 = script_战场.enemyBattlemana.c_battlemana_enemy
    else
        return
    end

    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, false, 30, {
            {G.api.com_set_value, script_水晶组件, estr_mana_type_修改类型, int_value},
        })
    )
end

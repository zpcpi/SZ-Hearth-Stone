local G = require "gf"
local noti = G.notify

function noti.卡牌逻辑效果整理(last_call)
    if last_call then
    else
        return
    end

    local treestr = {}
    local tabc = 0
    local tl = function(v)
        table.insert(treestr, v)
    end
    local tlt = function(v)
        table.insert(treestr, string.rep('\t', tabc) .. v)
    end

    local function iter (funs, children, info)
        tlt('*[' .. funs .. ']')
        
        if info then
            -- 释放玩家
            if info['Player'] and info['Player'] ~= '我方' then
                tl('(Player:')
                tl(info['Player'])
                tl(')')
            end

            -- 施法者
            if info['Caster'] then
                tl('(Caster:')
                tl(info['Caster'].showname)
                tl(')')
            end

            -- 目标
            if info['Target'] and (#info['Target'] > 0) then
                tl('(Target:')
                for _,tar in ipairs(info['Target']) do
                    tl(tar.showname .. ',')
                end
                tl(')')
            end
        end
        tl('\n')

        if children and (#children > 0) then
            tabc = tabc + 1
            for _, data in ipairs(children) do
                iter(data['funs'], data['children'], data['skill_info'])
            end
            tabc = tabc - 1
        end
    end

    iter(last_call['funs'], last_call['children'], last_call['skill_info'])
    print(table.concat(treestr, ''))
end


local push_quote = function (Card)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_动画系统 = o_misc.技能动画系统
    local get_attr = CARD_GET_ATTR
    local estr_absolute_id_type_绝对身份 = get_attr(Card, '动态数据', '所有者')
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    local script_战场随从组件
    if estr_player_相对身份 == '我方' then
        script_战场随从组件 = script_战场.selfBattleminion.c_battleminion_self
    elseif estr_player_相对身份 == '敌方1' then
        script_战场随从组件 = script_战场.enemyBattleminion.c_battleminion_enemy
    else
        return
    end

    local obj = script_战场随从组件:get_obj_bycard(Card)

    return function (key)
        script_动画系统:push_quote(key, obj)
    end
end

local pop_quote = function (key)
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    script_动画系统:pop_quote(key)
end

-- 本地玩家动画
local precall = '*本地*前置动画*_'
local postcall = '*本地*后置动画*_'
noti[precall .. '卡牌使用_攻击'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]
    
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    -- 攻击前往后退
    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 200, {
            [1] = {push_quote(Caster), '::sys_normal_attck_Caster'},
            [2] = {push_quote(Target), '::sys_normal_attck_Target'},
            [3] = {'动画系统_两控件相向运动', '::sys_normal_attck_Caster', '::sys_normal_attck_Target', {'x', 'y'}, {-0.3, 50}, {
                ['x1']=0,
                ['y1']=0.5,
                ['x2']=0.5,
                ['y2']=1,
            }},
            [4] = {pop_quote, '::sys_normal_attck_Caster'},
            [5] = {pop_quote, '::sys_normal_attck_Target'},
        })
    )
end

noti[precall .. 'normal_attck'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]
    
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    -- 攻击前移动
    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 200) -- 空等一会
    )
    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 100, {
            [1] = {push_quote(Caster), '::sys_normal_attck_Caster'},
            [2] = {push_quote(Target), '::sys_normal_attck_Target'},
            [3] = {'动画系统_两控件相向运动', '::sys_normal_attck_Caster', '::sys_normal_attck_Target', {'x', 'y'}, {0.9, -60}, {
                ['x1']=0,
                ['y1']=0.5,
                ['x2']=0.5,
                ['y2']=1,
            }},
            [4] = {pop_quote, '::sys_normal_attck_Caster'},
            [5] = {pop_quote, '::sys_normal_attck_Target'},
        })
    )
end

noti[postcall .. 'normal_attck'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]
    
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_动画系统 = o_misc.技能动画系统
    local estr_absolute_id_type_绝对身份 = get_attr(Caster, '动态数据', '所有者')
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    local script_战场随从组件
    if estr_player_相对身份 == '我方' then
        script_战场随从组件 = script_战场.selfBattleminion.c_battleminion_self
    elseif estr_player_相对身份 == '敌方1' then
        script_战场随从组件 = script_战场.enemyBattleminion.c_battleminion_enemy
    else
        return
    end

    -- 攻击后返回
    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 300, {
            {script_战场随从组件.set_minion_pos, script_战场随从组件}
        })
    )
end




noti[precall .. 'single_damage'] = function ()




end






function noti.卡牌动画_前置调用(funs, ...)
    if noti[precall .. funs] then
        noti[precall .. funs](...)
    end
end

function noti.卡牌动画_后置调用(funs, ...)
    if noti[postcall .. funs] then
        noti[postcall .. funs](...)
    end
end


function noti.卡牌动画效果整理(last_call)









end
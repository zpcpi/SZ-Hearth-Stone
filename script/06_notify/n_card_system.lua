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

local com_mapping = {
    ['我方'] = {
        ['战场随从'] = {'selfBattleminion', 'c_battleminion_self'},
        ['战场英雄'] = {'selfBattlehero', 'c_battlehero_self'},
        ['手牌'] = {'selfHandcard', 'c_handcards_self'},
        ['牌库'] = {'carddeck', 'c_carddeck'},
    },
    ['敌方1'] = {
        ['战场随从'] = {'enemyBattleminion', 'c_battleminion_enemy'},
        ['战场英雄'] = {'enemyBattlehero', 'c_battlehero_enemy'},
        ['手牌'] = {'enemyHandcard', 'c_handcards_enemy'},
    },
}

local get_component = function (estr_player_相对身份, estr_ui_component_控件类型)
    local get_attr = CARD_GET_ATTR

    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统

    print('asd', estr_player_相对身份, estr_ui_component_控件类型)

    local attrlist = get_attr(com_mapping, estr_player_相对身份, estr_ui_component_控件类型)
    if attrlist then
        local result = script_战场
        for _, attr in ipairs(attrlist) do
            result = result[attr]
        end
        return result
    end
end

local push_quote = function (Card)
    local get_attr = CARD_GET_ATTR

    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统

    local obj
    local cardpos = get_attr(Card, '动态数据', '卡牌位置')
    local estr_absolute_id_type_绝对身份 = get_attr(Card, '动态数据', '所有者')
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)
    if cardpos == '战场' then
        local cardtype = get_attr(Card, '逻辑数据', '类型')
        if cardtype == 0x10090001 then
            -- 英雄
            if Card == G.call('角色_战场_获取英雄', estr_player_相对身份) then
                local script_战场组件 = get_component(estr_player_相对身份, '战场英雄')
                obj = script_战场组件.英雄.c_card_manager.cur_obj
            end
        elseif cardtype == 0x10090003 then
            -- 英雄技能
            if Card == G.call('角色_战场_获取英雄技能', estr_player_相对身份) then
                local script_战场组件 = get_component(estr_player_相对身份, '战场英雄')
                obj = script_战场组件.英雄技能.c_card_manager.cur_obj
            end
        elseif cardtype == 0x10090004 then
            -- 随从
            local script_战场组件 = get_component(estr_player_相对身份, '战场随从')
            obj = script_战场组件:get_obj_bycard(Card)
        elseif cardtype == 0x10090006 then
            -- 武器
            if Card == G.call('角色_战场_获取武器', estr_player_相对身份) then
                local script_战场组件 = get_component(estr_player_相对身份, '战场英雄')
                obj = script_战场组件.武器.c_card_manager.cur_obj
            end
        else
            return
        end
    elseif cardpos == '手牌' then
    elseif cardpos == '牌库' then
    end

    local script_动画系统 = o_misc.技能动画系统
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
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 150, {
            [1] = {push_quote(Caster), '::sys_normal_attck_Caster'},
            [2] = {push_quote(Target), '::sys_normal_attck_Target'},
            [3] = {'动画系统_两控件相向运动', '::sys_normal_attck_Caster', '::sys_normal_attck_Target', {'x', 'y'}, {-0.1, 35}, {
                ['x1']=0,
                ['y1']=0.2,
                ['x2']=0.9,
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
    local cardtype = get_attr(Caster, '逻辑数据', '类型')
    local pos_info
    if cardtype == 0x10090001 then
        -- 英雄
        pos_info = {0.99, -100}
    elseif cardtype == 0x10090004 then
        -- 随从
        pos_info = {0.99, -60}
    end

    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 200) -- 空等一会
    )
    script_动画系统:add_animquest(
        G.call('动画系统_创建quest_自定义', script_动画系统, true, 100, {
            [1] = {push_quote(Caster), '::sys_normal_attck_Caster'},
            [2] = {push_quote(Target), '::sys_normal_attck_Target'},
            [3] = {'动画系统_两控件相向运动', '::sys_normal_attck_Caster', '::sys_normal_attck_Target', {'x', 'y'}, pos_info, {
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

noti[postcall .. '卡牌使用_攻击'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]
    
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统
    local estr_absolute_id_type_绝对身份 = get_attr(Caster, '动态数据', '所有者')
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    -- 攻击后返回
    local cardtype = get_attr(Caster, '逻辑数据', '类型')
    local pos_info
    if cardtype == 0x10090001 then
        -- 英雄
        script_动画系统:add_animquest(
            G.call('动画系统_创建quest_自定义', script_动画系统, true, 300, {
                [1] = {push_quote(Caster), '::sys_normal_attck_Caster'},
                [2] = {'动画系统_多属性设置', '::sys_normal_attck_Caster', {'x', 'y'}, {0, 0}, {
                    ['x1']=0,
                    ['y1']=0.5,
                    ['x2']=0.5,
                    ['y2']=1,
                }},
                [3] = {pop_quote, '::sys_normal_attck_Caster'},
            })
        )
    elseif cardtype == 0x10090004 then
        -- 随从
        local script_战场随从组件 = get_component(estr_player_相对身份, '战场随从')
        script_动画系统:add_animquest(
            G.call('动画系统_创建quest_自定义', script_动画系统, true, 300, {
                {script_战场随从组件.set_minion_pos, script_战场随从组件}
            })
        )
    end
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
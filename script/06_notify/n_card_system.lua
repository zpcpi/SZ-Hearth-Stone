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

local create_missile = function (caster_obj)



end

local anim_stack = G.call('create_stack')
local anim_addchild = function (anim)
    local parent_anim = anim_stack.top()
    if parent_anim then
        if parent_anim['child_quests'] then
        else
            parent_anim['child_quests'] = {}
        end
        table.insert(parent_anim['child_quests'], anim)
    end
end

-- 动画状态
local is_create_missile = 0

-- 本地玩家动画
local precall = '*本地*前置动画*_'
local postcall = '*本地*后置动画*_'
noti[precall .. '卡牌攻击_主流程_thread'] = function ()
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 30)
    anim_addchild(o_animquest_当前动画)
    anim_stack.push(o_animquest_当前动画)
end

noti[postcall .. '卡牌攻击_主流程_thread'] = function ()
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    local o_animquest_当前动画 = anim_stack.pop()
    -- 播放动画
    script_动画系统:add_animquest(o_animquest_当前动画)
end

noti[precall .. '卡牌使用_主流程_thread'] = function ()
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 30)
    anim_addchild(o_animquest_当前动画)
    anim_stack.push(o_animquest_当前动画)
end

noti[postcall .. '卡牌使用_主流程_thread'] = function ()
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    local o_animquest_当前动画 = anim_stack.pop()
    -- 播放动画
    script_动画系统:add_animquest(o_animquest_当前动画)
end

noti[precall .. '卡牌使用_攻击'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]
    
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    -- 攻击前往后退
    local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, true, 150, {
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
    anim_addchild(o_animquest_当前动画)
    anim_stack.push(o_animquest_当前动画)
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
    local o_animquest_当前动画
    local pos_info
    if cardtype == 0x10090001 then
        -- 英雄
        o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, true, 300, {
                [1] = {push_quote(Caster), '::sys_normal_attck_Caster'},
                [2] = {'动画系统_多属性设置', '::sys_normal_attck_Caster', {'x', 'y'}, {0, 0}, {
                    ['x1']=0,
                    ['y1']=0.5,
                    ['x2']=0.5,
                    ['y2']=1,
                }},
                [3] = {pop_quote, '::sys_normal_attck_Caster'},
            })
    elseif cardtype == 0x10090004 then
        -- 随从
        local script_战场随从组件 = get_component(estr_player_相对身份, '战场随从')
        local set_minion_pos = function (com)
            script_战场随从组件:set_minion_pos()
        end
        o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, true, 300, {
                {set_minion_pos}
            })
    end

    anim_addchild(o_animquest_当前动画)
    anim_stack.pop()
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

    local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, true, 200) -- 空等一会
    anim_addchild(o_animquest_当前动画)

    o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, true, 100, {
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
    anim_addchild(o_animquest_当前动画)
end

noti[postcall .. 'single_damage'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]
    local int_伤害值 = get_attr(last_call, 'skill_info', 'Value')[1]
    
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    if is_create_missile > 0 then
    else
        -- 不发射飞弹
        if int_伤害值 and (int_伤害值 > 0) then
            local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                    {G.trig_event, 'UI_卡牌战斗信息', Target, '伤害', int_伤害值},
                })
            anim_addchild(o_animquest_当前动画)
        end
    end
end

noti[postcall .. 'single_heal'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]
    local int_治疗值 = get_attr(last_call, 'skill_info', 'Value')[1]
    
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    if int_治疗值 and (int_治疗值 > 0) then
        local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                {G.trig_event, 'UI_卡牌战斗信息', Target, '治疗', int_治疗值},
            })
        anim_addchild(o_animquest_当前动画)
    end
end

noti[postcall .. '卡牌属性_设置'] = function (o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, int_value)
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统
    
    local value = G.call('卡牌属性_获取', o_card_当前卡牌, estr_cardattr_enum_属性名, '当前值')
    local attr

    if estr_cardattr_enum_属性名 == '费用' then
        attr = 'cost'
    elseif estr_cardattr_enum_属性名 == '攻击' then
        attr = 'atk'
    elseif estr_cardattr_enum_属性名 == '生命' then
        attr = 'hp'
    elseif estr_cardattr_enum_属性名 == '护甲' then
        attr = 'ap'
    elseif estr_cardattr_enum_属性名 == '攻击次数' then
        attr = '攻击框'
        local is_show = false
        
        if G.call('角色攻击次数判断', {['Caster']=o_card_当前卡牌}) then
            is_show = true
        end

        local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, true, 5, {
                {G.trig_event, 'UI_卡牌状态更新', o_card_当前卡牌, attr, is_show},
            })
        anim_addchild(o_animquest_当前动画)

        return
    end

    local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, true, 5, {
            {G.trig_event, 'UI_卡牌属性更新', o_card_当前卡牌, attr, value},
        })
    anim_addchild(o_animquest_当前动画)
end

noti[precall .. '技能效果_伤害'] = function ()
    -- 所有非攻击造成的伤害，都发射飞弹
    is_create_missile = is_create_missile + 1
end

noti[postcall .. '技能效果_伤害'] = function ()
    -- 清除发射飞弹状态
    is_create_missile = is_create_missile - 1
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

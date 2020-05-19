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

local function o2i(card)
    return card.name
end

local function i2o(i_card)
    return G.QueryName(i_card)
end

local com_mapping = {
    ['我方'] = {
        ['战场随从'] = {'selfBattleminion', 'c_battleminion_self'},
        ['战场英雄'] = {'selfBattlehero', 'c_battlehero_self'},
        ['执行队列'] = {'selfPlayQueue'},
        ['手牌'] = {'selfHandcard', 'c_handcards_self'},
        ['牌库'] = {'carddeck', 'c_carddeck'},
        ['水晶'] = {'selfBattlemana', 'c_battlemana_self'},
        ['发现'] = {'choose'}
    },
    ['敌方1'] = {
        ['战场随从'] = {'enemyBattleminion', 'c_battleminion_enemy'},
        ['战场英雄'] = {'enemyBattlehero', 'c_battlehero_enemy'},
        ['执行队列'] = {'enemyPlayQueue'},
        ['手牌'] = {'enemyHandcard', 'c_handcards_enemy'},
        ['水晶'] = {'enemyBattlemana', 'c_battlemana_enemy'},
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

local get_obj_bycard = function (Card)
    local get_attr = CARD_GET_ATTR

    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统

    local obj
    local cardpos = get_attr(Card, '动态数据', '卡牌位置')
    local estr_absolute_id_type_绝对身份 = get_attr(Card, '动态数据', '所有者')
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)

    -- 战场上找找
    if not obj then
        local cardtype = get_attr(Card, '逻辑数据', '类型')
        if cardtype == 0x10090001 then
            -- 英雄
            if Card == G.call('角色_战场_获取英雄', estr_player_相对身份) then
                local script_战场组件 = get_component(estr_player_相对身份, '战场英雄')
                if script_战场组件 then
                    obj = script_战场组件.英雄.c_card_manager.cur_obj
                end
            end
        elseif cardtype == 0x10090003 then
            -- 英雄技能
            if Card == G.call('角色_战场_获取英雄技能', estr_player_相对身份) then
                local script_战场组件 = get_component(estr_player_相对身份, '战场英雄')
                if script_战场组件 then
                    obj = script_战场组件.英雄技能.c_card_manager.cur_obj
                end
            end
        elseif cardtype == 0x10090004 then
            -- 随从
            local script_战场组件 = get_component(estr_player_相对身份, '战场随从')
            if script_战场组件 then
                obj = script_战场组件:get_obj_bycard(Card)
            end
        elseif cardtype == 0x10090006 then
            -- 武器
            if Card == G.call('角色_战场_获取武器', estr_player_相对身份) then
                local script_战场组件 = get_component(estr_player_相对身份, '战场英雄')
                if script_战场组件 then
                    obj = script_战场组件.武器.c_card_manager.cur_obj
                end
            end
        end
    end

    if not obj then
        -- 指令队列找找
        local script_队列组件 = get_component(estr_player_相对身份, '执行队列')
        if script_队列组件 then
            obj = script_队列组件:get_obj_bycard(Card)
        end

        if obj then
        else
            -- 在真的手牌找吧
        end
    end

    if not obj then
        -- 发现的卡没有位置
        local script_战场组件 = get_component(estr_player_相对身份, '发现')
        if script_战场组件 then
            obj = script_战场组件:get_obj_bycard(Card)
        end
    end

    return obj
end

local create_missile = function (caster_obj, color)
    if caster_obj then
        local posx, posy = caster_obj.localToGlobal(0, 0)

        local o_misc = G.misc()
        local script_战场 = o_misc.主战场系统

        local obj_missile = script_战场:add_missile(posx, posy)

        if obj_missile then
            obj_missile.color = color
        end

        return obj_missile
    end
end

local create_newcard = function (Card)


end

local push_quote = function (obj)
    local o_misc = G.misc()
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

local info_stack = G.call('create_stack')
local info_addchild = function (info)
    local parent_info = info_stack.top()
    if parent_info then
        if parent_info['child_quests'] then
        else
            parent_info['child_quests'] = {}
        end
        table.insert(parent_info['child_quests'], info)
    end
end

local info_getlast = function ()
    local parent_info = info_stack.top()

    local function iter(info)
        local children = info['child_quests']
        if (type(children) == 'table') and (#children > 0) then
            iter(children[#children])
        else
            return info
        end
    end

    return iter(parent_info)
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

local anim_getlast = function ()
    local parent_anim = anim_stack.top()

    local function iter(anim)
        local children = anim['child_quests']
        if (type(children) == 'table') and (#children > 0) then
            iter(children[#children])
        else
            return anim
        end
    end

    return iter(parent_anim)
end

-- 动画状态
local is_create_missile = 0

-- 共用动画信息
local preinfo = '*共用*前置信息*_'
local postinfo = '*共用*后置信息*_'

-- 本地玩家动画
local precall = '*本地*前置动画*_'
local postcall = '*本地*后置动画*_'

local infoquest_push = function ()
    local info = {precall .. 'precall'}

    info_addchild(info)
    info_stack.push(info)
end
local infoquest_pop = function ()
    local info = {postcall .. 'postcall'}
    info_addchild(info)

    local final_info = info_stack.pop()

    if final_info then
        -- 本地执行动画
        G.call('run_infoquest', final_info)

        -- 传递信息
        if G.call('网络通用_能否广播') then
            G.call('网络通用_广播消息', 'run_infoquest', final_info)
        end
    end
end

G.api['run_infoquest'] = function (info)
    local children = info['child_quests']

    -- 注册动画序列
    info['child_quests'] = nil
    G.call(info)

    -- 执行子动画farg
    if (type(children) == 'table') and (#children > 0) then
        for _, child in ipairs(children) do
            G.call('run_infoquest', child)
        end
    end
end

local animquest_push = function ()
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, true, 0)
    anim_addchild(o_animquest_当前动画)
    anim_stack.push(o_animquest_当前动画)
end

local animquest_pop = function ()
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    local o_animquest_当前动画 = anim_stack.pop()
    -- 播放动画
    script_动画系统:add_animquest(o_animquest_当前动画)
    script_动画系统:add_animquest(G.call('动画系统_创建quest_自定义', script_动画系统, true, 300))
end

-- 默认动画组装入口
noti[precall .. 'precall'] = animquest_push
noti[postcall .. 'postcall'] = animquest_pop

do
    local func_list = {
        '卡牌攻击_主流程_thread',
        '卡牌使用_主流程_thread',
        '逻辑注册_初始流程_absolute',
        '逻辑注册_水晶设置_absolute',
        '逻辑注册_抽牌_absolute',
        '逻辑注册_攻击次数重置_回合开始_absolute',
        '逻辑注册_攻击状态设置_回合结束_absolute',
        '逻辑注册_武器功能_回合开始_absolute',
        '逻辑注册_武器功能_回合结束_absolute',
        '逻辑注册_回合结束_冻结删除判断_absolute',
    }

    for _,func in ipairs(func_list) do
        noti[preinfo .. func] = infoquest_push
        noti[postinfo .. func] = infoquest_pop
        noti[precall .. func] = animquest_push
        noti[postcall .. func] = animquest_pop
    end
end

-- 卡牌使用_使用
noti[preinfo .. '卡牌使用_使用'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')

    local info = {precall .. '卡牌使用_使用', Caster.name}

    info_addchild(info)
    info_stack.push(info)
end

noti[postinfo .. '卡牌使用_使用'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')

    local info = {postcall .. '卡牌使用_使用', Caster.name}

    info_addchild(info)
    info_stack.pop(info)
end

noti[precall .. '卡牌使用_使用'] = function (Casterid)
    local get_attr = CARD_GET_ATTR

    local Caster = G.QueryName(Casterid)
    local Player = G.call('房间_获取相对身份', get_attr(Caster, '动态数据', '所有者'))

    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统
    local script_战场 = o_misc.主战场系统
    local script_PlayQueue = get_component(Player, '执行队列')

    local cardtype = get_attr(Caster, '逻辑数据', '类型')

    local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 0)

    if get_obj_bycard(Caster) then
    else
        -- 没有获取到控件
        script_PlayQueue:queue_addobj(Caster)
        script_PlayQueue:queue_posinit()
    end
    local obj = get_obj_bycard(Caster)

    if cardtype == 0x10090003 then
        -- 英雄技能
    elseif cardtype == 0x10090004 then
        -- 随从
        local del_obj = function ()
            local obj = script_PlayQueue:queue_popobj(Caster)
            script_PlayQueue:queue_removeobj(obj)
        end

        o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 0, {
            {del_obj}
        })
    elseif cardtype == 0x10090005 then
        -- 法术
        local push_queue_quote = function (Caster, string_obj)
            local obj = script_PlayQueue:queue_popobj(Caster)
            script_动画系统:push_quote(string_obj, obj)
        end

        o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, true, 500, {
            [1] = {push_queue_quote, Caster, '::sys_queue_Caster'},
            [2] = {'动画系统_设置全局位置', '::sys_queue_Caster', {'x', 'y'}, {UI_SPELL_SHOW_POS['posx'], UI_SPELL_SHOW_POS['posy']}, {
                ['x1']=0,
                ['y1']=0.5,
                ['x2']=0.5,
                ['y2']=1,
            }},
            [3] = {'动画系统_多属性设置', '::sys_queue_Caster', {'scaleX', 'scaleY'}, {0.5, 0.5}, {
                ['x1']=0,
                ['y1']=0.5,
                ['x2']=0.5,
                ['y2']=1,
            }},
            [4] = {pop_quote, '::sys_queue_Caster'}
        }, {
            [1] = G.call('动画系统_创建quest_自定义', script_动画系统, true, 1000),
        })
    elseif cardtype == 0x10090005 then
        -- 武器
        local del_obj = function ()
            local obj = script_selfPlayQueue:queue_popobj(Caster)
            script_selfPlayQueue:queue_removeobj(obj)
        end

        o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 0, {
            {del_obj}
        })
    end

    anim_addchild(o_animquest_当前动画)
    anim_stack.push(o_animquest_当前动画)
end

noti[postcall .. '卡牌使用_使用'] = function (Casterid)
    local get_attr = CARD_GET_ATTR
    
    local Caster = G.QueryName(Casterid)
    local Player = G.call('房间_获取相对身份', get_attr(Caster, '动态数据', '所有者'))

    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统
    local script_PlayQueue = get_component(Player, '执行队列')

    local cardtype = get_attr(Caster, '逻辑数据', '类型')

    if cardtype == 0x10090005 then
        -- 法术
        local obj = get_obj_bycard(Caster)

        if obj then
            local del_queueobj = function ()
                script_PlayQueue:queue_removeobj(obj)
            end
            -- 法术
            local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                [1] = {push_quote(obj), '::sys_queue_Caster'},
                [2] = {'动画系统_多属性设置', '::sys_queue_Caster', {'alpha'}, {1}, {
                    ['x1']=0,
                    ['y1']=0.5,
                    ['x2']=0.5,
                    ['y2']=1,
                }},
                [3] = {pop_quote, '::sys_queue_Caster'},
            },{
                [1] = G.call('动画系统_创建quest_自定义', script_动画系统, false, 10, {
                    {del_queueobj},
                })
            })

            anim_addchild(o_animquest_当前动画)
        end
    end

    anim_stack.pop()
end

-- 卡牌使用_攻击
noti[preinfo .. '卡牌使用_攻击'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]

    local info = {precall .. '卡牌使用_攻击', Caster.name, Target.name}

    info_addchild(info)
    info_stack.push(info)
end

noti[postinfo .. '卡牌使用_攻击'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]

    local info = {postcall .. '卡牌使用_攻击', Caster.name, Target.name}

    info_addchild(info)
    info_stack.pop(info)
end

noti[precall .. '卡牌使用_攻击'] = function (Casterid, Targetid)
    local get_attr = CARD_GET_ATTR

    local Caster = G.QueryName(Casterid)
    local Target = G.QueryName(Targetid)

    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    -- 攻击前往后退
    local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, true, 150, {
            [1] = {push_quote(get_obj_bycard(Caster)), '::sys_normal_attck_Caster'},
            [2] = {push_quote(get_obj_bycard(Target)), '::sys_normal_attck_Target'},
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

noti[postcall .. '卡牌使用_攻击'] = function (Casterid, Targetid)
    local get_attr = CARD_GET_ATTR

    local Caster = G.QueryName(Casterid)
    local Target = G.QueryName(Targetid)
    
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
                [1] = {push_quote(get_obj_bycard(Caster)), '::sys_normal_attck_Caster'},
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

-- normal_attck
noti[preinfo .. 'normal_attck'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]

    local info = {precall .. 'normal_attck', Caster.name, Target.name}

    info_addchild(info)
end

noti[precall .. 'normal_attck'] = function (Casterid, Targetid)
    local get_attr = CARD_GET_ATTR

    local Caster = G.QueryName(Casterid)
    local Target = G.QueryName(Targetid)

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
            [1] = {push_quote(get_obj_bycard(Caster)), '::sys_normal_attck_Caster'},
            [2] = {push_quote(get_obj_bycard(Target)), '::sys_normal_attck_Target'},
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

-- single_damage
noti[preinfo .. 'single_damage'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]
    local int_伤害值 = get_attr(last_call, 'skill_info', 'Value')[1]

    local info = {precall .. 'single_damage', Caster.name, Target.name, int_伤害值}

    info_addchild(info)
    info_stack.push(info)
end

noti[postinfo .. 'single_damage'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local int_伤害值 = get_attr(last_call, 'skill_info', 'Value')[1]

    local info = {postcall .. 'single_damage', int_伤害值}

    info_addchild(info)
    info_stack.pop(info)
end

noti[precall .. 'single_damage'] = function (Casterid, Targetid, int_伤害值)
    local Caster = G.QueryName(Casterid)
    local Target = G.QueryName(Targetid)
    
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    if int_伤害值 and (int_伤害值 > 0) then
        if is_create_missile > 0 then
            -- 注册引用
            local obj_card = get_obj_bycard(Caster)
            local obj_missile
            local push_missile = function (color, string_obj)
                obj_missile = create_missile(obj_card, color)
                script_动画系统:push_quote(string_obj, obj_missile)
            end
            local del_missile = function ()
                -- TODO，确认下到底删了没有...
                if obj_missile then
                    obj_missile.visible = false
                    obj_missile.parent:removeChild(obj_missile)
                end
            end

            local o_animquest_最后动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 0, nil,{
                G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                    [1] = {G.trig_event, 'UI_卡牌战斗信息', Target.name, '伤害', int_伤害值},
                    [2] = {del_missile},
                    [3] = {pop_quote, '::sys_single_damage_Missile'},
                    [4] = {pop_quote, '::sys_single_damage_Target'},
                }),
            })

            local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                [1] = {push_missile, 0x3333CD, '::sys_single_damage_Missile'},
                [2] = {push_quote(get_obj_bycard(Target)), '::sys_single_damage_Target'},
                [3] = {'动画系统_两控件相向运动', '::sys_single_damage_Missile', '::sys_single_damage_Target', {'x', 'y'}, {0.99}, {
                    ['x1']=0,
                    ['y1']=0.2,
                    ['x2']=0.9,
                    ['y2']=1,
                }},
            },{
                o_animquest_最后动画,
            })
            anim_addchild(o_animquest_当前动画)
            anim_stack.push(o_animquest_最后动画)
        else
            -- 不发射飞弹
            local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                    {G.trig_event, 'UI_卡牌战斗信息', Target.name, '伤害', int_伤害值},
                })
            anim_addchild(o_animquest_当前动画)
        end
    end
end

noti[postcall .. 'single_damage'] = function (int_伤害值)
    if int_伤害值 and (int_伤害值 > 0) then
        if is_create_missile > 0 then
            anim_stack.pop()
        end
    end
end

-- single_heal
noti[preinfo .. 'single_heal'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]
    local int_治疗值 = get_attr(last_call, 'skill_info', 'Value')[1]

    local info = {precall .. 'single_heal', Caster.name, Target.name, int_治疗值}

    info_addchild(info)
    info_stack.push(info)
end

noti[postinfo .. 'single_heal'] = function ()
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local int_治疗值 = get_attr(last_call, 'skill_info', 'Value')[1]

    local info = {postcall .. 'single_heal', int_治疗值}

    info_addchild(info)
    info_stack.pop(info)
end

noti[precall .. 'single_heal'] = function (Casterid, Targetid, int_治疗值)
    local Caster = G.QueryName(Casterid)
    local Target = G.QueryName(Targetid)
    
    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    if int_治疗值 and (int_治疗值 > 0) then
        if is_create_missile > 0 then
            -- 注册引用
            local obj_card = get_obj_bycard(Caster)
            local obj_missile
            local push_missile = function (color, string_obj)
                obj_missile = create_missile(obj_card, color)
                script_动画系统:push_quote(string_obj, obj_missile)
            end
            local del_missile = function ()
                -- TODO，确认下到底删了没有...
                if obj_missile then
                    obj_missile.visible = false
                    obj_missile.parent:removeChild(obj_missile)
                end
            end

            local o_animquest_最后动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 0, nil,{
                G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                    [1] = {G.trig_event, 'UI_卡牌战斗信息', Target.name, '治疗', int_治疗值},
                    [2] = {del_missile},
                    [3] = {pop_quote, '::sys_single_heal_Missile'},
                    [4] = {pop_quote, '::sys_single_heal_Target'},
                }),
            })

            local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                [1] = {push_missile, 0x68EEBC, '::sys_single_heal_Missile'},
                [2] = {push_quote(get_obj_bycard(Target)), '::sys_single_heal_Target'},
                [3] = {'动画系统_两控件相向运动', '::sys_single_heal_Missile', '::sys_single_heal_Target', {'x', 'y'}, {0.99}, {
                    ['x1']=0,
                    ['y1']=0.2,
                    ['x2']=0.9,
                    ['y2']=1,
                }},
            },{
                o_animquest_最后动画,
            })
            anim_addchild(o_animquest_当前动画)
            anim_stack.push(o_animquest_最后动画)
        else
            -- 不发射飞弹
            local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                    {G.trig_event, 'UI_卡牌战斗信息', Target.name, '治疗', int_治疗值},
                })
            anim_addchild(o_animquest_当前动画)
        end
    end
end

noti[postcall .. 'single_heal'] = function (int_治疗值)
    if int_治疗值 and (int_治疗值 > 0) then
        if is_create_missile > 0 then
            anim_stack.pop()
        end
    end
end

-- 卡牌属性_设置
noti[postinfo .. '卡牌属性_设置'] = function (o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, int_value)
    local info = {postcall .. '卡牌属性_设置', o_card_当前卡牌.name, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, int_value}

    info_addchild(info)
end

noti[postcall .. '卡牌属性_设置'] = function (cardid, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, int_value)
    local o_card_当前卡牌 = G.QueryName(cardid)

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

        local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                {G.trig_event, 'UI_卡牌状态更新', o_card_当前卡牌.name, attr, is_show},
            })
        anim_addchild(o_animquest_当前动画)


        -- 临时的，后面需要传完整动画
        -- if G.call('主机_是主机') then 
        --     G.call('网络通用_广播消息', '客机处理回调_抛出事件', 'UI_卡牌状态更新', o_card_当前卡牌.name, attr, is_show)
        -- end

        return
    end

    local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
            {G.trig_event, 'UI_卡牌属性更新', o_card_当前卡牌.name, attr, value},
        })
    anim_addchild(o_animquest_当前动画)

    -- 临时的，后面需要传完整动画
    -- if G.call('主机_是主机') then 
    --     G.call('网络通用_广播消息', '客机处理回调_抛出事件', 'UI_卡牌属性更新', o_card_当前卡牌.name, attr, value)
    -- end
end

-- 技能效果_伤害
noti[preinfo .. '技能效果_伤害'] = function ()
    local info = {precall .. '技能效果_伤害'}

    info_addchild(info)
    info_stack.push(info)
end

noti[postinfo .. '技能效果_伤害'] = function ()
    local info = {postcall .. '技能效果_伤害'}

    info_addchild(info)
    info_stack.pop(info)
end

noti[precall .. '技能效果_伤害'] = function ()
    -- 所有非攻击造成的伤害，都发射飞弹
    is_create_missile = is_create_missile + 1
end

noti[postcall .. '技能效果_伤害'] = function ()
    -- 清除发射飞弹状态
    is_create_missile = is_create_missile - 1
end

-- 技能效果_治疗
noti[preinfo .. '技能效果_治疗'] = function ()
    local info = {precall .. '技能效果_治疗'}

    info_addchild(info)
    info_stack.push(info)
end

noti[postinfo .. '技能效果_治疗'] = function ()
    local info = {postcall .. '技能效果_治疗'}

    info_addchild(info)
    info_stack.pop(info)
end

noti[precall .. '技能效果_治疗'] = function ()
    -- 所有非治疗造成的伤害，都发射飞弹
    is_create_missile = is_create_missile + 1
end

noti[postcall .. '技能效果_治疗'] = function ()
    -- 清除发射飞弹状态
    is_create_missile = is_create_missile - 1
end

-- 角色属性_水晶_设置
noti[postinfo .. '角色属性_水晶_设置'] = function (estr_player_相对身份, estr_mana_type_修改类型, int_value)
    local abPlayer = G.call('房间_获取绝对身份', estr_player_相对身份)
    local info = {postcall .. '角色属性_水晶_设置', abPlayer, estr_mana_type_修改类型, int_value}

    info_addchild(info)
end

noti[postcall .. '角色属性_水晶_设置'] = function (abPlayer, estr_mana_type_修改类型, int_value)
    local estr_player_相对身份 = G.call('房间_获取相对身份', abPlayer)

    local o_misc = G.misc()
    local script_动画系统 = o_misc.技能动画系统

    local script_水晶组件 = get_component(estr_player_相对身份, '水晶')

    local com_set_value = function ()
        script_水晶组件[estr_mana_type_修改类型] = int_value
    end

    local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 30, {
        {com_set_value},
    })
    anim_addchild(o_animquest_当前动画)
end

-- 角色属性_手牌_添加
noti[preinfo .. '角色属性_手牌_添加'] = function (estr_player_相对身份, o_card_卡牌, boolean_是否明牌)
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local Caster = get_attr(last_call, 'skill_info', 'Caster')
    local Target = get_attr(last_call, 'skill_info', 'Target')[1]
    local 卡牌来源 = get_attr(last_call, 'skill_info', '卡牌来源')

    local abPlayer = G.call('房间_获取绝对身份', estr_player_相对身份)
    local info = {
        n = 5,
        precall .. '角色属性_手牌_添加', abPlayer, o_card_卡牌.name, boolean_是否明牌, {
        (Caster or {}).name, (Target or {}).name, 卡牌来源
    }}

    info_addchild(info)
    info_stack.push(info)
end

noti[postinfo .. '角色属性_手牌_添加'] = function (estr_player_相对身份, o_card_卡牌, boolean_是否明牌)
    local abPlayer = G.call('房间_获取绝对身份', estr_player_相对身份)
    local info = {postcall .. '角色属性_手牌_添加', abPlayer, o_card_卡牌.name}

    info_addchild(info)
    info_stack.pop(info)
end

noti[precall .. '角色属性_手牌_添加'] = function (abPlayer, cardid, boolean_是否明牌, last_call)
    local get_attr = CARD_GET_ATTR

    local estr_player_相对身份 = G.call('房间_获取相对身份', abPlayer)
    local o_card_卡牌 = G.QueryName(cardid)
    local Caster = G.QueryName(last_call[1])
    local Target = G.QueryName(last_call[2])
    local 卡牌来源 = last_call[3]

    -- FIXME: 牌库来源改为绝对身份
    local create_obj = nil
    if 卡牌来源 == '我方牌库' then
    elseif 卡牌来源 == '敌方牌库' then
    elseif 卡牌来源 == '敌方英雄' then
    elseif 卡牌来源 == '释放者创造' then
        create_obj = nil
    elseif 卡牌来源 == '目标还原' then
    elseif 卡牌来源 == '发现' then
        create_obj = nil
    else
    end
end

noti[postcall .. '角色属性_手牌_添加'] = function (abPlayer, cardid)
    local estr_player_相对身份 = G.call('房间_获取相对身份', abPlayer)
    local o_card_卡牌 = G.QueryName(cardid)

    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_动画系统 = o_misc.技能动画系统

    if get_obj_bycard(o_card_卡牌) then
        -- 找到已经创建的卡牌
        -- todo，手牌组件得修改一下
        script_动画系统:add_animquest(
            G.call('动画系统_创建quest_自定义', script_动画系统, false, 200, {
                {script_手牌组件.addCard, script_手牌组件, G.QueryName(i_card_卡牌)},
            })
        )
        script_动画系统:add_animquest(
            G.call('动画系统_创建quest', script_动画系统, G.QueryName(script_手牌组件.AnimBaseID + int_当前手牌数量 - 1))
        )
    end
end


local get_flag = function (Card, flags, is_not)
    local result = false
    for _,flag in ipairs(flags) do
        if G.call('卡牌条件_卡牌特性判断', o_card, {flag}) then
            result = true
        end
    end

    if is_not then
        result = not result
    end
    return result
end

local set_flag_obj = function (flags, is_not, attr)
    return function (Card)
        local o_misc = G.misc()
        local script_动画系统 = o_misc.技能动画系统
        local result = get_flag(Card, flags, is_not)
        local o_animquest_当前动画 = G.call('动画系统_创建quest_自定义', script_动画系统, false, 500, {
                {G.trig_event, 'UI_卡牌状态更新', Card.name, attr, result},
            })
        anim_addchild(o_animquest_当前动画)
    end
end

local flag_mapping = {
    ['剧毒'] = set_flag_obj({'剧毒'}, false, '剧毒框'),
    ['吸血'] = set_flag_obj({'吸血'}, false, '吸血框'),
    ['超杀'] = set_flag_obj({'超杀'}, false, '超杀框'),

    ['被动'] = set_flag_obj({'被动'}, false, '被动框'),
    ['亡语'] = set_flag_obj({'亡语'}, false, '亡语框'),
    ['光环'] = set_flag_obj({'光环'}, false, '光环框'),

    ['嘲讽'] = set_flag_obj({'嘲讽'}, false, '嘲讽框'),

    ['圣盾'] = set_flag_obj({'圣盾'}, false, '圣盾框'),
    ['复生'] = set_flag_obj({'复生'}, false, '复生框'),
    ['免疫'] = set_flag_obj({'免疫'}, false, '免疫框'),

    ['冻结'] = set_flag_obj({'冻结'}, false, '冻结框'),

    ['风怒'] = set_flag_obj({'风怒', '超级风怒'}, false, '风怒框'),
    ['超级风怒'] = set_flag_obj({'风怒', '超级风怒'}, false, '风怒框'),

    ['武器开启'] = function (Card)
        local get_attr = CARD_GET_ATTR
        local cardtype = get_attr(Card, '逻辑数据', '类型')

        if cardtype == 0x10090006 then
            set_flag_obj({'武器开启'}, true, '遮挡板')()
            set_flag_obj({'武器开启'}, false, '攻击力')()
        end
    end,
}

-- 技能效果_特性
noti[postinfo .. '技能效果_特性'] = function (_string_添加特性, _string_移除特性, _string_还原特性)
    local last_call = G.call('卡牌逻辑树_获取最后调用')
    local get_attr = CARD_GET_ATTR
    local TargetList = get_attr(last_call, 'skill_info', 'Target')

    local info = {postcall .. '技能效果_特性', G.call('array_map', TargetList, o2i), _string_添加特性, _string_移除特性, _string_还原特性}

    info_addchild(info)
    info_stack.pop(info)
end

noti[postcall .. '技能效果_特性'] = function (idlist, _string_添加特性, _string_移除特性, _string_还原特性)
    local TargetList = G.call('array_map', idlist, i2o)

    local iter = function (Card) end

    for _, target in ipairs(TargetList) do
        for _, flag in ipairs(_string_添加特性 or {}) do
            (flag_mapping[flag] or iter)(target)
        end
        for _, flag in ipairs(_string_移除特性 or {}) do
            (flag_mapping[flag] or iter)(target)
        end
        for _, flag in ipairs(_string_还原特性 or {}) do
            (flag_mapping[flag] or iter)(target)
        end
    end
end

function noti.卡牌动画_前置调用(funs, ...)
    if noti[preinfo .. funs] then
        noti[preinfo .. funs](...)
    end
end

function noti.卡牌动画_后置调用(funs, ...)
    if noti[postinfo .. funs] then
        noti[postinfo .. funs](...)
    end
end

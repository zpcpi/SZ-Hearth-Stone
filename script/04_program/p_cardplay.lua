--[[400f

]]
local G = require "gf"
local L = {}
local t = {}
local real_t = G.api

--特殊事件
-- 逻辑_法术牌打出
-- 逻辑_英雄技能使用

t['卡牌使用_主流程_thread'] = function (estr_player_相对身份, o_order_info_当前指令信息)
    local get_attr = CARD_GET_ATTR

    local effect_stack = G.misc().当前效果堆栈
    local Caster = o_order_info_当前指令信息['Caster']

    local root_info = {
        ['Player'] = estr_player_相对身份,
        ['Caster'] = Caster,
        ['Target'] = o_order_info_当前指令信息['Target'],
        ['Parent'] = nil,
        ['MinionPos'] = o_order_info_当前指令信息['MinionPos'],
    }
    effect_stack.push(root_info)

    -- 进行一次卡牌信息广播
    G.call('卡牌实例化_信息更新_预处理', Caster, {'root', '卡牌属性', '逻辑数据', '动态数据'})
    
    -- 去除未知标签
    if G.call('卡牌条件_卡牌特性判断', Caster, {'未知'}) then
        G.call('技能效果_效果树_执行子效果', {
            ['Target'] = {Caster},
        }, function ()
            G.call('技能效果_特性', nil, {'未知'})
        end)
    end

    -- 法力值消耗
    G.call('卡牌使用_消耗法力')

    -- 卡牌使用，生效判断
    G.call('卡牌使用_生效判断')
    if root_info['是否使用成功'] then
    else
        -- 判定不能执行，直接返回
        return
    end

    -- 不同类型，加下来的事件并不一致
    local Caster = o_order_info_当前指令信息['Caster']
    local cardtype = get_attr(Caster, '逻辑数据', '类型')

    if cardtype == 0x10090001 then
        -- 英雄
        -- 直接替换英雄，修改当前血量
    elseif cardtype == 0x10090002 then
        -- 英雄卡

    elseif cardtype == 0x10090003 then
        -- 英雄技能
        G.call('卡牌使用_使用')

        -- 判断下是否在战场
        if get_attr(Caster, '动态数据', '卡牌位置') == '战场' then
        else
            -- 不在战场，那么可能是在手牌使用的
            G.call('角色_移除手牌_byCard', estr_player_相对身份, Caster)
        end
    elseif cardtype == 0x10090004 then
        -- 随从卡，召唤随从
        -- 可能不对，需要判断下
        G.call('卡牌使用_使用')

        G.call('角色_移除手牌_byCard', estr_player_相对身份, Caster)
    elseif cardtype == 0x10090005 then
        -- 法术卡，执行使用逻辑
        G.call('卡牌使用_使用')

        G.call('角色_移除手牌_byCard', estr_player_相对身份, Caster)
    elseif cardtype == 0x10090006 then
        -- 武器卡
        -- 有特殊处理，需要考虑新旧武器替换
        G.call('卡牌使用_使用')

        G.call('角色_移除手牌_byCard', estr_player_相对身份, Caster)
    end

    -- 逐个触发相关事件
    G.call('技能效果_死亡结算')

    -- 执行完毕
    effect_stack.pop()
end

real_t['卡牌使用_主流程'] = function (estr_player_相对身份, o_order_info_当前指令信息)
    G.start_program('卡牌使用_主流程_thread', estr_player_相对身份, o_order_info_当前指令信息)
end

t['卡牌攻击_主流程_thread'] = function (estr_player_相对身份, o_order_info_当前指令信息)
    local get_attr = CARD_GET_ATTR

    local effect_stack = G.misc().当前效果堆栈

    local root_info = {
        ['Player'] = estr_player_相对身份,
        ['Caster'] = o_order_info_当前指令信息['Caster'],
        ['Target'] = o_order_info_当前指令信息['Target'],
        ['Parent'] = nil,
    }
    effect_stack.push(root_info)

    G.call('卡牌使用_攻击')

    -- 逐个触发相关事件
    G.call('技能效果_死亡结算')

    -- 执行完毕
    effect_stack.pop()
end

real_t['卡牌攻击_主流程'] = function (estr_player_相对身份, o_order_info_当前指令信息)
    G.start_program('卡牌攻击_主流程_thread', estr_player_相对身份, o_order_info_当前指令信息)
end

-- ============================================
-- ============================================
-- ============================================
-- 逻辑基础事件响应
-- ============================================
-- ============================================
-- ============================================

local get_cur_effect_info = function ()
    local effect_stack = G.misc().当前效果堆栈
    if effect_stack then
        return effect_stack.top()
    end
end

local get_parent_effect_info = function ()
    local effect_stack = G.misc().当前效果堆栈
    if effect_stack then
        local skill_info = effect_stack.top()
        if skill_info then
            return skill_info['Parent']
        end
    end
end

local effect_action_iter = function (skill_info, event, init, action)
    skill_info = skill_info or get_cur_effect_info()
    if skill_info then
    else
        return
    end

    if event then
        -- 功能初始化
        init(skill_info)
        -- 触发“前”事件，修改数据
        G.trig_event(event .. '前', skill_info)
        -- 执行
        action(skill_info)
        -- 触发事件，响应改变
        G.trig_event(event, skill_info)
    else
        -- 功能初始化
        init(skill_info)
        -- 执行
        action(skill_info)
    end
end

t['卡牌使用_消耗法力'] = function ()
    local init = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        o_skill_info_效果信息['费用'] = math.max(G.call('卡牌属性_获取', Caster, '费用', '当前值') or 0, 0)
        o_skill_info_效果信息['过载费用'] = math.max(G.call('卡牌属性_获取', Caster, '过载费用', '当前值') or 0, 0)
    end

    local action = function (o_skill_info_效果信息)
        local 费用 = o_skill_info_效果信息['费用'] or 0
        local 过载费用 = o_skill_info_效果信息['过载费用'] or 0
        local estr_player_相对身份 = o_skill_info_效果信息['Player']

        local 当前值 = G.call('角色_获取水晶数据', estr_player_相对身份, '当前值')
        G.call('角色属性_水晶_设置', estr_player_相对身份, '当前值', 当前值 - 费用)
    
        local 下回锁定值 = G.call('角色_获取水晶数据', estr_player_相对身份, '下回锁定值')
        G.call('角色属性_水晶_设置', estr_player_相对身份, '下回锁定值', 下回锁定值 + 过载费用)
    end

    effect_action_iter(nil, '逻辑_卡牌使用_消耗法力', init, action)
end

t['卡牌使用_生效判断'] = function ()
    local init = function (o_skill_info_效果信息)
        o_skill_info_效果信息['是否使用成功'] = true
    end

    local action = function (o_skill_info_效果信息)
    end

    effect_action_iter(nil, '逻辑_卡牌生效', init, action)
end

t['卡牌使用_使用'] = function ()
    local get_attr = CARD_GET_ATTR

    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        local cardtype = get_attr(Caster, '逻辑数据', '类型')

        if cardtype == 0x10090003 then
            -- 英雄技能
            G.trig_event('逻辑_英雄技能使用', Caster)
        elseif cardtype == 0x10090004 then
            -- 随从
            G.trig_event('逻辑_随从牌打出', Caster)

            --上场，战吼，召唤自身
            G.call('卡牌使用_上场')
            G.call('卡牌关键词_战吼')

            --TODO，磁力分支
            G.call('卡牌使用_随从召唤')
        elseif cardtype == 0x10090005 then
            -- 法术
            G.trig_event('逻辑_法术牌打出', Caster)
        elseif cardtype == 0x10090006 then
            -- 武器卡

            --上场，战吼，更新武器
            G.call('卡牌使用_上场')
            G.call('卡牌关键词_战吼')
            G.call('卡牌使用_武器装备')
        end

        -- todo，记录
    end
    effect_action_iter(nil, '逻辑_卡牌使用', init, action)
end

t['卡牌使用_上场'] = function ()
    local get_attr = CARD_GET_ATTR

    local init = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        local cardtype = get_attr(Caster, '逻辑数据', '类型')

        if cardtype == 0x10090004 then
            -- 随从
            G.trig_event('逻辑_随从上场前', Caster)
        elseif cardtype == 0x10090006 then
            -- 武器卡
            G.trig_event('逻辑_武器上场前', Caster)
        end
    end

    local action = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        local cardtype = get_attr(Caster, '逻辑数据', '类型')

        if cardtype == 0x10090004 then
            -- 随从
            G.trig_event('逻辑_随从上场', Caster)
        elseif cardtype == 0x10090006 then
            -- 武器卡
            G.trig_event('逻辑_武器上场', Caster)
        end

        -- todo，记录
    end
    effect_action_iter(nil, '逻辑_卡牌上场', init, action)
end

t['卡牌使用_随从召唤'] = function ()
    local get_attr = CARD_GET_ATTR

    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local Player = o_skill_info_效果信息['Player']
        local Caster = o_skill_info_效果信息['Caster']
        local index = o_skill_info_效果信息['MinionPos']
        
        G.call('角色_战场_添加随从', Player, Caster, index)
        
        G.trig_event('逻辑_随从召唤', Caster)

        -- todo，记录
    end
    effect_action_iter(nil, nil, init, action)
end

t['卡牌使用_武器装备'] = function ()
    local get_attr = CARD_GET_ATTR

    local init = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        
        G.trig_event('逻辑_武器装备前', Caster)
    end

    local action = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        local cardtype = get_attr(Caster, '逻辑数据', '类型')
        local player = '我方'

        -- 老武器摧毁
        -- TODO，玩家归属判断
        local old_weapon = G.call('角色_战场_获取武器', player)
        if old_weapon then
            -- 这里只是打上标记
            G.call('技能效果_效果树_执行子效果',
                    {
                        ['Player'] = o_skill_info_效果信息['Player'],
                        ['Caster'] = Caster,
                        ['Target'] = {old_weapon},
                    },
                    function ()
                        G.call('技能效果_消灭目标')
                    end
                )
            -- G.call('技能效果_死亡结算')
        end
        -- 武器卡
        -- TODO，先判断下武器还在不在
        G.call('角色_战场_设置武器', player, Caster)
        G.trig_event('逻辑_武器装备', Caster)

        -- todo，记录
    end
    effect_action_iter(nil, nil, init, action)
end



t['卡牌关键词_战吼'] = function ()
    local get_attr = CARD_GET_ATTR

    local init = function (o_skill_info_效果信息)
        -- 如果没有目标，那么根据指令id随机选一个目标
        local Caster = o_skill_info_效果信息['Caster']
        local cardtype = get_attr(Caster, '逻辑数据', '类型')

        if cardtype == 0x10090004 then
            -- 随从
            G.trig_event('逻辑_随从战吼前', Caster)
        elseif cardtype == 0x10090006 then
            -- 武器卡
            G.trig_event('逻辑_武器战吼前', Caster)
        end
    end

    local action = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        local cardtype = get_attr(Caster, '逻辑数据', '类型')

        if cardtype == 0x10090004 then
            -- 随从
            G.trig_event('逻辑_随从战吼', Caster)
        elseif cardtype == 0x10090006 then
            -- 武器卡
            G.trig_event('逻辑_武器战吼', Caster)
        end
    end

    effect_action_iter(nil, '逻辑关键词_战吼', init, action)
end

t['卡牌关键词_亡语'] = function ()
    local get_attr = CARD_GET_ATTR

    local init = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        local cardtype = get_attr(Caster, '逻辑数据', '类型')

        if cardtype == 0x10090004 then
            -- 随从
            G.trig_event('逻辑_随从亡语前', Caster)
        elseif cardtype == 0x10090006 then
            -- 武器卡
            G.trig_event('逻辑_武器亡语前', Caster)
        end
    end

    local action = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        local cardtype = get_attr(Caster, '逻辑数据', '类型')

        if cardtype == 0x10090004 then
            -- 随从
            G.trig_event('逻辑_随从亡语', Caster)
        elseif cardtype == 0x10090006 then
            -- 武器卡
            G.trig_event('逻辑_武器亡语', Caster)
        end
    end

    effect_action_iter(nil, '逻辑关键词_亡语', init, action)
end







t['single_damage'] = function ()
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']

        local int_伤害值 = o_skill_info_效果信息['逐个伤害数值']
        local Target = o_skill_info_效果信息['逐个伤害目标']

        -- 造成伤害
        if int_伤害值 > 0 then
            local _int_伤害数值 = o_skill_info_效果信息['伤害数值']
            local TargetList = o_skill_info_效果信息['最终伤害目标']
    
            local index = #_int_伤害数值 + 1
    
            -- 伤害值记录下来
            _int_伤害数值[index] = int_伤害值
            TargetList[index] = Target
    
            local old_hp = G.call('卡牌属性_获取', Target, '生命', '当前值') or 0

            G.call('card_造成伤害', Target, int_伤害值)
            G.trig_event('逻辑_卡牌造成伤害', Caster, Target, int_伤害值)
            
            local cur_hp = G.call('卡牌属性_获取', Target, '生命', '当前值') or 0
            if (old_hp > 0) and (cur_hp <= 0) then
                -- 是当前卡牌造成的击杀
                local misc = G.misc()
                local KillterList = misc['击杀者列表'] or {}
                misc['击杀者列表'] = KillterList
                KillterList[Target] = Caster
            end
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_直接伤害', init, action)
end

t['single_heal'] = function ()
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']

        local int_治疗值 = o_skill_info_效果信息['逐个治疗数值']
        local Target = o_skill_info_效果信息['逐个治疗目标']

        -- 造成治疗
        if int_治疗值 > 0 then
            local _int_治疗数值 = o_skill_info_效果信息['治疗数值']
            local TargetList = o_skill_info_效果信息['最终治疗目标']
    
            local index = #_int_治疗数值 + 1
    
            -- 治疗值记录下来
            _int_治疗数值[index] = int_治疗值
            TargetList[index] = Target

            G.call('card_造成治疗', Target, int_治疗值)
            G.trig_event('逻辑_卡牌造成治疗', Caster, Target, int_治疗值)
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_直接治疗', init, action)
end

local single_add_buff = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        -- 这里已经是 buff_info 了
        local o_skill_buffID = o_skill_info_效果信息['当前添加buff']
        local Target = o_skill_info_效果信息['Target'][1]
        G.trig_event('逻辑_技能添加前', Target, o_skill_buffID)
        G.trig_event('逻辑_技能添加', Target, o_skill_buffID)
    end

    local buff_info = {
        ['Player'] = o_skill_info_效果信息['Player'],
        ['Caster'] = o_skill_info_效果信息['Caster'],
        ['Target'] = {o_skill_info_效果信息['逐个伤害目标']},
        ['当前添加buff'] = o_skill_info_效果信息['当前添加buff'],
    }
    G.call('技能效果_效果树_执行子效果', buff_info,
            function ()
                effect_action_iter(nil, '逻辑_Buff生效', init, action)
            end
          )
end

local aura_add_buff = function (func_filer, func_add, func_del, _earg_光环添加事件, _earg_光环删除事件, _earg_光环移除事件, _info_自定义事件)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local all_cards = G.misc()['实例化卡牌列表']
    local TargetList = G.call('array_filter', all_cards, func_filer)

    G.call('技能效果_效果树_执行子效果',
            {
                ['Player'] = o_skill_info_效果信息['Player'],
                ['Caster'] = o_skill_info_效果信息['Caster'],
                ['Target'] = TargetList,
            }, 
            func_add
        )

    local infolist = _info_自定义事件 or {}
    local add_buff_iter = function ()
        local Target = G.event_info()
        if G.call('array_get_element_index', TargetList, Target) then
        elseif func_filer(Target) then
            table.insert(TargetList, Target)
            G.call('技能效果_效果树_执行子效果',
                    {
                        ['Player'] = o_skill_info_效果信息['Player'],
                        ['Caster'] = o_skill_info_效果信息['Caster'],
                        ['Target'] = {Target},
                    }, 
                    func_add
                )
        end
    end
    local del_buff_iter = function ()
        local Target = G.event_info()
        local index = G.call('array_get_element_index', TargetList, Target)
        if index then
            table.remove(TargetList, index)
            G.call('技能效果_效果树_执行子效果',
                    {
                        ['Player'] = o_skill_info_效果信息['Player'],
                        ['Caster'] = o_skill_info_效果信息['Caster'],
                        ['Target'] = {Target},
                    }, 
                    func_del
                )
        end
    end
    local del_aure_iter = function ()
        G.call('技能效果_效果树_执行子效果',
                {
                    ['Player'] = o_skill_info_效果信息['Player'],
                    ['Caster'] = o_skill_info_效果信息['Caster'],
                    ['Target'] = TargetList,
                }, 
                func_del
            )
    end

    for _,earg in ipairs(_earg_光环添加事件) do
        local info = {
            [1] = earg,
            [2] = add_buff_iter,
            [6] = true,
        }
        table.insert(infolist, info)
    end
    for _,earg in ipairs(_earg_光环删除事件) do
        local info = {
            [1] = earg,
            [2] = del_buff_iter,
            [6] = true,
        }
        table.insert(infolist, info)
    end
    for _,earg in ipairs(_earg_光环移除事件) do
        local info = {
            [1] = earg,
            [2] = del_aure_iter,
        }
        table.insert(infolist, info)
    end

    G.call('tLua_add_multlisteners', infolist)
end

t['normal_attck'] = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        o_skill_info_效果信息['原始伤害数值'] = G.call('卡牌属性_获取', Caster, '攻击', '当前值') or 0
        o_skill_info_效果信息['伤害类型'] = '攻击'
    end

    local action = function (o_skill_info_效果信息)
        local int_中间伤害值 = o_skill_info_效果信息['中间伤害数值'] or o_skill_info_效果信息['原始伤害数值']
        local TargetList = o_skill_info_效果信息['Target'] or {}
        local _int_伤害数值 = {}

        o_skill_info_效果信息['最终伤害目标'] = {}
        o_skill_info_效果信息['伤害数值'] = _int_伤害数值

        for k,Target in ipairs(TargetList) do
            o_skill_info_效果信息['逐个伤害数值'] = int_中间伤害值
            o_skill_info_效果信息['逐个伤害目标'] = Target
            G.call('single_damage')
        end
    end

    -- 攻击者流程
    effect_action_iter(nil, '逻辑_技能效果_攻击伤害', init, action)
    -- 反击者流程
    local beatback_info = {
        ['Player'] = o_skill_info_效果信息['Player'],
        ['Caster'] = o_skill_info_效果信息['Target'][1],
        ['Target'] = {o_skill_info_效果信息['Caster']},
    }
    G.call('技能效果_效果树_执行子效果', 
            beatback_info, 
            function ()
                effect_action_iter(nil, '逻辑_技能效果_反击伤害', init, action)
            end
          )
end

t['技能效果_效果树_执行子效果'] = function (skill_info, action)
    -- 效果挂钩，入栈
    local effect_stack = skill_info['Stack'] or G.misc().当前效果堆栈

    if skill_info['Parent'] then
    else
        local o_skill_info_效果信息 = effect_stack.top()
        skill_info['Parent'] = o_skill_info_效果信息

        if o_skill_info_效果信息 then
            local Childlist = o_skill_info_效果信息['Children'] or {}
            table.insert(Childlist, skill_info)
            o_skill_info_效果信息['Children'] = Childlist
        end
    end
    effect_stack.push(skill_info)

    -- 执行效果
    action()

    -- 效果出栈
    effect_stack.pop()
end

-- ============================================
-- ============================================
-- ============================================
-- 逻辑默认事件响应
-- ============================================
-- ============================================
-- ============================================
-- 法强、吸血等
local trigger_list = {}
local create_trigger_name = function (event)
    local count = (trigger_list[event] or 0) + 1
    trigger_list[event] = count

    return '|#trigger#|#' .. event .. '#|' .. count
end

local trigger_iter = function (card, estr_cardevent_inittype_类型, skillname, count)
    local iter = function (skill, index, trigger)
        local 是否重复触发 = trigger['是否重复触发']
        local 触发时机 = (trigger['触发时机'] or {})['lua']
        local 触发条件 = (trigger['触发条件'] or {})['lua']
        local 触发逻辑 = (trigger['触发逻辑'] or {})['lua']
        local 优先级 = trigger['优先级'] or 0
        local 分组 = trigger['分组']

        local earg = nil
        local condi = nil
        local skill_dynamic_data = {}
        if type(触发时机) == 'function' then
            earg = 触发时机(skill, card, get_cur_effect_info(), skill_dynamic_data)
        end
        if earg and type(触发条件) == 'function' then
            condi = function ()
                return 触发条件(skill, card, get_cur_effect_info(), skill_dynamic_data)
            end
        end
        if earg and type(触发逻辑) == 'function' then
            local event_name = earg[1]
            local key = create_trigger_name(event_name)
            if 是否重复触发 then
                real_t[key] = function ()
                    return 触发逻辑(skill, card, get_cur_effect_info(), skill_dynamic_data)
                end
            else
                real_t[key] = function ()
                    G.removeListener(key, event_name)
                    real_t[key] = nil
                    card['动态数据_事件']['当前注册事件'][key] = nil
                    return 触发逻辑(skill, card, get_cur_effect_info(), skill_dynamic_data)
                end
            end
            G.addListener(key, earg, condi, 优先级, 分组)

            -- 绑定到卡牌信息上
            local card_trglist = card['动态数据_事件']['当前注册事件']
            card_trglist[key] = {
                ['事件名'] = event_name,
                ['注册类型'] = estr_cardevent_inittype_类型,
                ['技能'] = skill.name,
                ['技能名称'] = skill.showname,
                ['逻辑编号'] = index,
                ['技能动态数据'] = skill_dynamic_data,
            }
        end
    end

    local for_skill_list = function (skill_list)
        for _,s in ipairs(skill_list or {}) do
            local skill = G.QueryName(s)
            if skill and skill['逻辑功能'] then
                if count then
                    -- 只注册制定编号
                    local trigger = skill['逻辑功能'][count] or {}
                    if trigger['注册时机'] == estr_cardevent_inittype_类型 then
                        iter(skill, count, trigger)
                    end
                else
                    -- 符合条件的全部注册
                    for index,trigger in ipairs(skill['逻辑功能']) do
                        if trigger['注册时机'] == estr_cardevent_inittype_类型 then
                            iter(skill, index, trigger)
                        end
                    end
                end
            end
        end
    end

    local get_attr = CARD_GET_ATTR
    if skillname then
        for_skill_list({skillname})
    else
        local 卡牌效果 = get_attr(card, '逻辑数据', '卡牌效果')
        for_skill_list(卡牌效果)
    end
end

-- trigger注册
t['逻辑注册_初始化'] = function ()
    local card, player_ab = G.event_info()
    card['动态数据'] = {
        ['浮动属性'] = {},
        ['武器属性'] = {},
        ['光环属性'] = {},
        ['当前属性'] = {},
        ['卡牌位置'] = '牌库',
        ['所有者'] = player_ab or G.call('房间_获取绝对身份', '我方'),
        ['特性层数'] = {},
    }
    card['动态数据_事件'] = {
        ['当前注册事件'] = {},
    }
    if card['逻辑数据'] then
        if card['逻辑数据']['卡牌特性'] then
        else
            card['逻辑数据']['卡牌特性'] = {0,0,0,0}
        end
    else
        card['逻辑数据'] = {
            ['卡牌特性'] = {0,0,0,0}
        }
    end

    -- 属性初始化
    local flags_data = CARD_FLAGS
    for _,skill_id in ipairs(card['逻辑数据']['卡牌效果'] or {}) do
        local skill = G.QueryName(skill_id)
        local flags = skill['技能类型']
        for _,flag in ipairs(flags or {}) do
            local data = card['逻辑数据']['卡牌特性']
            data[2] = (data[2] or 0) | (1 << flags_data[2][flag])

            local countmap = card['动态数据']['特性层数']
            countmap[flag] = (countmap[flag] or 0) + 1
        end
    end

    -- 防重复记录
    local misc = G.misc()
    if misc['别人实例化卡牌反查表'][card.name] then
    else
        table.insert(misc['实例化卡牌列表'], card)
        misc['别人实例化卡牌反查表'][card.name] = true
    end

    trigger_iter(card, '初始')
end

real_t['逻辑注册_别人初始化前置条件'] = function ()
    local card = G.event_info()
    local misc = G.misc()
    return misc['别人实例化卡牌反查表'][card.name] ~= true
end

t['逻辑注册_别人初始化'] = function ()
    local card = G.event_info()
    card['动态数据_事件'] = {
        ['当前注册事件'] = {},
    }

    local misc = G.misc()
    if misc['别人实例化卡牌反查表'][card.name] then
    elseif card['动态数据'] then
        table.insert(misc['实例化卡牌列表'], card)
        misc['别人实例化卡牌反查表'][card.name] = true
    end
end

real_t['逻辑注册_上场'] = function ()
    local card = G.event_info()

    trigger_iter(card, '上场')
end

real_t['逻辑注册_上手'] = function ()
    local card = G.event_info()
    trigger_iter(card, '上手')
end

real_t['逻辑注册_生效'] = function ()
    local info = G.event_info()
    local card = info['Caster']

    -- 判断是否能够生效
    trigger_iter(card, '生效')
end

real_t['逻辑注册_添加'] = function ()
    local card, skill = G.event_info()

    -- 判断是否能够生效
    trigger_iter(card, '添加', skill.name)
end

local function get_value_by_interval(v, min, max)
    if v < min then
        return min
    elseif v > max then
        return max
    else
        return v
    end
end

-- 特定流程
t['逻辑注册_水晶设置_absolute'] = function ()
    local absolute_player = G.event_info()
    local estr_player_相对身份 = G.call('房间_获取相对身份', absolute_player)

    local 最大值 = G.call('角色_获取水晶数据', estr_player_相对身份, '最大值')
    最大值 = get_value_by_interval(最大值 + MANA_GROW_COUNT, 0, MANA_MAX_COUNT)
    
    local 下回锁定值 = G.call('角色_获取水晶数据', estr_player_相对身份, '下回锁定值')
    local 锁定值 = get_value_by_interval(下回锁定值, 0, 最大值)
    local 当前值 = get_value_by_interval(最大值 - 下回锁定值, 0, MANA_MAX_COUNT)

    G.call('角色属性_水晶_设置', estr_player_相对身份, '最大值', 最大值)
    G.call('角色属性_水晶_设置', estr_player_相对身份, '当前值', 当前值)
    G.call('角色属性_水晶_设置', estr_player_相对身份, '锁定值', 锁定值)
    G.call('角色属性_水晶_设置', estr_player_相对身份, '下回锁定值', 0)
end

t['逻辑注册_抽牌_absolute'] = function ()
    local absolute_player = G.event_info()
    local estr_player_相对身份 = G.call('房间_获取相对身份', absolute_player)

    G.call('角色_牌库抽取卡牌', estr_player_相对身份, estr_player_相对身份)
end

local card_init_attack_count = function (Target, int_已攻击次数)
    G.call('卡牌属性_设置', Target, '攻击次数', '当前值', int_已攻击次数 or 0)
    if G.call('卡牌条件_卡牌特性判断', Target, {'超级风怒'}) then
        G.call('卡牌属性_设置', Target, '攻击次数', '浮动值', 4)
    elseif G.call('卡牌条件_卡牌特性判断', Target, {'风怒'}) then
        G.call('卡牌属性_设置', Target, '攻击次数', '浮动值', 2)
    else
        G.call('卡牌属性_设置', Target, '攻击次数', '浮动值', 1)
    end
end

local hero_init_attack_count = function (Hero, Weapon, int_已攻击次数)
    G.call('卡牌属性_设置', Hero, '攻击次数', '当前值', int_已攻击次数 or 0)
    if G.call('卡牌条件_卡牌特性判断', Hero, {'超级风怒'}) or G.call('卡牌条件_卡牌特性判断', Weapon, {'超级风怒'}) then
        G.call('卡牌属性_设置', Hero, '攻击次数', '浮动值', 4)
    elseif G.call('卡牌条件_卡牌特性判断', Hero, {'风怒'}) or G.call('卡牌条件_卡牌特性判断', Weapon, {'风怒'}) then
        G.call('卡牌属性_设置', Hero, '攻击次数', '浮动值', 2)
    else
        G.call('卡牌属性_设置', Hero, '攻击次数', '浮动值', 1)
    end
end

t['逻辑注册_攻击次数重置_回合开始_absolute'] = function ()
    local absolute_player = G.event_info()
    local estr_player_相对身份 = G.call('房间_获取相对身份', absolute_player)

    local MinionList = G.call('角色_获取随从列表', estr_player_相对身份) or {}
    for _,Target in ipairs(MinionList) do
        card_init_attack_count(Target)
    end

    local hero = G.call('角色_战场_获取英雄', estr_player_相对身份)
    local weapon = G.call('角色_战场_获取武器', estr_player_相对身份)
    
    if weapon then
        -- 有武器的情况下，特殊处理
        hero_init_attack_count(hero, weapon)
    else
        card_init_attack_count(hero)
    end
end

t['逻辑注册_攻击次数设置_单个上场'] = function ()
    local Target = G.event_info()

    if true then
        -- TODO，判断下随从的阵营
    end
    
    if G.call('卡牌条件_卡牌特性判断', Target, {'冲锋'}) or G.call('卡牌条件_卡牌特性判断', Target, {'突袭'}) then
        card_init_attack_count(Target)
    else
        G.call('卡牌属性_设置', Target, '攻击次数', '当前值', 0)
        G.call('卡牌属性_设置', Target, '攻击次数', '浮动值', 0)
    end

    -- 上场时属性设置
    G.call('技能效果_效果树_执行子效果',
            {
                ['Player'] = '我方',
                ['Caster'] = Target,
                ['Target'] = {Target},
            },
            function ()
                local add_flag = {}
                table.insert(add_flag, '首回合召唤')
                if G.call('卡牌条件_卡牌特性判断', Target, {'突袭'}) then
                    table.insert(add_flag, '不能攻击英雄')
                end

                G.call('技能效果_特性', add_flag)
            end
        )
end

t['逻辑注册_攻击状态设置_回合结束_absolute'] = function ()
    local absolute_player = G.event_info()
    local estr_player_相对身份 = G.call('房间_获取相对身份', absolute_player)

    local MinionList = G.call('角色_获取随从列表', estr_player_相对身份) or {}

    for _,Target in ipairs(MinionList) do
        local del_flag = {}
        local reset_farg = {}
        if G.call('卡牌条件_卡牌特性判断', Target, {'首回合召唤'}) then
            table.insert(del_flag, '首回合召唤')
            if G.call('卡牌条件_卡牌特性判断', Target, {'突袭'}) then
                table.insert(reset_farg, '不能攻击英雄')
            end

            G.call('技能效果_效果树_执行子效果',
                    {
                        ['Player'] = estr_player_相对身份,
                        ['Caster'] = Target,
                        ['Target'] = {Target},
                    },
                    function ()
                        G.call('技能效果_特性', nil, del_flag, reset_farg)
                    end
                )
        end
    end
end

local weapon_open = function (weapon)
    if G.call('卡牌条件_卡牌特性判断', weapon, nil, {'武器开启'}) then
        -- 如果武器关闭的，则打开武器
        G.call('技能效果_效果树_执行子效果',
                {
                    ['Player'] = '我方',
                    ['Caster'] = weapon,
                    ['Target'] = {weapon},
                },
                function ()
                    G.call('技能效果_特性', {'武器开启'})

                    -- 添加攻击力
                    local hero = G.call('角色_战场_获取英雄', '我方')
                    local cur_value = G.call('卡牌属性_获取', hero, '攻击', '武器值') or 0
                    local weapon_value = G.call('卡牌属性_获取', weapon, '攻击', '当前值') or 0
                    G.call('卡牌属性_设置', hero, '攻击', '武器值', cur_value + weapon_value)
                end
            )
    end
end

local weapon_close = function (weapon)
    if G.call('卡牌条件_卡牌特性判断', weapon, {'武器开启'}) then
        -- 如果武器打开的，则关闭武器
        G.call('技能效果_效果树_执行子效果',
                {
                    ['Player'] = '我方',
                    ['Caster'] = weapon,
                    ['Target'] = {weapon},
                },
                function ()
                    G.call('技能效果_特性', nil, {'武器开启'})

                    -- 清除攻击力
                    local hero = G.call('角色_战场_获取英雄', '我方')
                    local cur_value = G.call('卡牌属性_获取', hero, '攻击', '武器值') or 0
                    local weapon_value = G.call('卡牌属性_获取', weapon, '攻击', '当前值') or 0
                    G.call('卡牌属性_设置', hero, '攻击', '武器值', cur_value - weapon_value)
                end
            )
    end
end

t['逻辑注册_武器功能_回合开始_absolute'] = function ()
    local absolute_player = G.event_info()
    local estr_player_相对身份 = G.call('房间_获取相对身份', absolute_player)

    local weapon = G.call('角色_战场_获取武器', estr_player_相对身份)
    if weapon then
        weapon_open(weapon)
    end
end

t['逻辑注册_武器功能_武器添加'] = function ()
    if G.call('对决_当前是否是我方回合') then
        -- 默认情况下，我方回合武器才生效
    else
        return
    end

    -- 走到这里，说明武器攻击可以加
    local weapon = G.event_info()
    if weapon then
        weapon_open(weapon)
    end
end

t['逻辑注册_武器功能_武器摧毁'] = function ()
    local tar = G.event_info()
    weapon_close(tar)
end

real_t['逻辑注册_武器功能_攻击力变化前置条件'] = function ()
    local tar,attr,type,old_value = G.event_info()

    local get_attr = CARD_GET_ATTR
    local cardtype = get_attr(tar, '逻辑数据', '类型')

    -- 必须是武器卡的攻击发生变化
    return cardtype == 0x10090006
end

t['逻辑注册_武器功能_攻击力变化'] = function ()
    local tar,attr,type,old_value = G.event_info()
    local weapon = G.call('角色_战场_获取武器', '我方')

    if (tar == weapon) then
        if G.call('卡牌条件_卡牌特性判断', weapon, {'武器开启'}) then
            G.call('技能效果_效果树_执行子效果',
                    {
                        ['Player'] = '我方',
                        ['Caster'] = weapon,
                        ['Target'] = {weapon},
                    },
                    function ()
                        -- 攻击力修改
                        local hero = G.call('角色_战场_获取英雄', '我方')
                        local cur_value = G.call('卡牌属性_获取', hero, '攻击', '武器值') or 0
                        local weapon_value = G.call('卡牌属性_获取', weapon, '攻击', type) or 0
                        G.call('卡牌属性_设置', hero, '攻击', '武器值', cur_value + weapon_value - (old_value or 0))
                    end
                )
        end
    end
end

t['逻辑注册_武器功能_回合结束_absolute'] = function ()
    local absolute_player = G.event_info()
    local estr_player_相对身份 = G.call('房间_获取相对身份', absolute_player)

    local weapon = G.call('角色_战场_获取武器', estr_player_相对身份)
    if weapon then
        weapon_close(weapon)
    end
end

real_t['逻辑注册_武器功能_消耗耐久前置条件'] = function ()
    local skill_info = G.event_info()

    if skill_info then
        local Caster = skill_info['Caster']
        local Player = skill_info['Player']
        
        if Caster and Player and (Player == '我方') then
            local Hero = G.call("角色_战场_获取英雄", Player)
            local Weapon = G.call('角色_战场_获取武器', Player)

            return (Caster == Hero) and Weapon
        end
    end
end

t['逻辑注册_武器功能_消耗耐久'] = function ()
    local weapon = G.call('角色_战场_获取武器', '我方')
    if G.call('卡牌条件_卡牌特性判断', weapon, {'武器开启'}) then
        -- 武器对自己造成一点伤害
        G.call('技能效果_效果树_执行子效果',
                {
                    ['Player'] = '我方',
                    ['Caster'] = weapon,
                    ['逐个伤害数值'] = 1,
                    ['逐个伤害目标'] = weapon,

                    ['伤害数值'] = {},
                    ['最终伤害目标'] = {},
                },
                function ()
                    G.call('single_damage')
                end
            )
    end
end

-- 特定逻辑
-- 战吼
t['逻辑注册_战吼'] = function ()
    local info = G.event_info()
    local card = info['Caster']

    trigger_iter(card, '战吼')
end

t['逻辑注册_卡牌死亡结算'] = function ()
    local init = function (o_skill_info_效果信息)
        local all_cards = G.misc()['实例化卡牌列表']
        local TargetList = G.call('array_filter', all_cards, function (t)
            local cardtype = (t['逻辑数据'] or {})['类型']
            if (cardtype == 0x10090001) --[[英雄]] or 
               (cardtype == 0x10090004) --[[随从]] or
               (cardtype == 0x10090006) --[[武器]] then
                local cardpos = (t['动态数据'] or {})['卡牌位置']
                if (cardpos == '牌库') or
                   (cardpos == '手牌') or
                   (cardpos == '战场') then
                    if (G.call('卡牌属性_获取', t, '生命', '当前值') or 0) <= 0 then
                        -- 生命值小于0
                        G.call('技能效果_效果树_执行子效果',
                                {
                                    ['Player'] = '我方',
                                    ['Caster'] = t,
                                    ['Target'] = {t},
                                },
                                function ()
                                    G.call('技能效果_特性', {'等待死亡'})
                                end
                            )
                    end
                    if G.call('卡牌条件_卡牌特性判断', t, {'等待死亡'}) then
                        -- 被打上了死亡标记
                        return true
                    end
                end
            end
            return false
        end)

        o_skill_info_效果信息['Target'] = TargetList
    end

    local action = function (o_skill_info_效果信息)
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _,Target in ipairs(TargetList) do
            local cardtype = (Target['逻辑数据'] or {})['类型']
            local cardpos = (Target['动态数据'] or {})['卡牌位置']

            if cardtype == 0x10090001 then
                -- 英雄
            elseif cardtype == 0x10090004 then
                -- 随从
                if cardpos == '牌库' then
                elseif cardpos == '手牌' then
                elseif cardpos == '战场' then
                    local cur_info = {
                        ['Player'] = o_skill_info_效果信息['Player'],
                        ['Caster'] = Target,
                    }
                    G.call('技能效果_效果树_执行子效果', cur_info,
                            function ()
                                -- 触发亡语
                                G.call('卡牌关键词_亡语')

                                -- 亡语之后删除单位
                                if G.call('卡牌条件_卡牌特性判断', Target, {'等待死亡'}) then
                                    local player = G.call('房间_获取相对身份', Target['动态数据']['所有者'])
                                    G.call('角色_战场_移除随从', player, Target)
                                end
                            end
                        )
                end
            elseif cardtype == 0x10090006 then
                -- 武器
                if cardpos == '牌库' then
                elseif cardpos == '手牌' then
                elseif cardpos == '战场' then
                    local cur_info = {
                        ['Player'] = o_skill_info_效果信息['Player'],
                        ['Caster'] = Target,
                    }
                    G.call('技能效果_效果树_执行子效果', cur_info,
                            function ()
                                -- 触发亡语
                                G.call('卡牌关键词_亡语')

                                -- 亡语之后移除武器
                                if G.call('卡牌条件_卡牌特性判断', Target, {'等待死亡'}) then
                                    G.trig_event('逻辑_武器摧毁', Target)
            
                                    local player = G.call('房间_获取相对身份', Target['动态数据']['所有者'])
                                    G.call('角色_战场_移除武器', player, Target)
                                end
                            end
                        )
                end
            end

        end
    end

    effect_action_iter(nil, nil, init, action)
end

-- 死亡
t['逻辑注册_死亡'] = function ()
    local info = G.event_info()
    local card = info['Caster']

    trigger_iter(card, '死亡')
end

t['逻辑注册_冲锋添加'] = function ()
    local Target = G.event_info()

    if G.call('卡牌条件_卡牌特性判断', Target, {'首回合召唤'}) then
        card_init_attack_count(Target, G.call('卡牌属性_获取', Target, '攻击次数', '当前值'))
    end
end

t['逻辑注册_冲锋删除'] = function ()
    local Target = G.event_info()

    if G.call('卡牌条件_卡牌特性判断', Target, {'首回合召唤'}) then
        G.call('卡牌属性_设置', Target, '攻击次数', '浮动值', 0)
    end
end

t['逻辑注册_回合结束_冻结删除判断_absolute'] = function ()
    local absolute_player = G.event_info()
    local estr_player_相对身份 = G.call('房间_获取相对身份', absolute_player)

    local iter = function (Target)
        if G.call('卡牌条件_卡牌特性判断', Target, {'冻结'}) then
            if G.call('角色攻击次数判断', {['Caster']=Target}) then
                G.call('技能效果_效果树_执行子效果',
                        {
                            ['Player'] = estr_player_相对身份,
                            ['Caster'] = Target,
                            ['Target'] = {Target},
                        },
                        function ()
                            G.call('技能效果_特性', nil, {'冻结'})
                        end
                    )
            end
        end
    end

    local MinionList = G.call('角色_获取随从列表', estr_player_相对身份) or {}
    for _,Target in ipairs(MinionList) do
        iter(Target)
    end
    iter(G.call('角色_战场_获取英雄', estr_player_相对身份))
end

real_t['逻辑注册_圣盾前置条件'] = function ()
    local o_skill_info_效果信息 = G.event_info()

    if o_skill_info_效果信息 then
        local Target = o_skill_info_效果信息['逐个伤害目标']
        local int_伤害值 = o_skill_info_效果信息['逐个伤害数值']

        -- 被击者有圣盾
        return G.call('卡牌条件_卡牌特性判断', Target, {'圣盾'}) and
               (int_伤害值 > 0)
    end
end

t['逻辑注册_圣盾抵消伤害'] = function ()
    local o_skill_info_效果信息 = G.event_info()

    if o_skill_info_效果信息 then
        local Target = o_skill_info_效果信息['逐个伤害目标']
        -- 抵消伤害
        o_skill_info_效果信息['逐个伤害数值'] = 0
        -- 去除圣盾
        G.call('技能效果_效果树_执行子效果',
                {
                    ['Player'] = '我方',
                    ['Caster'] = Target,
                    ['Target'] = {Target},
                },
                function ()
                    G.call('技能效果_特性', nil, {'圣盾'})
                end
            )
    end
end

real_t['逻辑注册_剧毒前置条件'] = function ()
    local o_skill_info_效果信息 = G.event_info()

    if o_skill_info_效果信息 then
        local Caster = o_skill_info_效果信息['Caster']
        local Target = o_skill_info_效果信息['逐个伤害目标']
        local int_伤害值 = o_skill_info_效果信息['逐个伤害数值']

        -- 攻击者有剧毒
        -- 目标是随从
        return G.call('卡牌条件_卡牌特性判断', Caster, {'剧毒'}) and
               G.call('卡牌条件_卡牌类型判断', Target, {0x10090004}) and
               (int_伤害值 > 0)
    end
end

t['逻辑注册_剧毒消灭对方'] = function ()
    local o_skill_info_效果信息 = G.event_info()

    if o_skill_info_效果信息 then
        local Caster = o_skill_info_效果信息['Caster']
        local Target = o_skill_info_效果信息['逐个伤害目标']

        G.call('技能效果_效果树_执行子效果',
                {
                    ['Player'] = '我方',
                    ['Caster'] = Caster,
                    ['Target'] = {Target},
                },
                function ()
                    G.call('技能效果_消灭目标')
                end
            )
    end
end

t['逻辑注册_风怒添加'] = function ()
    local Target = G.event_info()

    local max = G.call('卡牌属性_获取', Target, '攻击次数', '浮动值') or 0
    if (max < 2) then
        G.call('卡牌属性_设置', Target, '攻击次数', '浮动值', 2)
    end
end

t['逻辑注册_风怒删除'] = function ()
    local Target = G.event_info()

    if G.call('卡牌条件_卡牌特性判断', Target, {'超级风怒'}) then
    else
        local max = G.call('卡牌属性_获取', Target, '攻击次数', '浮动值') or 0
        if (max > 1) then
            G.call('卡牌属性_设置', Target, '攻击次数', '浮动值', max - 1)
        end
    end
end

t['逻辑反注册_沉默'] = function ()
    -- 沉默或者移除时传card
    local card = G.event_info()

    local card_trglist = card['动态数据_事件']['当前注册事件']
    for key,event_name in pairs(card_trglist or {}) do
        G.removeListener(key, event_name)
        t[key] = nil
    end
    card['动态数据_事件']['当前注册事件'] = {}
    card['卡牌效果'] = {}

    -- 其他修改
end

real_t['通用逻辑_角色相关流程注册'] = function (estr_absolute_id_type_绝对身份)
    local cond = nil
    
    -- 特定流程
    G.addListener('逻辑注册_水晶设置_absolute', {'流程_回合开始', estr_absolute_id_type_绝对身份}, cond, EVENT_PRIOR.SetMana, EVENT_GROUP.SetMana)
    G.addListener('逻辑注册_抽牌_absolute', {'流程_回合开始', estr_absolute_id_type_绝对身份}, cond, EVENT_PRIOR.drawCard, EVENT_GROUP.drawCard)
    G.addListener('逻辑注册_攻击次数重置_回合开始_absolute', {'流程_回合开始', estr_absolute_id_type_绝对身份}, cond, EVENT_PRIOR.setAttackCount, EVENT_GROUP.setAttackCount)
    G.addListener('逻辑注册_攻击状态设置_回合结束_absolute', {'流程_回合结束', estr_absolute_id_type_绝对身份}, cond, EVENT_PRIOR.setAttackCount, EVENT_GROUP.setAttackCount)

    -- 武器相关处理
    G.addListener('逻辑注册_武器功能_回合开始_absolute', {'流程_回合开始', estr_absolute_id_type_绝对身份}, cond, EVENT_PRIOR.weaponEffect, EVENT_GROUP.weaponEffect)
    G.addListener('逻辑注册_武器功能_回合结束_absolute', {'流程_回合结束', estr_absolute_id_type_绝对身份}, cond, EVENT_PRIOR.weaponEffect, EVENT_GROUP.weaponEffect)
    
    -- 冻结解除
    G.addListener('逻辑注册_回合结束_冻结删除判断_absolute', {'流程_回合结束', estr_absolute_id_type_绝对身份}, cond, EVENT_PRIOR.cancelFrozen, EVENT_GROUP.cancelFrozen)
end

real_t['通用逻辑_默认流程注册'] = function ()
    local cond = nil
    local prior_base = EVENT_PRIOR.base
    local group_system = EVENT_GROUP.system
    
    -- trigger注册
    G.addListener('逻辑注册_初始化', {'逻辑_卡牌初始化'}, cond, EVENT_PRIOR.first, group_system)
    G.addListener('逻辑注册_别人初始化', {'卡牌实例_信息更新'}, real_t['逻辑注册_别人初始化前置条件'], EVENT_PRIOR.first, group_system)
    G.addListener('逻辑注册_上场', {'逻辑_随从上场前'}, cond, prior_base, group_system)
    G.addListener('逻辑注册_上场', {'逻辑_武器上场前'}, cond, prior_base, group_system)
    G.addListener('逻辑注册_上手', {'逻辑_卡牌上手前'}, cond, prior_base, group_system)
    G.addListener('逻辑注册_生效', {'逻辑_卡牌生效'}, cond, prior_base, group_system)
    G.addListener('逻辑注册_添加', {'逻辑_技能添加前'}, cond, prior_base, group_system)

    -- 特定流程
    G.addListener('逻辑注册_攻击次数设置_单个上场', {'逻辑_随从上场'}, cond, EVENT_PRIOR.setAttackCount, EVENT_GROUP.setAttackCount)

    -- 武器相关处理
    G.addListener('逻辑注册_武器功能_武器添加', {'逻辑_武器装备'}, cond, EVENT_PRIOR.weaponEffect, EVENT_GROUP.weaponEffect)
    G.addListener('逻辑注册_武器功能_武器摧毁', {'逻辑_武器摧毁'}, cond, EVENT_PRIOR.weaponEffect, EVENT_GROUP.weaponEffect)
    G.addListener('逻辑注册_武器功能_攻击力变化', {'逻辑_卡牌属性改变', nil, '攻击'}, real_t['逻辑注册_武器功能_攻击力变化前置条件'], EVENT_PRIOR.weaponEffect, EVENT_GROUP.weaponEffect)
    G.addListener('逻辑注册_武器功能_消耗耐久', {'逻辑_卡牌攻击'}, real_t['逻辑注册_武器功能_消耗耐久前置条件'], EVENT_PRIOR.weaponDurability, EVENT_GROUP.weaponDurability)

    -- 战吼
    G.addListener('逻辑注册_战吼', {'逻辑关键词_战吼前'}, cond, prior_base, group_system)

    -- 死亡处理
    G.addListener('逻辑注册_卡牌死亡结算', {'逻辑_卡牌死亡结算'}, cond, EVENT_PRIOR.first, group_system)

    -- 亡语
    G.addListener('逻辑注册_死亡', {'逻辑关键词_亡语前'}, cond, prior_base, group_system)

    -- 冲锋
    G.addListener('逻辑注册_冲锋添加', {'逻辑_卡牌特性设置', nil, '冲锋'}, cond, prior_base, EVENT_GROUP.charge)
    G.addListener('逻辑注册_冲锋删除', {'逻辑_卡牌特性删除', nil, '冲锋'}, cond, prior_base, EVENT_GROUP.charge)

    -- 圣盾
    G.addListener('逻辑注册_圣盾抵消伤害', {'逻辑_技能效果_直接伤害前'}, real_t['逻辑注册_圣盾前置条件'], EVENT_PRIOR.divineShield, EVENT_GROUP.divineShield)
    
    -- 剧毒
    G.addListener('逻辑注册_剧毒消灭对方', {'逻辑_技能效果_直接伤害'}, real_t['逻辑注册_剧毒前置条件'], EVENT_PRIOR.poisonous, EVENT_GROUP.poisonous)

    -- 风怒
    G.addListener('逻辑注册_风怒添加', {'逻辑_卡牌特性设置', nil, '风怒'}, cond, prior_base, EVENT_GROUP.Windfury)
    G.addListener('逻辑注册_风怒删除', {'逻辑_卡牌特性删除', nil, '风怒'}, cond, prior_base, EVENT_GROUP.Windfury)

    -- 沉默
    -- G.addListener('逻辑反注册_沉默', {''}, cond, prior_base, group_system)

end

-- ============================================
-- ============================================
-- ============================================
-- 常用事件接口
-- ============================================
-- ============================================
-- ============================================

t['卡牌使用_攻击'] = function ()
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local Caster = o_skill_info_效果信息['Caster']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _,Target in ipairs(TargetList) do
            G.call('技能效果_效果树_执行子效果', 
                    {
                        ['Player'] = o_skill_info_效果信息['Player'],
                        ['Caster'] = o_skill_info_效果信息['Caster'],
                        ['Target'] = {Target},
                    }, 
                    function ()
                        G.call('normal_attck')

                        -- 攻击次数累加
                        local cur = G.call('卡牌属性_获取', Caster, '攻击次数', '当前值') or 0
                        G.call('卡牌属性_设置', Caster, '攻击次数', '当前值', cur + 1)
                    end
                  )
        end
    end
    effect_action_iter(nil, '逻辑_卡牌攻击', init, action)
end

do -- 伤害流程
    local iter = function (int_伤害值, estr_damage_type_伤害类型, str_事件名)
        local init = function (o_skill_info_效果信息)
            o_skill_info_效果信息['原始伤害数值'] = int_伤害值
            o_skill_info_效果信息['伤害类型'] = estr_damage_type_伤害类型
        end

        local action = function (o_skill_info_效果信息)
            local int_中间伤害值 = o_skill_info_效果信息['中间伤害数值'] or o_skill_info_效果信息['原始伤害数值']
            local TargetList = o_skill_info_效果信息['Target'] or {}
            local _int_伤害数值 = {}

            o_skill_info_效果信息['最终伤害目标'] = {}
            o_skill_info_效果信息['伤害数值'] = _int_伤害数值

            for k,Target in ipairs(TargetList) do
                o_skill_info_效果信息['逐个伤害数值'] = int_中间伤害值
                o_skill_info_效果信息['逐个伤害目标'] = Target
                G.call('single_damage')
            end
        end

        effect_action_iter(nil, str_事件名, init, action)
    end

    real_t['技能效果_法术伤害'] = function (int_伤害值)
        iter(int_伤害值, '法术', '逻辑_技能效果_法术伤害')
    end

    real_t['技能效果_英雄技能伤害'] = function (int_伤害值)
        iter(int_伤害值, '英雄技能', '逻辑_技能效果_英雄技能伤害')
    end

    real_t['技能效果_随从伤害'] = function (int_伤害值)
        iter(int_伤害值, '随从', '逻辑_技能效果_随从伤害')
    end

    real_t['技能效果_武器伤害'] = function (int_伤害值)
        iter(int_伤害值, '武器', '逻辑_技能效果_武器伤害')
    end
end

t['技能效果_伤害'] = function (int_伤害值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local Caster = o_skill_info_效果信息['Caster']
    local cardtype = (Caster['逻辑数据'] or {})['类型']

    if cardtype == 0x10090003 then
        -- 英雄技能
        G.call('技能效果_英雄技能伤害', int_伤害值)
    elseif cardtype == 0x10090004 then
        -- 随从
        G.call('技能效果_随从伤害', int_伤害值)
    elseif cardtype == 0x10090005 then
        -- 法术
        G.call('技能效果_法术伤害', int_伤害值)
    elseif cardtype == 0x10090006 then
        -- 武器
        G.call('技能效果_武器伤害', int_伤害值)
    end
end

do -- 治疗流程
    local iter = function (int_治疗值, estr_heal_type_治疗类型, str_事件名)
        local init = function (o_skill_info_效果信息)
            o_skill_info_效果信息['原始治疗数值'] = int_治疗值
            o_skill_info_效果信息['治疗类型'] = estr_heal_type_治疗类型
        end

        local action = function (o_skill_info_效果信息)
            local int_中间治疗值 = o_skill_info_效果信息['中间治疗数值'] or o_skill_info_效果信息['原始治疗数值'] or 0
            local TargetList = o_skill_info_效果信息['Target'] or {}
            local _int_治疗数值 = {}

            o_skill_info_效果信息['最终治疗目标'] = {}
            o_skill_info_效果信息['治疗数值'] = _int_治疗数值

            for k,Target in ipairs(TargetList) do
                o_skill_info_效果信息['逐个治疗目标'] = Target

                -- 控制治疗，防止溢出
                local cur_hp = G.call('卡牌属性_获取', Target, '生命', '当前值') or 0
                local max_hp = G.call('卡牌属性_获取', Target, '生命', '最大值') or 0
                local int_治疗值 = math.min(int_中间治疗值, max_hp - cur_hp)
                o_skill_info_效果信息['逐个治疗数值'] = int_治疗值

                G.call('single_heal')
            end
        end

        effect_action_iter(nil, str_事件名, init, action)
    end

    real_t['技能效果_法术治疗'] = function (int_治疗值)
        iter(int_治疗值, '法术', '逻辑_技能效果_法术治疗')
    end

    real_t['技能效果_英雄技能治疗'] = function (int_治疗值)
        iter(int_治疗值, '英雄技能', '逻辑_技能效果_英雄技能治疗')
    end

    real_t['技能效果_随从治疗'] = function (int_治疗值)
        iter(int_治疗值, '随从', '逻辑_技能效果_随从治疗')
    end

    real_t['技能效果_武器治疗'] = function (int_治疗值)
        iter(int_治疗值, '武器', '逻辑_技能效果_武器治疗')
    end
end

t['技能效果_治疗'] = function (int_治疗值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local Caster = o_skill_info_效果信息['Caster']
    local cardtype = (Caster['逻辑数据'] or {})['类型']

    if cardtype == 0x10090003 then
        -- 英雄技能
        G.call('技能效果_英雄技能治疗', int_治疗值)
    elseif cardtype == 0x10090004 then
        -- 随从
        G.call('技能效果_随从治疗', int_治疗值)
    elseif cardtype == 0x10090005 then
        -- 法术
        G.call('技能效果_法术治疗', int_治疗值)
    elseif cardtype == 0x10090006 then
        -- 武器
        G.call('技能效果_武器治疗', int_治疗值)
    end
end

t['技能效果_法术强度生效'] = function (int_法术强度)
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local 伤害类型 = o_skill_info_效果信息['伤害类型']
        if 伤害类型 == '法术' then
            local int_中间伤害值 = o_skill_info_效果信息['中间伤害数值'] or o_skill_info_效果信息['原始伤害数值'] or 0
            o_skill_info_效果信息['中间伤害数值'] = int_中间伤害值 + math.max(int_法术强度 or 0, 0)
        end
    end

    effect_action_iter(nil, nil, init, action)
end

t['技能效果_本回合当前水晶'] = function (int_变动值)
    local init = function (v)
        return function (o_skill_info_效果信息)
            o_skill_info_效果信息['当前水晶变化'] = v
        end
    end

    local action = function (o_skill_info_效果信息)
        local estr_player_相对身份 = o_skill_info_效果信息['Player']
        local int_变动值 = o_skill_info_效果信息['当前水晶变化']

        if estr_player_相对身份 then
            local cur_value = G.call('角色_获取水晶数据', estr_player_相对身份, '当前值') or 0
            G.call('角色属性_水晶_设置', estr_player_相对身份, '当前值', cur_value + int_变动值)
        end
    end

    if int_变动值 then
        effect_action_iter(nil, '逻辑_技能效果_当前水晶变化', init(int_变动值), action)

        G.call('tLua_add_listener', 
                {"流程_回合结束"},
                function ()
                    effect_action_iter(nil, nil, init(-int_变动值), action)
                end,
                nil,
                EVENT_PRIOR.last,
                nil
              )
    end
end

t['技能效果_最大水晶'] = function (int_变动值)
    local init = function (o_skill_info_效果信息)
        o_skill_info_效果信息['最大水晶变化'] = int_变动值
    end

    local action = function ()
        local estr_player_相对身份 = o_skill_info_效果信息['Player']
        local int_变动值 = o_skill_info_效果信息['当前水晶变化']

        if estr_player_相对身份 then
            local cur_value = G.call('角色_获取水晶数据', estr_player_相对身份, '最大值') or 0
            G.call('角色属性_水晶_设置', estr_player_相对身份, '最大值', cur_value + int_变动值)
        end
    end

    if int_变动值 then
        effect_action_iter(nil, '逻辑_技能效果_最大水晶变化', init, action)
    end
end

t['技能效果_当前水晶'] = function (int_变动值)
    local init = function ()
        o_skill_info_效果信息['当前水晶变化'] = int_变动值
    end

    local action = function ()
        local estr_player_相对身份 = o_skill_info_效果信息['Player']
        local int_变动值 = o_skill_info_效果信息['当前水晶变化']

        if estr_player_相对身份 then
            local cur_value = G.call('角色_获取水晶数据', estr_player_相对身份, '当前值') or 0
            G.call('角色属性_水晶_设置', estr_player_相对身份, '当前值', cur_value + int_变动值)
        end
    end

    if int_变动值 then
        effect_action_iter(nil, '逻辑_技能效果_当前水晶变化', init, action)
    end
end

t['技能效果_本回合攻击'] = function (int_变动值)
    local init = function (o_skill_info_效果信息)
        o_skill_info_效果信息['当前攻击变化'] = int_变动值
    end

    local action = function (o_skill_info_效果信息)
        local int_变动值 = o_skill_info_效果信息['当前攻击变化']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local cur_value = G.call('卡牌属性_获取', Target, '攻击', '浮动值') or 0
            G.call('卡牌属性_设置', Target, '攻击', '浮动值', cur_value + int_变动值)

            local tar = Target
            local val = int_变动值
            G.call('tLua_add_multlisteners', 
                    {
                        {
                            {"流程_回合结束"},
                            function ()
                                local cur_value = G.call('卡牌属性_获取', tar, '攻击', '浮动值') or 0
                                G.call('卡牌属性_设置', tar, '攻击', '浮动值', cur_value - val)
                            end,
                            nil,
                            EVENT_PRIOR.last,
                            nil
                        },
                        {
                            {"逻辑_卡牌属性设置", tar, '攻击'},
                            function () end,
                            nil,
                            EVENT_PRIOR.first,
                            nil
                        },
                    }
                )
        end
    end

    if int_变动值 then
        effect_action_iter(nil, '逻辑_技能效果_当前攻击变化', init, action)
    end
end

t['技能效果_护甲'] = function (int_变动值)
    local init = function (o_skill_info_效果信息)
        o_skill_info_效果信息['当前护甲变化'] = int_变动值
    end

    local action = function (o_skill_info_效果信息)
        local int_变动值 = o_skill_info_效果信息['当前护甲变化']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local cur_value = G.call('卡牌属性_获取', Target, '护甲', '当前值') or 0
            G.call('卡牌属性_设置', Target, '护甲', '当前值', cur_value + int_变动值)
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_当前护甲变化', init, action)
end

t['技能效果_生命上限'] = function (int_变动值)
    local init = function (o_skill_info_效果信息)
        o_skill_info_效果信息['当前生命变化'] = int_变动值
    end

    local action = function (o_skill_info_效果信息)
        local int_变动值 = o_skill_info_效果信息['当前生命变化']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local buff_value = G.call('卡牌属性_获取', Target, '生命', '浮动值') or 0
            local cur_value = G.call('卡牌属性_获取', Target, '生命', '当前值') or 0
            G.call('卡牌属性_设置', Target, '生命', '浮动值', buff_value + int_变动值)
            G.call('卡牌属性_设置', Target, '生命', '当前值', cur_value + int_变动值)
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_当前生命变化', init, action)
end

t['技能效果_攻击'] = function (int_变动值)
    local init = function (o_skill_info_效果信息)
        o_skill_info_效果信息['当前攻击变化'] = int_变动值
    end

    local action = function (o_skill_info_效果信息)
        local int_变动值 = o_skill_info_效果信息['当前攻击变化']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local cur_value = G.call('卡牌属性_获取', Target, '攻击', '浮动值') or 0
            G.call('卡牌属性_设置', Target, '攻击', '浮动值', cur_value + int_变动值)
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_当前攻击变化', init, action)
end

t['技能效果_特性'] = function (_string_添加特性, _string_移除特性, _string_还原特性)
    local get_attr = CARD_GET_ATTR
    local flags_data = CARD_FLAGS

    local cardflag_set = function (Target, data, flag)
        for index, t in ipairs(flags_data) do
            if t[flag] then
                data[index] = (data[index] or 0) | (1 << t[flag])
            end
        end

        local countmap = get_attr(Target, '动态数据', '特性层数') or {}
        countmap[flag] = (countmap[flag] or 0) + 1

        G.trig_event('逻辑_卡牌特性设置', Target, flag)
    end

    local cardflag_del = function (Target, data, flag)
        for index, t in ipairs(flags_data) do
            if t[flag] then
                data[index] = (data[index] or 0) & (~(1 << t[flag]))
            end
        end

        local countmap = get_attr(Target, '动态数据', '特性层数') or {}
        countmap[flag] = nil

        G.trig_event('逻辑_卡牌特性删除', Target, flag)
    end

    local cardflag_reset = function (Target, root_data, data, flag)
        local countmap = get_attr(Target, '动态数据', '特性层数') or {}
        local count = countmap[flag] or 0
        if count > 1 then
            -- 特性被叠加过多次
            countmap[flag] = count - 1
        else
            for index, t in ipairs(flags_data) do
                if t[flag] then
                    -- 先删除，再叠加
                    data[index] = ((data[index] or 0) & (~(1 << t[flag]))) | 
                                  ((root_data[index] or 0) & (1 << t[flag]))
                end
            end

            -- TODO，判断是否需要抛出事件
            countmap[flag] = nil
        end
    end

    local init = function (o_skill_info_效果信息)
        o_skill_info_效果信息['当前添加特性'] = _string_添加特性
        o_skill_info_效果信息['当前移除特性'] = _string_移除特性
        o_skill_info_效果信息['当前还原特性'] = _string_还原特性
    end
    local action = function (o_skill_info_效果信息)
        _string_添加特性 = o_skill_info_效果信息['当前添加特性']
        _string_移除特性 = o_skill_info_效果信息['当前移除特性']
        _string_还原特性 = o_skill_info_效果信息['当前还原特性']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local flags = get_attr(Target, '逻辑数据', '卡牌特性') or {}
            for k,v in ipairs(_string_添加特性 or {}) do
                cardflag_set(Target, flags, v)
            end
            for k,v in ipairs(_string_移除特性 or {}) do
                cardflag_del(Target, flags, v)
            end

            -- 还原特性，读取root的值
            local root_flags = get_attr(G.QueryName(Target.root), '逻辑数据', '卡牌特性') or {}
            for k,v in ipairs(_string_还原特性 or {}) do
                cardflag_reset(Target, root_flags, flags, v)
            end

            if Target['逻辑数据'] then
                Target['逻辑数据']['卡牌特性'] = flags
            else
                Target['逻辑数据'] = {
                    ['卡牌特性'] = flags
                }
            end
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_当前特性变化', init, action)
end

t['技能效果_本回合特性'] = function (_string_添加特性)
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        G.call('技能效果_特性', _string_添加特性)

        G.call('tLua_add_multlisteners', {
            {
                {"流程_回合结束"},
                function ()
                    G.call('技能效果_效果树_执行子效果', o_skill_info_效果信息,
                        function ()
                            G.call('技能效果_特性', nil, nil, _string_添加特性)
                        end
                    )
                end,
                nil,
                EVENT_PRIOR.last,
                nil
            }
        })
    end

    effect_action_iter(nil, nil, init, action)
end

t['技能效果_添加BUFF'] = function (i_skill_buffID)
    local o_skill_buffID = G.QueryName(i_skill_buffID)
    if o_skill_buffID then
    else
        return
    end

    local init = function (o_skill_info_效果信息)
        o_skill_info_效果信息['当前添加buff'] = o_skill_buffID
    end
    local action = function (o_skill_info_效果信息)
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            o_skill_info_效果信息['逐个伤害目标'] = Target
            single_add_buff()
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_添加Buff', init, action)
end

t['技能效果_抽牌'] = function ()
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local estr_player_相对身份 = o_skill_info_效果信息['Player']

        if estr_player_相对身份 then
            -- TODO，缺少处理，默认自己抽自己
            G.call('角色_牌库抽取卡牌', estr_player_相对身份, estr_player_相对身份)
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_牌库抽牌', init, action)
end

t['技能效果_创建手牌'] = function (i_card_创建卡牌ID, boolean_是否明牌, boolean_是否是实例)
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        estr_player_相对身份 = o_skill_info_效果信息['Player']

        if estr_player_相对身份 then
            -- TODO，缺少处理
            local o_card_添加卡牌实例
            if boolean_是否是实例 then
                o_card_添加卡牌实例 = G.QueryName(i_card_创建卡牌ID)
            else
                o_card_添加卡牌实例 = G.call('卡牌实例化', G.QueryName(i_card_创建卡牌ID), estr_player_相对身份)
            end
            G.call('角色_添加手牌', estr_player_相对身份, o_card_添加卡牌实例, boolean_是否明牌)
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_创建手牌', init, action)
end

t['技能效果_设置生命上限'] = function (int_变动值)
    if int_变动值 <= 0 then
        return
    end

    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local orig_v = G.call('卡牌属性_获取', Target, '生命', '原始值') or 0
            G.call('卡牌属性_设置', Target, '生命', '浮动值', int_变动值 - orig_v)
            G.call('卡牌属性_设置', Target, '生命', '当前值', G.call('卡牌属性_获取', Target, '生命', '最大值'))
        
            G.trig_event('逻辑_卡牌属性设置', Target, '生命')
        end
    end

    effect_action_iter(nil, nil, init, action)
end

t['技能效果_设置攻击力'] = function (int_变动值)
    if int_变动值 < 0 then
        return
    end

    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local orig_v = G.call('卡牌属性_获取', Target, '攻击', '原始值') or 0
            G.call('卡牌属性_设置', Target, '攻击', '浮动值', int_变动值 - orig_v)
        
            G.trig_event('逻辑_卡牌属性设置', Target, '攻击')
        end
    end

    effect_action_iter(nil, nil, init, action)
end

t['技能效果_战场光环'] = function (o_skill, Caster, func_add, func_del)
    local func_filer = G.call('卡牌数据_制作过滤器', o_skill['目标筛选'], Caster)

    aura_add_buff(func_filer, func_add, func_del, 
                    { -- 光环添加事件
                        {'逻辑_随从上场'},
                        {'逻辑_武器上场'},
                    },
                    { -- 光环buff删除事件

                    },
                    { -- 光环移除事件
                        
                    },
                    { -- 自定义事件

                    }
                )
end

t['技能效果_追踪术'] = function (int_追踪数量)
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local estr_player_相对身份 = o_skill_info_效果信息['Player']
        local Caster = o_skill_info_效果信息['Caster']
        local _o_randomlib_抽牌牌库 = G.call('角色_获取牌库', estr_player_相对身份)
    
        if _o_randomlib_抽牌牌库 then
        else
            return
        end
    
        local random_iter = function ()
            return _o_randomlib_抽牌牌库[1](1)[1] or -- 为空，说明牌库顶里面没有卡牌
                   _o_randomlib_抽牌牌库[2](1)[1] or -- 为空，说明随机牌库里面没有卡牌
                   _o_randomlib_抽牌牌库[3](1)[1] -- 为空，说明牌库底里面没有卡牌
        end

        local _o_card_选择列表 = {}
        for i = 1, int_追踪数量, 1 do
            _o_card_选择列表[i] = random_iter()
        end

        G.trig_event('UI_牌库更新')
    
        if #_o_card_选择列表 > 0 then
            G.call('卡牌注册指令_发现', _o_card_选择列表, 0x10040005)
    
            -- TODO，这里应该是wait才对
            G.call('tLua_add_listener', 
                    {"UI_发现选择完毕"},
                    function ()
                        local o_order_info_当前指令信息 = G.event_info()
                        local o_card_select = o_order_info_当前指令信息['Caster']
    
                        G.call('技能效果_效果树_执行子效果', 
                                    {
                                        ['Player'] = o_order_info_当前指令信息['Player'],
                                        ['Caster'] = Caster,
                                        ['Target'] = {o_card_select},
                                        ['Parent'] = o_skill_info_效果信息,
                                    }, 
                                    function ()
                                        G.call('技能效果_创建手牌', o_card_select.name, false, true)
                                    end
                                )
                    end,
                    nil,
                    EVENT_PRIOR.last,
                    nil
                )
        else
            -- 没有卡牌，效果结束
        end
    end

    effect_action_iter(nil, nil, init, action)
end

t['技能效果_召唤'] = function (datas)
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local estr_player_相对身份 = o_skill_info_效果信息['Player']

        if estr_player_相对身份 then
        else
            return
        end

        for _,info in ipairs(datas) do
            local side = info[1]
            local pos = info[2]
            local cardid = info[3]

            local player
            if side == '我方' then
                player = G.call('房间_获取相对身份', G.call('房间_获取绝对身份', '我方', estr_player_相对身份))
            elseif side == '敌方' then
                player = G.call('房间_获取相对身份', G.call('房间_获取绝对身份', '敌方1', estr_player_相对身份))
            end

            local o_card_召唤单位
            if type(cardid) == 'number' then
                o_card_召唤单位 = G.call('卡牌实例化', G.QueryName(cardid), estr_player_相对身份)
            elseif type(cardid) == 'table' then
            else
                break
            end

            local index
            if pos ~= '末尾' then
                index = o_skill_info_效果信息['MinionPos']
                if index then
                    if pos == '右邻' then
                        index = index + 1
                    end
                end
            end

            G.call('技能效果_效果树_执行子效果', 
                        {
                            ['Player'] = player,
                            ['Caster'] = o_card_召唤单位,
                            ['MinionPos'] = index,
                        }, 
                        function ()
                            G.call('卡牌使用_上场')
                            G.call('卡牌使用_随从召唤')
                        end
                    )
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_召唤单位', init, action)
end

t['技能效果_奥数飞弹'] = function (int_随机次数, int_单个伤害, filter)
    local init = function (o_skill_info_效果信息)
        o_skill_info_效果信息['原始伤害数值'] = int_随机次数
        o_skill_info_效果信息['伤害类型'] = '法术'
    end

    local action = function (o_skill_info_效果信息)
        local int_伤害目标数量 = o_skill_info_效果信息['中间伤害数值'] or o_skill_info_效果信息['原始伤害数值']
        local _int_伤害数值 = {}

        o_skill_info_效果信息['最终伤害目标'] = {}
        o_skill_info_效果信息['伤害数值'] = _int_伤害数值

        for i = 1, int_伤害目标数量, 1 do
            filter()

            for _,Target in ipairs(o_skill_info_效果信息['Target'] or {}) do
                o_skill_info_效果信息['逐个伤害目标'] = Target
                o_skill_info_效果信息['逐个伤害数值'] = int_单个伤害
                G.call('single_damage')
            end
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_法术伤害', init, action)
end

t['技能效果_变形'] = function (i_card_变形卡牌ID, boolean_是否保留浮动值)
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local TargetList = o_skill_info_效果信息['Target']
        for _,Target in ipairs(TargetList) do
            -- 清空数据
            Target['卡牌属性'] = nil
            Target['逻辑数据'] = nil
            Target.root = i_card_变形卡牌ID
            rawset(Target, 'delete_key', nil)
            setmetatable(Target, getmetatable(G.QueryName(i_card_变形卡牌ID)))

            -- 动态数据调整
            local 动态数据 = Target['动态数据']
            动态数据['当前属性'] = {}
            动态数据['特性层数'] = {}
            if boolean_是否保留浮动值 then
            else
                动态数据['浮动属性'] = {}
            end

            -- TODO：清空监听相关内容，通过事件抛出就行
            local player = G.call('房间_获取相对身份', 动态数据['所有者'])
            G.call('技能效果_效果树_执行子效果', 
                        {
                            ['Player'] = player,
                            ['Caster'] = Target,
                            ['MinionPos'] = nil, -- TODO，获取一下位置
                        }, 
                        function ()
                            G.call('卡牌使用_上场')

                            -- 变形只有上场，不是召唤
                            -- G.call('卡牌使用_随从召唤')
                        end
                    )

            -- TODO，临时处理，后面需要动画来管理
            G.trig_event('卡牌实例_信息更新', Target)
        end
    end

    effect_action_iter(nil, nil, init, action)
end

t['技能效果_死亡结算'] = function ()
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
    end

    G.call('技能效果_效果树_执行子效果',
            {
                ['Player'] = '我方',
            },
            function ()
                effect_action_iter(nil, '逻辑_卡牌死亡结算', init, action)
            end
        )
end

t['技能效果_消灭目标'] = function ()
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        G.call('技能效果_特性', {'等待死亡'})
    end

    effect_action_iter(nil, '逻辑_技能效果_消灭目标', init, action)
end

t['技能效果_牧师脏牌'] = function (int_获取数量, estr_cardpos_type_卡牌来源)
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local cardlist = G.call('网络通讯_请求信息', 
                                    '敌方1', -- TODO，相对玩家获取需要额外判断
                                    {'网络通讯_技能效果_获知随机卡牌', int_获取数量, estr_cardpos_type_卡牌来源, true}
                                )
        for _, cardname in ipairs(cardlist or {}) do
            G.call('技能效果_创建手牌', cardname, false, true)
        end
    end

    effect_action_iter(nil, nil, init, action)
end

t['技能效果_牧师精控'] = function ()
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local player = o_skill_info_效果信息['Player']
        local TargetList = o_skill_info_效果信息['Target']

        for _, Target in ipairs(TargetList or {}) do
            G.call('技能效果_效果树_执行子效果',
                    {
                        ['Player'] = player,
                        ['Caster'] = Target,
                        ['Target'] = {Target},
                    },
                    function ()
                        local owner = G.call('房间_获取相对身份', Target['动态数据']['所有者'])
                        G.call('角色_战场_移除随从', owner, Target)

                        Target['动态数据']['所有者'] = G.call('房间_获取绝对身份', player)

                        G.call('卡牌使用_上场')
                        
                        -- 精控只有上场，不是召唤
                        -- TODO，判断场面是否满了
                        G.call('角色_战场_添加随从', player, Target)
                    end
                )
        end
    end

    effect_action_iter(nil, nil, init, action)
end

t['技能效果_潜行者闷棍'] = function ()
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local TargetList = o_skill_info_效果信息['Target']

        for _, Target in ipairs(TargetList or {}) do
            local owner = G.call('房间_获取相对身份', Target['动态数据']['所有者'])
            local Caster = o_skill_info_效果信息['Caster']

            G.call('技能效果_效果树_执行子效果',
                    {
                        ['Player'] = owner,
                        ['Caster'] = Caster,
                        ['Target'] = {Target},
                    },
                    function ()
                        local int_手牌数量 = G.call('角色_获取手牌数量', owner)

                        if (int_手牌数量 < HANDCARDS_MAX_COUNT) then
                            -- 手牌没有满，移动回手牌
                            G.call('角色_战场_移除随从', owner, Target)
                            G.call('技能效果_创建手牌', Target.name, false, true)
                        else
                            G.call('技能效果_消灭目标')
                        end
                    end
                )
        end
    end

    effect_action_iter(nil, nil, init, action)
end

t['技能效果_装备武器'] = function (i_card_武器卡牌ID, boolean_是否是实例)
    local init = function (o_skill_info_效果信息)
    end

    local action = function (o_skill_info_效果信息)
        local estr_player_相对身份 = o_skill_info_效果信息['Player']
        if estr_player_相对身份 then
        else
            return
        end

        -- TODO，缺少处理
        local o_card_添加卡牌实例
        if boolean_是否是实例 then
            o_card_添加卡牌实例 = G.QueryName(i_card_武器卡牌ID)
        else
            o_card_添加卡牌实例 = G.call('卡牌实例化', G.QueryName(i_card_武器卡牌ID), estr_player_相对身份)
        end

        G.call('技能效果_效果树_执行子效果',
                {
                    ['Player'] = estr_player_相对身份,
                    ['Caster'] = o_card_添加卡牌实例,
                },
                function ()
                    G.call('卡牌使用_上场')
                    G.call('卡牌使用_武器装备')
                end
            )
    end

    -- TODO，武器替换需要抛出事件
    effect_action_iter(nil, nil, init, action)
end

t['技能效果_弃牌'] = function (int_编号)
    local init = function (o_skill_info_效果信息)
        local estr_player_相对身份 = o_skill_info_效果信息['Player']
        local count = G.call('角色_获取手牌数量', estr_player_相对身份)
        if count > 0 then
            if int_编号 then
                if int_编号 <= count then
                else
                    return
                end
            else
                int_编号 = math.random(count)
            end
        else
            return
        end

        o_skill_info_效果信息['弃牌编号'] = int_编号
    end

    local action = function (o_skill_info_效果信息)
        local int_编号 = o_skill_info_效果信息['弃牌编号']

        if int_编号 then
            -- todo，这里调用丢弃手牌接口
            G.call('角色_移除手牌', estr_player_相对身份, int_编号)
        end
    end

    effect_action_iter(nil, '逻辑_技能效果_弃牌', init, action)
end

-- ============================================
-- ============================================
-- ============================================
-- 卡牌选取相关接口
-- ============================================
-- ============================================
-- ============================================

t['技能目标_选取英雄'] = function (estr_player_相对身份)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local info_player = o_skill_info_效果信息['Player']
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份, info_player)
    local TargetList = o_skill_info_效果信息['Target'] or {}
    local hero = G.call('角色_战场_获取英雄_绝对身份', estr_absolute_id_type_绝对身份)
    if hero then
        table.insert(TargetList, hero)
    end
    o_skill_info_效果信息['Target'] = TargetList
end

t['技能目标_选取武器'] = function (estr_player_相对身份)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local info_player = o_skill_info_效果信息['Player']
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份, info_player)
    local TargetList = o_skill_info_效果信息['Target'] or {}
    local weapon = G.call('角色_战场_获取武器_绝对身份', estr_absolute_id_type_绝对身份)
    if weapon then
        table.insert(TargetList, weapon)
    end
    o_skill_info_效果信息['Target'] = TargetList
end

t['技能目标_选取随从'] = function (estr_player_相对身份, filter)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local info_player = o_skill_info_效果信息['Player']
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份, info_player)
    local TargetList = o_skill_info_效果信息['Target'] or {}
    local FindList = G.call('角色_获取随从列表_绝对身份', estr_absolute_id_type_绝对身份)

    if filter then
        FindList = G.call('array_filter', FindList, filter)
    end

    for k,v in ipairs(FindList) do
        table.insert(TargetList, v)
    end

    o_skill_info_效果信息['Target'] = TargetList
end

t['技能目标_剔除目标'] = function (_o_card_delTargetList)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local TargetList = o_skill_info_效果信息['Target'] or {}

    if type(_o_card_delTargetList) == 'table' then
        for i = #TargetList, 1, -1 do
            local Target = TargetList[i]
            for _,v in ipairs(_o_card_delTargetList) do
                if v.name == Target.name then
                    table.remove(TargetList, i)
                    break
                end
            end
        end
    end

    o_skill_info_效果信息['Target'] = TargetList
end

t['技能目标_添加目标'] = function (_o_card_addTargetList)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local TargetList = o_skill_info_效果信息['Target'] or {}

    if type(_o_card_addTargetList) == 'table' then
        for _,v in ipairs(_o_card_addTargetList) do
            for _,Target in ipairs(TargetList) do
                if v.name == Target.name then
                    -- 不能重复加
                    goto next
                end
            end

            table.insert(TargetList, v)
            ::next::
        end
    end

    o_skill_info_效果信息['Target'] = TargetList
end

t['技能目标_随机选择'] = function (int_选择数量, i_randomlib_type_选择类型)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local TargetList = o_skill_info_效果信息['Target'] or {}
    local rlib = G.call('Create_Randomlib', G.QueryName(i_randomlib_type_选择类型 or 0x100c0001))
    for _,tar in ipairs(TargetList) do
        rlib:添加数据({tar, 100})
    end
    rlib:初始化(true, true)

    o_skill_info_效果信息['Target'] = rlib(int_选择数量)
end

-- ============================================
-- ============================================
-- ============================================
-- 卡牌生成相关接口，只有本地玩家才能调用
-- ============================================
-- ============================================
-- ============================================
real_t['卡牌实例表_初始化'] = function ()
    G.newinst_cache['o_card_redplayer1'] = {}
    G.newinst_cache['o_card_redplayer2'] = {}
    G.newinst_cache['o_card_blueplayer1'] = {}
    G.newinst_cache['o_card_blueplayer2'] = {}

    local misc = G.misc()

    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', '我方')
    local dbname
    if estr_absolute_id_type_绝对身份 == '红1' then
        dbname = 'o_card_redplayer1'
    elseif estr_absolute_id_type_绝对身份 == '红2' then
        dbname = 'o_card_redplayer2'
    elseif estr_absolute_id_type_绝对身份 == '蓝1' then
        dbname = 'o_card_blueplayer1'
    elseif estr_absolute_id_type_绝对身份 == '蓝2' then
        dbname = 'o_card_blueplayer2'
    end
    if dbname then
        misc['卡牌实例表'] = dbname
    end
    
    -- 机制启用
    misc['实例化卡牌列表'] = {}
    misc['别人实例化卡牌反查表'] = {}
    G.call('通用逻辑_默认流程注册')
    G.call('通用逻辑_角色相关流程注册', estr_absolute_id_type_绝对身份)

    -- 效果信息堆栈建立
    misc.当前效果堆栈 = G.call('create_stack')
end

real_t['卡牌实例化'] = function (o_card_卡片模板, estr_player_相对身份)
    local dbname = G.misc().卡牌实例表
    local card = nil
    if dbname then
        card = G.CopyInst(o_card_卡片模板, {}, G.NewInst(dbname))
    else
        card = G.CopyInst(o_card_卡片模板)
    end

    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份 or '我方')
    G.trig_event('逻辑_卡牌初始化', card, estr_absolute_id_type_绝对身份)
    return card
end

local function get_card_dbname(i_card_卡牌)
    return G.GetTextOwner((i_card_卡牌 >> 16) - 0x7000)
end

real_t['网络通讯_卡牌实例化_信息更新'] = function (i_card_卡牌, _string_attr, _value)
    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    if o_card_卡牌 then
    elseif i_card_卡牌 == 0 then
        local dbname = G.misc().卡牌实例表
        o_card_卡牌 = G.NewInst(dbname)
        i_card_卡牌 = o_card_卡牌.name
    else
        o_card_卡牌 = {['name']=i_card_卡牌,}
        G.DBAdd(o_card_卡牌, get_card_dbname(i_card_卡牌))
    end
    for k,attr in ipairs(_string_attr or {}) do
        local v = _value[k]
        if attr == 'root' then
            o_card_卡牌[attr] = v
            setmetatable(o_card_卡牌, getmetatable(G.QueryName(v)))
        elseif type(attr) == 'string' then
            o_card_卡牌[attr] = v
        elseif type(attr) == 'table' then
            local t = o_card_卡牌
            local count = #attr
            for index,sub_attr in ipairs(attr) do
                if index < count then
                    if type(t[sub_attr]) == 'table' then
                    else
                        t[sub_attr] = {}
                    end
                    t = t[sub_attr]
                else
                    t[sub_attr] = v
                end
            end
        end
    end

    G.trig_event('卡牌实例_信息更新', o_card_卡牌)
    return i_card_卡牌
end

local card_get_value = function (card, _attr)
    if card then
        local _value = {}
        for k,attr in ipairs(_attr or {}) do
            if type(attr) == 'string' then
                _value[k] = card[attr]
            elseif type(attr) == 'table' then
                local t = card
                local v
                for _,sub_attr in ipairs(attr) do
                    if type(t) == 'table' then
                        v = t[sub_attr]
                        t = v
                    else
                        v = nil
                        break
                    end
                end
                _value[k] = v
            end
        end

        return _value
    end
end

real_t['卡牌实例化_信息更新_预处理'] = function (o_card_卡牌, _string_attr)
    local _value = card_get_value(o_card_卡牌, _string_attr)
    if _value then
        G.call('网络通用_广播消息', '网络通讯_卡牌实例化_信息更新', o_card_卡牌.name, _string_attr, _value)
    end
end
-- ============================================
-- ============================================
-- ============================================
-- 卡牌条件相关接口
-- ============================================
-- ============================================
-- ============================================
local cardflag_iter = function (data, flag)
    local flags_data = CARD_FLAGS
    for index, t in ipairs(flags_data) do
        if t[flag] then
            local value = data[index] or 0
            return (value & (1 << t[flag])) > 0
        end
    end
    return false
end

--ret=boolean
real_t['卡牌条件_卡牌阵营判断'] = function(o_card_比对卡牌, o_card_当前卡牌, estr_side_阵营)
    local p1 = (o_card_比对卡牌['动态数据'] or {})['所有者']
    local p2 = (o_card_当前卡牌['动态数据'] or {})['所有者']

    return G.call('房间_身份阵营关系', p1, p2) == estr_side_阵营
end

--ret=boolean
real_t['卡牌条件_卡牌类型判断'] = function(o_card_当前卡牌, _i_cardtype_卡牌类型)
    local i_cardtype_当前卡牌类型 = (o_card_当前卡牌['逻辑数据'] or {})['类型']
    return G.call('array_get_element_index', _i_cardtype_卡牌类型, i_cardtype_当前卡牌类型) ~= nil
end

--ret=boolean
real_t['卡牌条件_卡牌所处位置判断'] = function(o_card_比对卡牌, o_card_当前卡牌, _estr_cardpos_type_所处位置)
    local estr_cardpos_type_当前卡牌所处位置 = (o_card_当前卡牌['动态数据'] or {})['卡牌位置']
    if estr_cardpos_type_当前卡牌所处位置 then
        for _,cardpos in ipairs(_estr_cardpos_type_所处位置) do
            if cardpos == '卡组' then
            elseif cardpos == '相邻' then
                if estr_cardpos_type_当前卡牌所处位置 == '战场' then
                    local player = G.call('房间_获取相对身份', (o_card_当前卡牌['动态数据'] or {})['所有者'])
                    local cur_index = G.call('角色_获取随从编号', player, o_card_当前卡牌) or -1
                    local comp_index = G.call('角色_获取随从编号', player, o_card_比对卡牌) or -1

                    -- 战场上相邻
                    if math.abs(comp_index - cur_index) == 1 then
                        return true
                    end
                end
            elseif cardpos == '对面' then
            elseif estr_cardpos_type_当前卡牌所处位置 == cardpos then
                return true
            end
        end
    end
    return false
end

--ret=boolean
real_t['卡牌条件_卡牌种族判断'] = function(o_card_当前卡牌, _i_race_种族)
    local i_race_当前卡牌种族 = (o_card_当前卡牌['逻辑数据'] or {})['种族']
    return G.call('array_get_element_index', _i_race_种族, i_race_当前卡牌种族) ~= nil
end

--ret=boolean
real_t['卡牌条件_卡牌特性判断'] = function(o_card_当前卡牌, _string_满足特性, _string_排除特性)
    local data = (o_card_当前卡牌['逻辑数据'] or {})['卡牌特性'] or {}

    for _,flag in ipairs(_string_满足特性 or {}) do
        if cardflag_iter(data, flag) then
        else
            return false
        end
    end

    for _,flag in ipairs(_string_排除特性 or {}) do
        if cardflag_iter(data, flag) then
            return false
        end
    end

    return true
end

--ret=boolean
real_t['卡牌条件_控制特定卡牌'] = function(estr_player_相对身份, o_card_原始卡牌)
    local MinionList = G.call('角色_获取随从列表', estr_player_相对身份)

    local root_id = o_card_原始卡牌.root
    for _, Target in ipairs(MinionList) do
        if Target.root == root_id then
            return true
        end
    end
    return false
end

--ret=boolean
real_t['卡牌条件_目标属性比较'] = function(o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, estr_comptype_比较方式, int_value)
    local cur_value = G.call('卡牌属性_获取', o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型)

    local comp_mapping = {
        ['>']  = 'tLua_GT',
        ['<']  = 'tLua_LT',
        ['=='] = 'tLua_EQUAL',
        ['>='] = 'tLua_GE',
        ['<='] = 'tLua_LE',
        ['~='] = 'tLua_NE',
    }

    return G.call(comp_mapping[estr_comptype_比较方式], cur_value, int_value)
end

--ret=boolean
real_t['卡牌条件_目标满血'] = function(o_card_当前卡牌)
    local cur_hp = G.call('卡牌属性_获取', o_card_当前卡牌, '生命', '当前值') or 0
    local max_hp = G.call('卡牌属性_获取', o_card_当前卡牌, '生命', '最大值') or 0
    return cur_hp == max_hp
end

--ret=boolean
real_t['卡牌条件_目标通用过滤器'] = function(estr_side_阵营, _i_cardtype_卡牌类型, _estr_cardpos_type_所处位置, _i_race_种族, _string_满足特性, _string_排除特性, boolean_排除自身)
end

-- ============================================
-- ============================================
-- ============================================
-- 卡牌数据相关接口
-- ============================================
-- ============================================
-- ============================================

real_t['卡牌数据_制作过滤器'] = function (farg_目标过滤器, Caster)
    local func_filer
    if farg_目标过滤器[1] == 'fargboolean_and' then
        local filerlist = {}
        for k,farg in ipairs(farg_目标过滤器[2] or {}) do
            filerlist[k] = G.call('卡牌数据_制作过滤器', farg, Caster)
        end
        func_filer = function (tar)
            for _,iter in ipairs(filerlist) do
                if iter(tar) then
                else
                    return false
                end
            end
            return true
        end
    elseif farg_目标过滤器[1] == 'fargboolean_or' then
        local filerlist = {}
        for k,farg in ipairs(farg_目标过滤器[2] or {}) do
            filerlist[k] = G.call('卡牌数据_制作过滤器', farg, Caster)
        end
        func_filer = function (tar)
            for _,iter in ipairs(filerlist) do
                if iter(tar) then
                    return true
                end
            end
            return false
        end
    elseif farg_目标过滤器[1] == 'fargboolean_not' then
        local iter = G.call('卡牌数据_制作过滤器', farg_目标过滤器[2], Caster)
        func_filer = function (tar)
            return not iter(tar)
        end
    elseif farg_目标过滤器[1] == '卡牌条件_目标通用过滤器' then
        local estr_side_阵营 = farg_目标过滤器[2]
        local _i_cardtype_卡牌类型 = farg_目标过滤器[3]
        local _estr_cardpos_type_所处位置 = farg_目标过滤器[4]
        local _i_race_种族 = farg_目标过滤器[5]
        local _string_满足特性 = farg_目标过滤器[6]
        local _string_排除特性 = farg_目标过滤器[7]
        local boolean_排除自身 = farg_目标过滤器[8]
        func_filer = function (tar)
            if estr_side_阵营 then
                if G.call('卡牌条件_卡牌阵营判断', Caster, tar, estr_side_阵营) then
                else
                    return false
                end
            end
            if _i_cardtype_卡牌类型 then
                if G.call('卡牌条件_卡牌类型判断', tar, _i_cardtype_卡牌类型) then
                else
                    return false
                end
            end
            if _estr_cardpos_type_所处位置 then
                if G.call('卡牌条件_卡牌所处位置判断', Caster, tar, _estr_cardpos_type_所处位置) then
                else
                    return false
                end
            end
            if _i_race_种族 then
                if G.call('卡牌条件_卡牌种族判断', tar, _i_race_种族) then
                else
                    return false
                end
            end
            if _string_满足特性 or _string_排除特性 then
                if G.call('卡牌条件_卡牌特性判断', tar, _string_满足特性, _string_排除特性) then
                else
                    return false
                end
            end
            if boolean_排除自身 then
                if tar ~= Caster then
                else
                    return false
                end
            end
            return true
        end
    else
        -- 需要约定，farg的第二个参数添目标
        if (farg_目标过滤器[2] == nil) or (type(farg_目标过滤器[2]) == 'table') then
            func_filer = function (tar)
                farg_目标过滤器[2] = tar
                return G.call(farg_目标过滤器)
            end
        end
    end

    return func_filer
end

real_t['卡牌数据_获取过滤后数量'] = function (o_skill, Caster)
    local func_filer = G.call('卡牌数据_制作过滤器', o_skill['目标筛选'], Caster)
    local all_cards = G.misc()['实例化卡牌列表']

    return #G.call('array_filter', all_cards, func_filer)
end

real_t['卡牌数据_获取目标数量'] = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return 0
    end

    return #(o_skill_info_效果信息['Target'] or {})
end

-- ============================================
-- ============================================
-- ============================================
-- 卡牌属性相关接口
-- ============================================
-- ============================================
-- ============================================
real_t['卡牌属性_获取'] = function (o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型)
    if not o_card_当前卡牌 then
        return 
    end

    local dyn_data = nil
    local tattr = nil
    local result = nil

    local value_iter = function (v)
        return v
    end

    if estr_cardattr_type_属性类型 == '当前值' then
        dyn_data = o_card_当前卡牌['动态数据'] or {}
        tattr = dyn_data['当前属性'] or {}
        return value_iter(tattr[estr_cardattr_enum_属性名]) or 
               G.call('卡牌属性_获取', o_card_当前卡牌, estr_cardattr_enum_属性名, '最大值')
    elseif estr_cardattr_type_属性类型 == '最大值' then
        local buff_v = G.call('卡牌属性_获取', o_card_当前卡牌, estr_cardattr_enum_属性名, '浮动值')
        local weap_v = G.call('卡牌属性_获取', o_card_当前卡牌, estr_cardattr_enum_属性名, '武器值')
        local area_v = G.call('卡牌属性_获取', o_card_当前卡牌, estr_cardattr_enum_属性名, '光环值')
        local orig_v = G.call('卡牌属性_获取', o_card_当前卡牌, estr_cardattr_enum_属性名, '原始值')
        if buff_v or weap_v or area_v then
            return value_iter((buff_v or 0) + (weap_v or 0) + (area_v or 0) + (orig_v or 0))
        else
            -- 都没有赋值，那就是原始值
            return orig_v
        end
    elseif estr_cardattr_type_属性类型 == '浮动值' then
        dyn_data = o_card_当前卡牌['动态数据'] or {}
        tattr = dyn_data['浮动属性'] or {}
        return value_iter(tattr[estr_cardattr_enum_属性名])
    elseif estr_cardattr_type_属性类型 == '武器值' then
        dyn_data = o_card_当前卡牌['动态数据'] or {}
        tattr = dyn_data['武器属性'] or {}
        return value_iter(tattr[estr_cardattr_enum_属性名])
    elseif estr_cardattr_type_属性类型 == '光环值' then
        dyn_data = o_card_当前卡牌['动态数据'] or {}
        tattr = dyn_data['光环属性'] or {}
        return value_iter(tattr[estr_cardattr_enum_属性名])
    elseif estr_cardattr_type_属性类型 == '原始值' then
        tattr = o_card_当前卡牌['卡牌属性'] or {}
        return value_iter(tattr[estr_cardattr_enum_属性名])
    end

    return result
end

t['卡牌属性_设置'] = function (o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, int_value)
    if not o_card_当前卡牌 then
        return 
    end

    local dyn_data = nil
    local tattr = nil

    local value_iter = function (v)
        return v
    end

    -- todo，网络通讯

    if estr_cardattr_type_属性类型 == '当前值' then
        dyn_data = o_card_当前卡牌['动态数据']
        tattr = dyn_data['当前属性']
        
        local cur_value = value_iter(int_value)
        local old_value = tattr[estr_cardattr_enum_属性名]
        tattr[estr_cardattr_enum_属性名] = cur_value

        G.trig_event('逻辑_卡牌属性改变', o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, old_value)
    elseif estr_cardattr_type_属性类型 == '最大值' then
        -- 最大值不能直接设置
    elseif estr_cardattr_type_属性类型 == '浮动值' then
        dyn_data = o_card_当前卡牌['动态数据']
        tattr = dyn_data['浮动属性']

        local cur_value = value_iter(int_value)
        local old_value = tattr[estr_cardattr_enum_属性名]
        tattr[estr_cardattr_enum_属性名] = cur_value

        G.trig_event('逻辑_卡牌属性改变', o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, old_value)
    elseif estr_cardattr_type_属性类型 == '武器值' then
        dyn_data = o_card_当前卡牌['动态数据']
        tattr = dyn_data['武器属性']

        local cur_value = value_iter(int_value)
        local old_value = tattr[estr_cardattr_enum_属性名]
        tattr[estr_cardattr_enum_属性名] = cur_value

        G.trig_event('逻辑_卡牌属性改变', o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, old_value)
    elseif estr_cardattr_type_属性类型 == '光环值' then
        dyn_data = o_card_当前卡牌['动态数据']
        tattr = dyn_data['光环属性']

        local cur_value = value_iter(int_value)
        local old_value = tattr[estr_cardattr_enum_属性名]
        tattr[estr_cardattr_enum_属性名] = cur_value

        G.trig_event('逻辑_卡牌属性改变', o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, old_value)
    elseif estr_cardattr_type_属性类型 == '原始值' then
        tattr = o_card_当前卡牌['卡牌属性']

        local cur_value = value_iter(int_value)
        local old_value = tattr[estr_cardattr_enum_属性名]
        tattr[estr_cardattr_enum_属性名] = cur_value

        G.trig_event('逻辑_卡牌属性改变', o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, old_value)
    end
end

-- ============================================
-- ============================================
-- ============================================
-- 玩家属性相关接口
-- ============================================
-- ============================================
-- ============================================

t['角色属性_水晶_设置'] = function(estr_player_相对身份, estr_mana_type_修改类型, int_value)
    G.call('角色_设置水晶数据', estr_player_相对身份, estr_mana_type_修改类型, int_value)
end

-- ============================================
-- ============================================
-- ============================================
-- 网络交互接口
-- ============================================
-- ============================================
-- ============================================
local cardplay_net_communication_count = 0
local create_net_name = function ()
    local count = cardplay_net_communication_count + 1
    cardplay_net_communication_count = count

    local estr_absolute_id_type_本地玩家绝对身份 = G.call('房间_获取绝对身份', '我方')

    return '|#cp_net#|#' .. estr_absolute_id_type_本地玩家绝对身份 .. '#|' .. count
end

real_t['网络通讯_返回信息'] = function (estr_absolute_id_type_目标身份, estr_absolute_id_type_发起者身份, farg, name)
    local estr_absolute_id_type_本地玩家身份 = G.call('房间_获取绝对身份', '我方')

    if estr_absolute_id_type_本地玩家身份 == estr_absolute_id_type_目标身份 then
        -- 判断自身是否是合法的接收者
        G.trig_event('网络交互', name, farg)
    end
end

real_t['网络通讯_接收信息'] = function (estr_absolute_id_type_目标身份, estr_absolute_id_type_发起者身份, farg, name)
    local estr_absolute_id_type_本地玩家身份 = G.call('房间_获取绝对身份', '我方')

    if estr_absolute_id_type_本地玩家身份 == estr_absolute_id_type_目标身份 then
        -- 判断自身是否是合法的接收者
        local return_farg = G.call(farg or {})
        G.call('网络通用_广播消息', '网络通讯_返回信息',
                                   estr_absolute_id_type_发起者身份,
                                   estr_absolute_id_type_目标身份,
                                   return_farg,
                                   name)
    end
end

real_t['网络通讯_请求信息'] = function (estr_player_目标身份, farg)
    local estr_absolute_id_type_发起者身份 = G.call('房间_获取绝对身份', '我方')
    local estr_absolute_id_type_目标身份 = G.call('房间_获取绝对身份', estr_player_目标身份)
    
    local name = create_net_name()
    G.start_program('网络通用_广播消息', '网络通讯_接收信息', 
                                        estr_absolute_id_type_目标身份,
                                        estr_absolute_id_type_发起者身份,
                                        farg,
                                        name)

    -- 等待返回
    G.wait1('网络交互', name)
    local _, return_farg = G.event_info()
    return G.call(return_farg or {})
end

real_t['网络通讯_技能效果_获知随机卡牌'] = function (int_数量, estr_cardpos_type_卡牌来源, boolean_是否复制, boolean_是否明牌)
    local all_cards = G.misc()['实例化卡牌列表']
    local TargetList

    if estr_cardpos_type_卡牌来源 == '卡组' then
        -- TODO，卡组的卡需要特殊记录
        return 
    else
        TargetList = G.call('array_filter', all_cards, function (t)
            return G.call('卡牌条件_卡牌所处位置判断', t, {estr_cardpos_type_卡牌来源})
        end)
    end
    
    local rlib = G.call('Create_Randomlib', G.QueryName(0x100c0002))
    for _, card in ipairs(TargetList or {}) do
        rlib:添加数据({card, 100})
    end
    rlib:初始化(false, true)

    local result = rlib(int_数量)
    local list = {}

    local attr_list = {'root', '卡牌属性', '逻辑数据', '动态数据'}
    if boolean_是否复制 then
        for k, card in ipairs(result) do
            if boolean_是否明牌 then
                G.call('卡牌实例化_信息更新_预处理', card, attr_list)
            end
            table.insert(list, {'网络通讯_卡牌实例化_信息更新', 0, attr_list, card_get_value(card, attr_list)})
        end
        return {'farg_array_run', list}
    else
        for k, card in ipairs(result) do
            G.call('卡牌实例化_信息更新_预处理', card, attr_list)
            table.insert(list, card.name)
        end
        return {'return', list}
    end
end

-- ============================================
-- ============================================
-- ============================================
-- 效果树处理
-- ============================================
-- ============================================
-- ============================================

local noti = G.notify
local table_unpack = table.unpack
local call_stack = G.call('create_stack')
local last_call
for funs, iter in pairs(t) do
    real_t[funs] = function (...)
        -- 前置信息收集
        do
            local last_call = call_stack.top()
            local new_call = {
                ['funs'] = funs,
                ['children'] = {},
            }
            if last_call then
                table.insert(last_call['children'], new_call)
            end            
            call_stack.push(new_call)

            local skill_info = get_cur_effect_info()
            if skill_info then
                new_call['skill_info'] = {
                    ['Player'] = skill_info['Player'],
                    ['Caster'] = skill_info['Caster'],
                }

                if funs == 'single_damage' then
                    new_call['skill_info']['Target'] = {skill_info['逐个伤害目标']}
                    new_call['skill_info']['Value'] = {skill_info['逐个伤害数值']}
                elseif funs == 'single_heal' then
                    new_call['skill_info']['Target'] = {skill_info['逐个治疗目标']}
                    new_call['skill_info']['Value'] = {skill_info['逐个治疗数值']}
                elseif funs == '技能效果_效果树_执行子效果' then
                    local skill_info = ({...})[1]
                    new_call['skill_info'] = {
                        ['Player'] = skill_info['Player'],
                        ['Caster'] = skill_info['Caster'],
                        ['Target'] = {table_unpack(skill_info['Target'] or {})},
                    }
                else
                    new_call['skill_info']['Target'] = {table_unpack(skill_info['Target'] or {})}
                end
            end
        end

        -- 前置动画调用
        noti.卡牌动画_前置调用(funs, ...)

        -- 执行功能
        iter(...)

        -- 后置动画调用
        noti.卡牌动画_后置调用(funs, ...)

        -- 后置信息处理
        do
            last_call = call_stack.pop()

            if (funs == '卡牌使用_主流程_thread') or
               (funs == '卡牌攻击_主流程_thread') or
               (funs == '逻辑注册_水晶设置_absolute') or
               (funs == '逻辑注册_抽牌_absolute') or
               (funs == '逻辑注册_攻击次数重置_回合开始_absolute') or
               (funs == '逻辑注册_攻击状态设置_回合结束_absolute') or
               (funs == '逻辑注册_武器功能_回合开始_absolute') or
               (funs == '逻辑注册_武器功能_回合结束_absolute') or
               (funs == '逻辑注册_回合结束_冻结删除判断_absolute')
            then
                noti['卡牌逻辑效果整理'](last_call)
            end
        end

    end
end

real_t['卡牌逻辑树_获取最后记录'] = function ()
    return last_call
end

real_t['卡牌逻辑树_获取最后调用'] = function ()
    return call_stack.top()
end
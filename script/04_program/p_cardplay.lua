--[[400f

]]
local G = require "gf"
local L = {}
local t = G.api

--特殊事件
-- 逻辑_法术牌打出
-- 逻辑_英雄技能使用


t['卡牌使用_主流程'] = function (estr_player_相对身份, o_order_info_当前指令信息)
    local get_attr = CARD_GET_ATTR

    local effect_stack = G.misc().当前效果堆栈 or G.call('create_stack')
    G.misc().当前效果堆栈 = effect_stack

    local root_info = {
        ['Player'] = estr_player_相对身份,
        ['Caster'] = o_order_info_当前指令信息['Caster'],
        ['Target'] = o_order_info_当前指令信息['Target'],
        ['Parent'] = nil,
        ['Stack'] = effect_stack,
    }
    effect_stack.push(root_info)

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
        -- 判断下是否在战场
        if get_attr(Caster, '动态数据', '卡牌位置') == '战场' then
            G.trig_event('逻辑_英雄技能使用', Caster)
        else
            -- 不在战场，那么可能是在手牌使用的
            G.call('卡牌使用_使用')
        end
    elseif cardtype == 0x10090004 then
        -- 随从卡，召唤随从
        -- 可能不对，需要判断下
        local index = o_order_info_当前指令信息['MinionPos']
        G.call('角色_战场_添加随从', estr_player_相对身份, Caster, index)

        --上场，战吼，召唤自身

    elseif cardtype == 0x10090005 then
        -- 法术卡，执行使用逻辑
        G.call('卡牌使用_使用')

    elseif cardtype == 0x10090006 then
        -- 武器卡

    end

    -- 逐个触发相关事件

    -- 执行完毕
    effect_stack.pop()
end

t['卡牌攻击_主流程'] = function (estr_player_相对身份, o_order_info_当前指令信息)
    local get_attr = CARD_GET_ATTR

    local effect_stack = G.misc().当前效果堆栈 or G.call('create_stack')
    G.misc().当前效果堆栈 = effect_stack

    local root_info = {
        ['Player'] = estr_player_相对身份,
        ['Caster'] = o_order_info_当前指令信息['Caster'],
        ['Target'] = o_order_info_当前指令信息['Target'],
        ['Parent'] = nil,
        ['Stack'] = effect_stack,
    }
    effect_stack.push(root_info)

    G.call('卡牌使用_攻击')

    -- 执行完毕
    effect_stack.pop()
end

-- ============================================
-- ============================================
-- ============================================
-- 逻辑基础事件响应
-- ============================================
-- ============================================
-- ============================================

local effect_action_iter = function (skill_info, event, init, action)
    if event then
        -- 功能初始化
        init()
        -- 触发“前”事件，修改数据
        G.trig_event(event .. '前', skill_info)
        -- 执行
        action()
        -- 触发事件，响应改变
        G.trig_event(event, skill_info)
    else
        -- 功能初始化
        init()
        -- 执行
        action()
    end
end

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

t['卡牌使用_消耗法力'] = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local get_attr = CARD_GET_ATTR

    local init = function ()
        local Caster = o_skill_info_效果信息['Caster']
        o_skill_info_效果信息['费用'] = math.max(G.call('卡牌属性_获取', Caster, '费用', '当前值') or 0, 0)
        o_skill_info_效果信息['过载费用'] = math.max(G.call('卡牌属性_获取', Caster, '过载费用', '当前值') or 0, 0)
    end
    local action = function ()
        local 费用 = o_skill_info_效果信息['费用'] or 0
        local 过载费用 = o_skill_info_效果信息['过载费用'] or 0
        local estr_player_相对身份 = o_skill_info_效果信息['Player']

        local 当前值 = G.call('角色_获取水晶数据', estr_player_相对身份, '当前值')
        G.call('角色_设置水晶数据', estr_player_相对身份, '当前值', 当前值 - 费用)
    
        local 下回锁定值 = G.call('角色_获取水晶数据', estr_player_相对身份, '下回锁定值')
        G.call('角色_设置水晶数据', estr_player_相对身份, '下回锁定值', 下回锁定值 + 过载费用)
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_卡牌使用_消耗法力', init, action)
end

t['卡牌使用_生效判断'] = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function ()
        o_skill_info_效果信息['是否使用成功'] = true
    end
    local action = function ()
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_卡牌生效', init, action)
end

t['卡牌使用_上场'] = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function ()
    end
    local action = function ()
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_卡牌上场', init, action)
end

t['卡牌使用_使用'] = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local get_attr = CARD_GET_ATTR

    local init = function ()
    end
    local action = function ()
        local Caster = o_skill_info_效果信息['Caster']
        local cardtype = get_attr(Caster, '逻辑数据', '类型')

        if cardtype == 0x10090003 then
            -- 英雄技能
            G.trig_event('逻辑_英雄技能使用', Caster)
        elseif cardtype == 0x10090004 then
            -- 随从

        elseif cardtype == 0x10090005 then
            -- 法术
            G.trig_event('逻辑_法术牌打出', Caster)
        end

        -- todo，记录
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_卡牌使用', init, action)
end

local single_damage = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function ()
    end
    local action = function ()
        local int_伤害值 = o_skill_info_效果信息['逐个伤害数值']
        local Target = o_skill_info_效果信息['逐个伤害目标']

        local _int_伤害数值 = o_skill_info_效果信息['伤害数值']
        local TargetList = o_skill_info_效果信息['最终伤害目标']

        local index = #_int_伤害数值 + 1

        -- 伤害值记录下来
        _int_伤害数值[index] = int_伤害值
        TargetList[index] = Target

        -- 造成伤害
        if int_伤害值 then
            G.call('card_造成伤害', Target, int_伤害值)
        end
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_直接伤害', init, action)
end

local single_heal = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function ()
    end
    local action = function ()
        local int_治疗值 = o_skill_info_效果信息['逐个治疗数值']
        local Target = o_skill_info_效果信息['逐个治疗目标']

        local _int_治疗数值 = o_skill_info_效果信息['治疗数值']
        local TargetList = o_skill_info_效果信息['最终治疗目标']

        local index = #_int_治疗数值 + 1

        -- 治疗值记录下来
        _int_治疗数值[index] = int_治疗值
        TargetList[index] = Target

        -- 造成治疗
        if int_治疗值 then
            G.call('card_造成治疗', Target, int_治疗值)
        end
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_直接治疗', init, action)
end

local single_add_buff = function ()
    local effect_stack = G.misc().当前效果堆栈 
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function ()
    end
    local action = function ()
        local o_skill_buffID = o_skill_info_效果信息['当前添加buff']
        local Target = o_skill_info_效果信息['Target'][1]
        G.trig_event('逻辑_技能添加前', Target, o_skill_buffID)
        G.trig_event('逻辑_技能添加', Target, o_skill_buffID)
    end

    local buff_info = {
        ['Player'] = o_skill_info_效果信息['Player'],
        ['Caster'] = o_skill_info_效果信息['Caster'],
        ['Target'] = {o_skill_info_效果信息['逐个伤害目标']},
        ['Stack'] = effect_stack,
    }
    G.call('技能效果_效果树_执行子效果', buff_info,
            function ()
                effect_action_iter(o_skill_info_效果信息, '逻辑_Buff生效', init, action)
            end
          )
end

t['技能效果_攻击流程'] = function ()
    local effect_stack = G.misc().当前效果堆栈 
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function ()
        local o_skill_info_效果信息 = get_cur_effect_info()
        local Caster = o_skill_info_效果信息['Caster']
        o_skill_info_效果信息['原始伤害数值'] = G.call('卡牌属性_获取', Caster, '攻击', '当前值') or 0
        o_skill_info_效果信息['伤害类型'] = '攻击'
    end
    local action = function ()
        local o_skill_info_效果信息 = get_cur_effect_info()
        local int_中间伤害值 = o_skill_info_效果信息['中间伤害数值'] or o_skill_info_效果信息['原始伤害数值']
        local TargetList = o_skill_info_效果信息['Target'] or {}
        local _int_伤害数值 = {}

        o_skill_info_效果信息['最终伤害目标'] = {}
        o_skill_info_效果信息['伤害数值'] = _int_伤害数值

        for k,Target in ipairs(TargetList) do
            o_skill_info_效果信息['逐个伤害数值'] = int_中间伤害值
            o_skill_info_效果信息['逐个伤害目标'] = Target
            single_damage()
        end
    end

    -- 攻击者流程
    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_攻击伤害', init, action)
    -- 反击者流程
    local beatback_info = {
        ['Player'] = o_skill_info_效果信息['Player'],
        ['Caster'] = o_skill_info_效果信息['Target'][1],
        ['Target'] = {o_skill_info_效果信息['Caster']},
        ['Stack'] = effect_stack, 
    }
    G.call('技能效果_效果树_执行子效果', 
            beatback_info, 
            function ()
                effect_action_iter(beatback_info, '逻辑_技能效果_反击伤害', init, action)
            end
          )
end

t['技能效果_英雄技能伤害'] = function (int_伤害值)


end

t['技能效果_效果树_执行子效果'] = function (skill_info, action)
    -- 效果挂钩，入栈
    local effect_stack = skill_info['Stack']
    local o_skill_info_效果信息 = effect_stack.top()
    effect_stack.push(skill_info)
    skill_info['Parent'] = o_skill_info_效果信息

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

local trigger_iter = function (estr_cardevent_inittype_类型, card, skill)
    local iter = function (skill, trigger)
        local 是否重复触发 = trigger['是否重复触发']
        local 触发时机 = (trigger['触发时机'] or {})['lua']
        local 触发条件 = (trigger['触发条件'] or {})['lua']
        local 触发逻辑 = (trigger['触发逻辑'] or {})['lua']
        local 优先级 = trigger['优先级'] or 0
        local 分组 = trigger['分组']

        local earg = nil
        local condi = nil
        if type(触发时机) == 'function' then
            earg = 触发时机(skill, get_cur_effect_info(), card)
        end
        if earg and type(触发条件) == 'function' then
            condi = function ()
                return 触发条件(skill, get_cur_effect_info(), card)
            end
        end
        if earg and type(触发逻辑) == 'function' then
            local event_name = earg[1]
            local key = create_trigger_name(event_name)
            if 是否重复触发 then
                t[key] = function ()
                    return 触发逻辑(skill, get_cur_effect_info(), card)
                end
            else
                t[key] = function ()
                    G.removeListener(key, event_name)
                    t[key] = nil
                    card['动态数据']['当前注册事件'][key] = nil
                    return 触发逻辑(skill, get_cur_effect_info(), card)
                end
            end
            G.addListener(key, earg, condi, 优先级, 分组)

            -- 绑定到卡牌信息上
            local card_trglist = card['动态数据']['当前注册事件']
            card_trglist[key] = event_name
        end
    end

    local for_skill_list = function (skill_list)
        for _,s in ipairs(skill_list or {}) do
            local skill = G.QueryName(s)
            if skill and skill['逻辑功能'] then
                for _,trigger in ipairs(skill['逻辑功能']) do
                    if trigger['注册时机'] == estr_cardevent_inittype_类型 then
                        iter(skill, trigger)
                    end
                end
            end
        end
    end

    local get_attr = CARD_GET_ATTR
    if skill then
        for_skill_list({skill})
    else
        local 卡牌效果 = get_attr(card, '逻辑数据', '卡牌效果')
        for_skill_list(卡牌效果)
    end
end

t['逻辑注册_初始化'] = function ()
    local card = G.event_info()
    card['动态数据'] = {
        ['当前注册事件'] = {},
        ['浮动属性'] = {},
        ['光环属性'] = {},
        ['当前属性'] = {},
        ['卡牌位置'] = '牌库',
    }
    trigger_iter('初始', card)
end

t['逻辑注册_上场'] = function ()
    local card = G.event_info()
    trigger_iter('上场', card)
end

t['逻辑注册_上手'] = function ()
    local card = G.event_info()
    trigger_iter('上手', card)
end

t['逻辑注册_生效'] = function ()
    local info = G.event_info()
    local card = info['Caster']

    -- 判断是否能够生效
    trigger_iter('生效', card)
end

t['逻辑注册_添加'] = function ()
    local card, skill = G.event_info()

    -- 判断是否能够生效
    trigger_iter('添加', card, skill.name)
end

t['逻辑反注册_沉默'] = function ()
    -- 沉默或者移除时传card
    local card = G.event_info()

    local card_trglist = card['动态数据']['当前注册事件']
    for key,event_name in pairs(card_trglist or {}) do
        G.removeListener(key, event_name)
        t[key] = nil
    end
    card['动态数据']['当前注册事件'] = {}
    card['卡牌效果'] = {}

    -- 其他修改
end

t['通用逻辑_默认流程注册'] = function ()
    local cond = nil
    local prior_base = EVENT_PRIOR.base
    local group_system = EVENT_GROUP.system
    
    -- trigger注册
    G.addListener('逻辑注册_初始化', {'逻辑_卡牌初始化'}, cond, EVENT_PRIOR.first, group_system)
    G.addListener('逻辑注册_上场', {'逻辑_卡牌上场前'}, cond, prior_base, group_system)
    G.addListener('逻辑注册_上手', {'逻辑_卡牌上手前'}, cond, prior_base, group_system)
    G.addListener('逻辑注册_生效', {'逻辑_卡牌生效'}, cond, prior_base, group_system)
    G.addListener('逻辑注册_添加', {'逻辑_技能添加前'}, cond, EVENT_PRIOR.first, group_system)

    -- 沉默
    G.addListener('逻辑反注册_沉默', {''}, cond, prior_base, group_system)

end


-- ============================================
-- ============================================
-- ============================================
-- 常用事件接口
-- ============================================
-- ============================================
-- ============================================

t['卡牌使用_攻击'] = function ()
    local effect_stack = G.misc().当前效果堆栈 
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function ()
    end
    local action = function ()
        local Caster = o_skill_info_效果信息['Caster']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _,Target in ipairs(TargetList) do
            G.call('技能效果_效果树_执行子效果', 
                    {
                        ['Player'] = o_skill_info_效果信息['Player'],
                        ['Caster'] = o_skill_info_效果信息['Caster'],
                        ['Target'] = {Target},
                        ['Stack'] = effect_stack,
                    }, 
                    function ()
                        G.call('技能效果_攻击流程')
                    end
                  )
        end
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_卡牌攻击', init, action)
end

t['技能效果_法伤伤害'] = function (int_伤害值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function ()
        o_skill_info_效果信息['原始伤害数值'] = int_伤害值
        o_skill_info_效果信息['伤害类型'] = '法术'
    end
    local action = function ()
        local int_中间伤害值 = o_skill_info_效果信息['中间伤害数值'] or o_skill_info_效果信息['原始伤害数值']
        local TargetList = o_skill_info_效果信息['Target'] or {}
        local _int_伤害数值 = {}

        o_skill_info_效果信息['最终伤害目标'] = {}
        o_skill_info_效果信息['伤害数值'] = _int_伤害数值

        for k,Target in ipairs(TargetList) do
            o_skill_info_效果信息['逐个伤害数值'] = int_中间伤害值
            o_skill_info_效果信息['逐个伤害目标'] = Target
            single_damage()
        end
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_法伤伤害', init, action)
end

t['技能效果_法术治疗'] = function (int_治疗值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function ()
        o_skill_info_效果信息['原始治疗数值'] = int_治疗值
        o_skill_info_效果信息['治疗类型'] = '法术'
    end
    local action = function ()
        local int_中间治疗值 = o_skill_info_效果信息['中间治疗数值'] or o_skill_info_效果信息['原始治疗数值']
        local TargetList = o_skill_info_效果信息['Target'] or {}
        local _int_治疗数值 = {}

        o_skill_info_效果信息['最终治疗目标'] = {}
        o_skill_info_效果信息['治疗数值'] = _int_治疗数值

        for k,Target in ipairs(TargetList) do
            o_skill_info_效果信息['逐个治疗数值'] = int_中间治疗值
            o_skill_info_效果信息['逐个治疗目标'] = Target
            single_heal()
        end
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_法术治疗', init, action)
end

t['技能效果_本回合当前水晶'] = function (int_变动值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local estr_player_相对身份 = o_skill_info_效果信息['Player']

    if estr_player_相对身份 and int_变动值 then
        local init = function (v)
            return function ()
                o_skill_info_效果信息['当前水晶变化'] = v
            end
        end
        local action = function ()
            estr_player_相对身份 = o_skill_info_效果信息['Player']
            int_变动值 = o_skill_info_效果信息['当前水晶变化']
            local cur_value = G.call('角色_获取水晶数据', estr_player_相对身份, '当前值') or 0
            G.call('角色_设置水晶数据', estr_player_相对身份, '当前值', cur_value + int_变动值)
        end

        effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_当前水晶变化', init(int_变动值), action)
        G.call('tLua_add_listener', 
                {"对决事件_回合结束"},
                function ()
                    effect_action_iter(o_skill_info_效果信息, nil, init(-int_变动值), action)
                end,
                nil,
                EVENT_PRIOR.last,
                nil
              )
    end
end

t['技能效果_最大水晶'] = function (int_变动值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local estr_player_相对身份 = o_skill_info_效果信息['Player']

    if estr_player_相对身份 and int_变动值 then
        local init = function ()
            o_skill_info_效果信息['最大水晶变化'] = int_变动值
        end
        local action = function ()
            estr_player_相对身份 = o_skill_info_效果信息['Player']
            int_变动值 = o_skill_info_效果信息['最大水晶变化']
            local cur_value = G.call('角色_获取水晶数据', estr_player_相对身份, '最大值') or 0
            G.call('角色_设置水晶数据', estr_player_相对身份, '最大值', cur_value + int_变动值)
        end
        effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_最大水晶变化', init, action)
    end
end

t['技能效果_当前水晶'] = function (int_变动值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local estr_player_相对身份 = o_skill_info_效果信息['Player']

    if estr_player_相对身份 and int_变动值 then
        local init = function ()
            o_skill_info_效果信息['当前水晶变化'] = int_变动值
        end
        local action = function ()
            estr_player_相对身份 = o_skill_info_效果信息['Player']
            int_变动值 = o_skill_info_效果信息['当前水晶变化']
            local cur_value = G.call('角色_获取水晶数据', estr_player_相对身份, '当前值') or 0
            G.call('角色_设置水晶数据', estr_player_相对身份, '当前值', cur_value + int_变动值)
        end
        effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_当前水晶变化', init, action)
    end
end

t['技能效果_本回合攻击'] = function (int_变动值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function (v)
        return function ()
            o_skill_info_效果信息['当前攻击变化'] = v
        end
    end
    local action = function ()
        int_变动值 = o_skill_info_效果信息['当前攻击变化']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local cur_value = G.call('卡牌属性_获取', Target, '攻击', '浮动值') or 0
            G.call('卡牌属性_设置', Target, '攻击', '浮动值', cur_value + int_变动值)

            local tar = Target
            local val = int_变动值
            G.call('tLua_add_multlisteners', 
                    {
                        {
                            {"对决事件_回合结束"},
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

    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_当前攻击变化', init(int_变动值), action)
end

t['技能效果_护甲'] = function (int_变动值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    if int_变动值 <= 0 then
        return
    end

    local init = function ()
        o_skill_info_效果信息['当前护甲变化'] = int_变动值
    end
    local action = function ()
        int_变动值 = o_skill_info_效果信息['当前护甲变化']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local cur_value = G.call('卡牌属性_获取', Target, '护甲', '当前值') or 0
            G.call('卡牌属性_设置', Target, '护甲', '当前值', cur_value + int_变动值)
        end
    end

    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_当前护甲变化', init, action)
end

t['技能效果_生命上限'] = function (int_变动值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    if int_变动值 <= 0 then
        return
    end

    local init = function ()
        o_skill_info_效果信息['当前生命变化'] = int_变动值
    end
    local action = function ()
        int_变动值 = o_skill_info_效果信息['当前生命变化']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local buff_value = G.call('卡牌属性_获取', Target, '生命', '浮动值') or 0
            local cur_value = G.call('卡牌属性_获取', Target, '生命', '当前值') or 0
            G.call('卡牌属性_设置', Target, '生命', '浮动值', buff_value + int_变动值)
            G.call('卡牌属性_设置', Target, '生命', '当前值', cur_value + int_变动值)
        end
    end

    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_当前生命变化', init, action)
end

t['技能效果_攻击'] = function (int_变动值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    if int_变动值 <= 0 then
        return
    end

    local init = function ()
        o_skill_info_效果信息['当前攻击变化'] = int_变动值
    end
    local action = function ()
        int_变动值 = o_skill_info_效果信息['当前攻击变化']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local cur_value = G.call('卡牌属性_获取', Target, '攻击', '浮动值') or 0
            G.call('卡牌属性_设置', Target, '攻击', '浮动值', cur_value + int_变动值)
        end
    end

    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_当前攻击变化', init, action)
end

t['技能效果_特性'] = function (_string_添加特性, _string_移除特性)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local get_attr = CARD_GET_ATTR
    local flags_data = CARD_FLAGS
    local cardflag_set = function (data, flag)
        for index, t in ipairs(flags_data) do
            if t[flag] then
                data[index] = (data[index] or 0) | (1 << t[flag])
            end
        end
    end
    local cardflag_del = function (data, flag)
        for index, t in ipairs(flags_data) do
            if t[flag] then
                data[index] = (data[index] or 0) & (~(1 << t[flag]))
            end
        end
    end

    local init = function ()
        o_skill_info_效果信息['当前添加特性'] = _string_添加特性
        o_skill_info_效果信息['当前移除特性'] = _string_移除特性
    end
    local action = function ()
        _string_添加特性 = o_skill_info_效果信息['当前添加特性']
        _string_移除特性 = o_skill_info_效果信息['当前移除特性']
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local flags = get_attr(Target, '逻辑数据', '卡牌特性') or {}
            for k,v in ipairs(_string_添加特性 or {}) do
                cardflag_set(flags, v)
            end
            for k,v in ipairs(_string_移除特性 or {}) do
                cardflag_del(flags, v)
            end

            if Target['逻辑数据'] then
                Target['逻辑数据']['卡牌特性'] = flags
            else
                Target['逻辑数据'] = {
                    ['卡牌特性'] = flags
                }
            end
            -- todo，临时处理，后续由动画控制
            G.trig_event('卡牌实例_信息更新', Target.name)
        end
    end

    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_当前特性变化', init, action)
end

t['技能效果_添加BUFF'] = function (i_skill_buffID)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local o_skill_buffID = G.QueryName(i_skill_buffID)
    if o_skill_buffID then
    else
        return
    end

    local init = function ()
        o_skill_info_效果信息['当前添加buff'] = o_skill_buffID
    end
    local action = function ()
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            o_skill_info_效果信息['逐个伤害目标'] = Target
            single_add_buff()
        end
    end

    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_添加Buff', init, action)
end

t['技能效果_抽牌'] = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local estr_player_相对身份 = o_skill_info_效果信息['Player']

    if estr_player_相对身份 then
        local init = function ()
        end
        local action = function ()
            estr_player_相对身份 = o_skill_info_效果信息['Player']

            -- TODO，缺少处理，默认自己抽自己
            G.call('角色_抽取随机卡牌', estr_player_相对身份, estr_player_相对身份)
        end
        effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_牌库抽牌', init, action)
    end
end

t['技能效果_创建手牌'] = function (i_card_创建卡牌ID, boolean_是否明牌)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local estr_player_相对身份 = o_skill_info_效果信息['Player']

    if estr_player_相对身份 then
        local init = function ()
        end
        local action = function ()
            estr_player_相对身份 = o_skill_info_效果信息['Player']

            -- TODO，缺少处理
            G.call('角色_添加手牌', estr_player_相对身份, G.call('卡牌实例化', G.QueryName(i_card_创建卡牌ID)), boolean_是否明牌)
        end
        effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_创建手牌', init, action)
    end
end

t['技能效果_设置生命上限'] = function (int_变动值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    if int_变动值 <= 0 then
        return
    end

    local init = function ()
    end
    local action = function ()
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local orig_v = G.call('卡牌属性_获取', Target, '生命', '原始值') or 0
            G.call('卡牌属性_设置', Target, '生命', '浮动值', int_变动值 - orig_v)
            G.call('卡牌属性_设置', Target, '生命', '当前值', G.call('卡牌属性_获取', Target, '生命', '最大值'))
        
            G.trig_event('逻辑_卡牌属性设置', Target, '生命')
        end
    end

    effect_action_iter(o_skill_info_效果信息, '', init, action)
end

t['技能效果_设置攻击力'] = function (int_变动值)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    if int_变动值 <= 0 then
        return
    end

    local init = function ()
    end
    local action = function ()
        local TargetList = o_skill_info_效果信息['Target'] or {}

        for _, Target in ipairs(TargetList) do
            local orig_v = G.call('卡牌属性_获取', Target, '攻击', '原始值') or 0
            G.call('卡牌属性_设置', Target, '攻击', '浮动值', int_变动值 - orig_v)
        
            G.trig_event('逻辑_卡牌属性设置', Target, '攻击')
        end
    end

    effect_action_iter(o_skill_info_效果信息, '', init, action)
end

t['技能效果_创建光环'] = function (o_skill, func_add, func_del, _earg_光环添加事件, _earg_光环删除事件)
    local effect_stack = G.misc().当前效果堆栈 
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local 过滤数据 = o_skill['目标筛选']
    local all_cards = {}
    local TargetList = G.call('array_filter', all_cards, function (v) end)
    G.call('技能效果_效果树_执行子效果',
            {
                ['Player'] = o_skill_info_效果信息['Player'],
                ['Caster'] = o_skill_info_效果信息['Caster'],
                ['Target'] = TargetList,
                ['Stack'] = effect_stack,
            }, 
            func_add
        )

    local infolist = {}
    local add_buff_iter = function ()
        local Target = G.event_info()
        if G.call('array_get_element_index', TargetList, Target) then
        elseif true then
            table.insert(TargetList, Target)
            G.call('技能效果_效果树_执行子效果',
                    {
                        ['Player'] = o_skill_info_效果信息['Player'],
                        ['Caster'] = o_skill_info_效果信息['Caster'],
                        ['Target'] = {Target},
                        ['Stack'] = effect_stack,
                    }, 
                    func_add
                )
        end
        G.call('tLua_add_multlisteners', infolist)
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
                        ['Stack'] = effect_stack,
                    }, 
                    func_del
                )
        end
        G.call('tLua_add_multlisteners', infolist)
    end

    for _,earg in ipairs(_earg_光环添加事件) do
        local info = {
            [1] = earg,
            [2] = add_buff_iter,
        }
        table.insert(infolist, info)
    end
    for _,earg in ipairs(_earg_光环删除事件) do
        local info = {
            [1] = earg,
            [2] = del_buff_iter,
        }
        table.insert(infolist, info)
    end
    table.insert(infolist,
                {
                    [1] = {'逻辑_卡牌死亡', o_skill_info_效果信息['Caster']}
                },
                function ()
                    G.call('技能效果_效果树_执行子效果',
                            {
                                ['Player'] = o_skill_info_效果信息['Player'],
                                ['Caster'] = o_skill_info_效果信息['Caster'],
                                ['Target'] = TargetList,
                                ['Stack'] = effect_stack,
                            }, 
                            func_del
                        )
                end
            )

    G.call('tLua_add_multlisteners', infolist)
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
    table.insert(TargetList, G.call('角色_战场_获取英雄_绝对身份', estr_absolute_id_type_绝对身份))
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

t['技能目标_剔除目标'] = function (o_card_delTargetList)
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local TargetList = o_skill_info_效果信息['Target'] or {}

    if type(o_card_delTargetList) == 'table' then
        for i = #TargetList, 1, -1 do
            local Target = TargetList[i]
            for _,v in ipairs(o_card_delTargetList) do
                if v.name == Target.name then
                    table.remove(TargetList, i)
                    break
                end
            end
        end
    end

    o_skill_info_效果信息['Target'] = TargetList
end

-- ============================================
-- ============================================
-- ============================================
-- 卡牌生成相关接口，只有本地玩家才能调用
-- ============================================
-- ============================================
-- ============================================
t['卡牌实例表_初始化'] = function ()
    G.newinst_cache['o_card_redplayer1'] = {}
    G.newinst_cache['o_card_redplayer2'] = {}
    G.newinst_cache['o_card_blueplayer1'] = {}
    G.newinst_cache['o_card_blueplayer2'] = {}

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
        G.misc().卡牌实例表 = dbname
    end
    
    -- 机制启用
    G.call('通用逻辑_默认流程注册')
end

t['卡牌实例化'] = function (o_card_卡片模板)
    local dbname = G.misc().卡牌实例表
    local card = nil
    if dbname then
        card = G.CopyInst(o_card_卡片模板, {}, G.NewInst(dbname))
    else
        card = G.CopyInst(o_card_卡片模板)
    end

    G.trig_event('逻辑_卡牌初始化', card)
    return card
end

local function get_card_dbname(i_card_卡牌)
    return G.GetTextOwner((i_card_卡牌 >> 16) - 0x7000)
end

t['卡牌实例化_信息更新'] = function (i_card_卡牌, _string_attr, _value)
    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    if o_card_卡牌 then
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

    G.trig_event('卡牌实例_信息更新', i_card_卡牌)
end

t['卡牌实例化_信息更新_预处理'] = function (o_card_卡牌, _string_attr)
    if o_card_卡牌 then
        local _value = {}
        for k,attr in ipairs(_string_attr or {}) do
            if type(attr) == 'string' then
                _value[k] = o_card_卡牌[attr]
            elseif type(attr) == 'table' then
                local t = o_card_卡牌
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

        G.call('网络通用_广播消息', '卡牌实例化_信息更新', o_card_卡牌.name, _string_attr, _value)
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

t['卡牌条件_卡牌特性判断'] = function (o_card_当前卡牌, _string_满足特性, _string_排除特性)
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

-- ============================================
-- ============================================
-- ============================================
-- 卡牌属性相关接口
-- ============================================
-- ============================================
-- ============================================
t['卡牌属性_获取'] = function (o_card_当前卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型)
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
        local area_v = G.call('卡牌属性_获取', o_card_当前卡牌, estr_cardattr_enum_属性名, '光环值')
        local orig_v = G.call('卡牌属性_获取', o_card_当前卡牌, estr_cardattr_enum_属性名, '原始值')
        if buff_v or area_v then
            return value_iter((buff_v or 0) + (area_v or 0) + (orig_v or 0))
        else
            -- 都没有赋值，那就是原始值
            return orig_v
        end
    elseif estr_cardattr_type_属性类型 == '浮动值' then
        dyn_data = o_card_当前卡牌['动态数据'] or {}
        tattr = dyn_data['浮动属性'] or {}
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

    if estr_cardattr_type_属性类型 == '当前值' then
        dyn_data = o_card_当前卡牌['动态数据']
        tattr = dyn_data['当前属性']
        
        local cur_value = value_iter(int_value)
        tattr[estr_cardattr_enum_属性名] = cur_value
        
        -- 临时，应该加入动画队列中
        G.trig_event('UI_卡牌属性更新', o_card_当前卡牌.name, estr_cardattr_enum_属性名)
    elseif estr_cardattr_type_属性类型 == '最大值' then
        -- 最大值不能直接设置
    elseif estr_cardattr_type_属性类型 == '浮动值' then
        dyn_data = o_card_当前卡牌['动态数据']
        tattr = dyn_data['浮动属性']

        local cur_value = value_iter(int_value)
        tattr[estr_cardattr_enum_属性名] = cur_value

        -- 临时，应该加入动画队列中
        G.trig_event('UI_卡牌属性更新', o_card_当前卡牌.name, estr_cardattr_enum_属性名)
    elseif estr_cardattr_type_属性类型 == '光环值' then
        dyn_data = o_card_当前卡牌['动态数据']
        tattr = dyn_data['光环属性']

        local cur_value = value_iter(int_value)
        tattr[estr_cardattr_enum_属性名] = cur_value

        -- 临时，应该加入动画队列中
        G.trig_event('UI_卡牌属性更新', o_card_当前卡牌.name, estr_cardattr_enum_属性名)
    elseif estr_cardattr_type_属性类型 == '原始值' then
        tattr = o_card_当前卡牌['卡牌属性']
        tattr[estr_cardattr_enum_属性名] = value_iter(int_value)
    end
end

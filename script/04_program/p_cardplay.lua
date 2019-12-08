--[[400f

]]
local G = require "gf"
local L = {}
local t = G.api

t['卡牌使用_主流程'] = function (estr_player_相对身份, o_order_info_当前指令信息)
    local effect_stack = G.call('create_stack')
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
    G.call('卡牌使用_生效前')
    if root_info['是否使用成功'] then
    else
        -- 判定不能执行，直接返回
        return
    end

    -- 逐个触发相关事件

    -- 如果是随从，则召唤随从
    local Caster = o_order_info_当前指令信息['Caster']
    if Caster['类型'] == 0x10090004 then
        local index = o_order_info_当前指令信息['MinionPos']
        G.call('角色_战场_添加随从', estr_player_相对身份, Caster, index)
    end

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
    -- 功能初始化
    init()
    -- 触发“前”事件，修改数据
    G.trig_event(event .. '前', skill_info)
    -- 制定
    action()
    -- 触发事件，响应改变
    G.trig_event(event, skill_info)
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

    local init = function ()
        local Caster = o_skill_info_效果信息['Caster']
        o_skill_info_效果信息['费用'] = Caster['费用'] or 0
        o_skill_info_效果信息['过载费用'] = Caster['过载费用'] or 0
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

t['卡牌使用_生效前'] = function ()
    local o_skill_info_效果信息 = get_cur_effect_info()
    if o_skill_info_效果信息 then
    else
        return
    end

    local init = function ()
    end
    local action = function ()
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
        local TargetList = o_skill_info_效果信息['Target']

        local index = #_int_伤害数值 + 1

        -- 伤害值记录下来
        _int_伤害数值[index] = int_伤害值
        TargetList[index] = Target

        -- 造成伤害
        print(int_伤害值)
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_直接伤害', init, action)
end

t['技能效果_法伤伤害_群体'] = function (int_伤害值)
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

        o_skill_info_效果信息['Target'] = TargetList
        o_skill_info_效果信息['伤害数值'] = _int_伤害数值

        for k,Target in ipairs(TargetList) do
            o_skill_info_效果信息['逐个伤害数值'] = int_中间伤害值
            o_skill_info_效果信息['逐个伤害目标'] = Target
            single_damage()
        end
    end
    effect_action_iter(o_skill_info_效果信息, '逻辑_技能效果_法伤伤害', init, action)
end

-- ============================================
-- ============================================
-- ============================================
-- 逻辑默认事件响应
-- ============================================
-- ============================================
-- ============================================
-- 法强、吸血等



-- ============================================
-- ============================================
-- ============================================
-- 常用事件接口
-- ============================================
-- ============================================
-- ============================================



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
end

t['卡牌实例化'] = function (o_card_卡片模板)
    local dbname = G.misc().卡牌实例表
    if dbname then
        return G.CopyInst(o_card_卡片模板, {}, G.NewInst(dbname))
    else
        return G.CopyInst(o_card_卡片模板)
    end

    -- todo，事件注册
end

t['卡牌实例化_信息更新'] = function (i_card_卡牌, string_attr, value)
    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    if o_card_卡牌 and string_attr then
        o_card_卡牌[string_attr] = value
        if string_attr == 'root' then
            setmetatable(o_card_卡牌, getmetatable(G.QueryName(value)))
        end

        G.trig_event('卡牌实例_信息更新', i_card_卡牌)
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
    local data = o_card_当前卡牌['卡牌特性'] or {}

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





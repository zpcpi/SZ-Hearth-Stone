--[[400f

]]
local G = require "gf"
local L = {}
local t = G.api


t['卡牌使用_主流程'] = function (estr_player_相对身份, o_order_info_当前指令信息)
    
    -- 法力值消耗
    G.call('卡牌使用_法力值消耗', estr_player_相对身份, o_order_info_当前指令信息)


    -- 逐个触发相关事件


    -- 如果是随从，则召唤随从
    local Caster = o_order_info_当前指令信息['Caster']
    if Caster['类型'] == 0x10090004 then
        local index = o_order_info_当前指令信息['MinionPos']
        G.call('角色_战场_添加随从', estr_player_相对身份, Caster, index)
    end



end


t['卡牌使用_法力值消耗'] = function (estr_player_相对身份, o_order_info_当前指令信息)
    local Caster = o_order_info_当前指令信息['Caster']

    local 费用 = Caster['费用'] or 0
    local 过载费用 = Caster['过载费用'] or 0

    local 当前值 = G.call('角色_获取水晶数据', estr_player_相对身份, '当前值')
    G.call('角色_设置水晶数据', estr_player_相对身份, '当前值', 当前值 - 费用)

    local 下回锁定值 = G.call('角色_获取水晶数据', estr_player_相对身份, '下回锁定值')
    G.call('角色_设置水晶数据', estr_player_相对身份, '下回锁定值', 下回锁定值 + 过载费用)
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
end

t['卡牌实例化'] = function (o_card_卡片模板)
    local dbname = G.misc().卡牌实例表
    if dbname then
        return  G.CopyInst(o_card_卡片模板, {}, G.NewInst(dbname))
    else
        return G.CopyInst(o_card_卡片模板)
    end
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





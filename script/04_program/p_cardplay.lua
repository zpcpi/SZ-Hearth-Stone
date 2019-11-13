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





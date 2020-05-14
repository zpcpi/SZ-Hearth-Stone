--[[400d

]]
local G = require "gf"
local L = {}
local t = G.api

local function misc_attr_check(...)
    local t = G.misc()
    for _,v in ipairs({...}) do
        if type(t[v]) == 'table' then
        else
            t[v] = {}
        end
        t = t[v]
    end
end

--hide=true
t['角色_添加手牌_绝对身份'] = function(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()
    local int_当前手牌数量 = G.call('角色_获取手牌数量_绝对身份', estr_absolute_id_type_绝对身份)
    o_misc.手牌数量[estr_absolute_id_type_绝对身份] = int_当前手牌数量 + 1
    misc_attr_check('手牌信息', estr_absolute_id_type_绝对身份)
    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    if o_card_卡牌 then
        if o_card_卡牌['动态数据'] then
            o_card_卡牌['动态数据']['卡牌位置'] = '手牌'
        end
        table.insert(o_misc.手牌信息[estr_absolute_id_type_绝对身份], o_card_卡牌)
    end
end

--hide=true
t['角色_获取手牌_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local o_misc = G.misc()

    misc_attr_check('手牌信息', estr_absolute_id_type_绝对身份)
    return o_misc.手牌信息[estr_absolute_id_type_绝对身份] or {}
end

--hide=true
t['角色_移除手牌_绝对身份'] = function(estr_absolute_id_type_绝对身份, int_手牌序号)
    local o_misc = G.misc()
    local int_当前手牌数量 = G.call('角色_获取手牌数量_绝对身份', estr_absolute_id_type_绝对身份)
    o_misc.手牌数量[estr_absolute_id_type_绝对身份] = int_当前手牌数量 - 1

    misc_attr_check('手牌信息', estr_absolute_id_type_绝对身份)

    local o_card_卡牌 = o_misc.手牌信息[estr_absolute_id_type_绝对身份][int_手牌序号]
    if o_card_卡牌 then
        table.remove(o_misc.手牌信息[estr_absolute_id_type_绝对身份], int_手牌序号)
    end
end

--hide=true
t['角色_获取手牌数量_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local o_misc = G.misc()

    misc_attr_check('手牌数量')
    return o_misc.手牌数量[estr_absolute_id_type_绝对身份] or 0
end

--hide=true
--ret=_o_card
t['角色_获取手牌_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local o_misc = G.misc()

    misc_attr_check('手牌信息', estr_absolute_id_type_绝对身份)
    return o_misc.手牌信息[estr_absolute_id_type_绝对身份] or {}
end

--hide=true
t['角色_战场_设置英雄_绝对身份'] = function(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()
    
    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    misc_attr_check('英雄信息')
    if o_card_卡牌 then
        if o_card_卡牌['动态数据'] then
            o_card_卡牌['动态数据']['卡牌位置'] = '战场'
        end
        o_misc.英雄信息[estr_absolute_id_type_绝对身份] = o_card_卡牌
    end
end

--hide=true
t['角色_战场_获取英雄_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local o_misc = G.misc()

    misc_attr_check('英雄信息')
    return o_misc.英雄信息[estr_absolute_id_type_绝对身份]
end

--hide=true
t['角色_战场_设置英雄技能_绝对身份'] = function(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()

    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    misc_attr_check('英雄技能信息')
    if o_card_卡牌 then
        if o_card_卡牌['动态数据'] then
            o_card_卡牌['动态数据']['卡牌位置'] = '战场'
        end
        o_misc.英雄技能信息[estr_absolute_id_type_绝对身份] = o_card_卡牌
    end
end

--hide=true
--ret=o_card
t['角色_战场_获取英雄技能_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local o_misc = G.misc()
    
    misc_attr_check('英雄技能信息')
    return o_misc.英雄技能信息[estr_absolute_id_type_绝对身份]
end

--hide=true
t['角色_战场_设置武器_绝对身份'] = function(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()

    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    misc_attr_check('武器信息')
    if o_card_卡牌 then
        if o_card_卡牌['动态数据'] then
            o_card_卡牌['动态数据']['卡牌位置'] = '战场'
        end
        o_misc.武器信息[estr_absolute_id_type_绝对身份] = o_card_卡牌
    end
end

--hide=true
t['角色_战场_移除武器_绝对身份'] = function(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()

    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    misc_attr_check('武器信息')
    if o_card_卡牌 then
        if o_card_卡牌['动态数据'] then
            o_card_卡牌['动态数据']['卡牌位置'] = '坟场'
        end
        o_misc.武器信息[estr_absolute_id_type_绝对身份] = nil
    end
end

--hide=true
t['角色_战场_获取武器_绝对身份'] = function(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()

    misc_attr_check('武器信息')
    return o_misc.武器信息[estr_absolute_id_type_绝对身份]
end

--hide=true
t['角色_战场_添加随从_绝对身份'] = function(estr_absolute_id_type_绝对身份, i_card_卡牌, int_随从编号)
    local o_misc = G.misc()
    local int_当前随从数量 = G.call('角色_获取随从数量_绝对身份', estr_absolute_id_type_绝对身份)
    o_misc.随从数量[estr_absolute_id_type_绝对身份] = int_当前随从数量 + 1

    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    misc_attr_check('随从信息', estr_absolute_id_type_绝对身份)

    if o_card_卡牌 then
        if o_card_卡牌['动态数据'] then
            o_card_卡牌['动态数据']['卡牌位置'] = '战场'
        end
        local 随从信息 = o_misc.随从信息[estr_absolute_id_type_绝对身份]
        if int_随从编号 > #随从信息 then
            int_随从编号 = #随从信息 + 1
        elseif int_随从编号 <= 0 then
            int_随从编号 = 1
        end
        table.insert(随从信息, int_随从编号, o_card_卡牌)
    end
end

--hide=true
t['角色_战场_移除随从_绝对身份'] = function(estr_absolute_id_type_绝对身份, i_card_卡牌)
    local o_misc = G.misc()
    local int_当前随从数量 = G.call('角色_获取随从数量_绝对身份', estr_absolute_id_type_绝对身份)
    o_misc.随从数量[estr_absolute_id_type_绝对身份] = int_当前随从数量 - 1

    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    misc_attr_check('随从信息', estr_absolute_id_type_绝对身份)
    if o_card_卡牌 then
        if o_card_卡牌['动态数据'] then
            o_card_卡牌['动态数据']['卡牌位置'] = '坟场'
        end
        local 随从信息 = o_misc.随从信息[estr_absolute_id_type_绝对身份]
        for k,tar in ipairs(随从信息) do
            if tar == o_card_卡牌 then
                table.remove(随从信息, k)

                -- TODO，卡牌数据清空
                break
            end
        end
    end
end

--hide=true
t['角色_获取随从数量_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local o_misc = G.misc()

    misc_attr_check('随从数量')
    return o_misc.随从数量[estr_absolute_id_type_绝对身份] or 0
end

--hide=true
t['角色_获取随从列表_绝对身份'] = function(estr_absolute_id_type_绝对身份)
    local o_misc = G.misc()

    misc_attr_check('随从信息', estr_absolute_id_type_绝对身份)

    return o_misc.随从信息[estr_absolute_id_type_绝对身份]
end

t['角色_设置水晶数据_绝对身份'] = function(estr_absolute_id_type_绝对身份, estr_mana_type_修改类型, int_value)
    print('[角色_设置水晶数据_绝对身份]  estr_absolute_id_type_绝对身份', estr_absolute_id_type_绝对身份, 'estr_mana_type_修改类型', estr_mana_type_修改类型, 'int_value', int_value)
    local o_misc = G.misc()
    misc_attr_check('水晶信息', estr_absolute_id_type_绝对身份)
    o_misc.水晶信息[estr_absolute_id_type_绝对身份][estr_mana_type_修改类型] = int_value
    -- FIXME: 临时改为全局脏标记
    G.manaDirtyFlag = true
end

t['角色_获取水晶数据_绝对身份'] = function(estr_absolute_id_type_绝对身份, estr_mana_type_获取类型)
    local o_misc = G.misc()

    misc_attr_check('水晶信息', estr_absolute_id_type_绝对身份)
    print('[角色_获取水晶数据_绝对身份] estr_absolute_id_type_绝对身份', estr_absolute_id_type_绝对身份, 'estr_mana_type_获取类型', estr_mana_type_获取类型)
    return o_misc.水晶信息[estr_absolute_id_type_绝对身份][estr_mana_type_获取类型] or 0
end

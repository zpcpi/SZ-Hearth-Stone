--[[4008

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
t['角色_添加手牌'] = function(estr_player_相对身份, o_card_卡牌, boolean_是否明牌)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    local int_当前手牌数量 = G.call('角色_获取手牌数量_绝对身份', estr_absolute_id_type_绝对身份)
    if (o_card_卡牌 ~= nil) and (int_当前手牌数量 < HANDCARDS_MAX_COUNT) then
        local i_card_卡牌 = o_card_卡牌.name
        G.call('角色_添加手牌_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        -- TODO: 明牌逻辑
        if G.call('主机_是主机') then 
            -- 创建卡牌的时候就同步
            G.call('卡牌实例化_信息更新_预处理', o_card_卡牌, {'root', '卡牌属性', '逻辑数据', '动态数据'})
            G.call('网络通用_广播消息', '角色_添加手牌_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        end
    end
end

--hide=true
t['角色_获取手牌'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    return G.call('角色_获取手牌_绝对身份', estr_absolute_id_type_绝对身份)
end

--hide=true
t['角色_移除手牌'] = function(estr_player_相对身份, int_手牌序号)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    local int_当前手牌数量 = G.call('角色_获取手牌数量_绝对身份', estr_absolute_id_type_绝对身份)

    if (int_手牌序号 > 0) and (int_当前手牌数量 >= int_手牌序号) and (int_手牌序号 <= HANDCARDS_MAX_COUNT) then
        G.call('角色_移除手牌_绝对身份', estr_absolute_id_type_绝对身份, int_手牌序号)

        -- TODO，是否同步内容？
        G.call('网络通用_广播消息', '角色_移除手牌_绝对身份', estr_absolute_id_type_绝对身份, int_手牌序号)
    end
end

--hide=true
t['角色_移除手牌_byCard'] = function(estr_player_相对身份, o_card_卡牌)
    local _o_card_手牌列表 = G.call('角色_获取手牌', estr_player_相对身份)
    local int_index = G.call('array_get_element_index', _o_card_手牌列表, o_card_卡牌)

    if int_index then
        G.call('角色_移除手牌', estr_player_相对身份, int_index)
    end
end

--hide=true
t['角色_获取手牌数量'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_获取手牌数量_绝对身份', estr_absolute_id_type_绝对身份)
end

--hide=true
--ret=_o_card
t['角色_获取手牌'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_获取手牌_绝对身份', estr_absolute_id_type_绝对身份)
end

--ret=_o_randomlib
t['角色_获取牌库'] = function(estr_absolute_id_type_牌库拥有者绝对身份)
    return G.misc()[estr_absolute_id_type_牌库拥有者绝对身份 .. '牌库']
end

--hide=true
t['角色_牌库抽取卡牌'] = function(estr_absolute_id_type_抽牌者绝对身份, estr_absolute_id_type_牌库拥有者绝对身份)
    local _o_randomlib_抽牌牌库 = G.call('角色_获取牌库', estr_absolute_id_type_牌库拥有者绝对身份)
    if _o_randomlib_抽牌牌库 then
    else
        return
    end
    local o_card_卡片 = _o_randomlib_抽牌牌库[1](1)[1] or -- 为空，说明牌库顶里面没有卡牌
                        _o_randomlib_抽牌牌库[2](1)[1] or -- 为空，说明随机牌库里面没有卡牌
                        _o_randomlib_抽牌牌库[3](1)[1] or -- 为空，说明牌库底里面没有卡牌
                        G.call('卡牌实例化', G.QueryName(0x100600b5), estr_absolute_id_type_牌库拥有者绝对身份) -- 为空，抽疲劳卡
                   
    -- TODO: 改成绝对身份?                        
    G.call('技能效果_效果树_执行子效果', {
        ['Player'] = estr_absolute_id_type_抽牌者绝对身份,
        ['卡牌来源'] = estr_absolute_id_type_抽牌者绝对身份 .. '牌库',
    },function ()
        -- TODO: 换成绝对身份?
        local estr_player_抽牌者相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_抽牌者绝对身份)
        G.call('角色属性_手牌_添加', estr_player_抽牌者相对身份, o_card_卡片)
    end)
    G.trig_event('UI_牌库更新')
end

--hide=true
t['角色_战场_设置英雄'] = function(estr_player_相对身份, o_card_卡牌)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    if o_card_卡牌 ~= nil then
        local i_card_卡牌 = o_card_卡牌.name
        G.call('角色_战场_设置英雄_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        if G.call('主机_是主机') then 
            G.call('卡牌实例化_信息更新_预处理', o_card_卡牌, {'root', '卡牌属性', '逻辑数据', '动态数据'})
            G.call('网络通用_广播消息', '角色_战场_设置英雄_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        end
    end
end

--hide=true
t['角色_战场_获取英雄'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_战场_获取英雄_绝对身份', estr_absolute_id_type_绝对身份)
end

--hide=true
t['角色_战场_设置英雄技能'] = function(estr_player_相对身份, o_card_卡牌)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    if o_card_卡牌 ~= nil then
        local i_card_卡牌 = o_card_卡牌.name
        G.call('角色_战场_设置英雄技能_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        G.call('卡牌实例化_信息更新_预处理', o_card_卡牌, {'root', '卡牌属性', '逻辑数据', '动态数据'})
        G.call('网络通用_广播消息', '角色_战场_设置英雄技能_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
    end
end

--hide=true
--ret=o_card
t['角色_战场_获取英雄技能'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_战场_获取英雄技能_绝对身份', estr_absolute_id_type_绝对身份)
end

--hide=true
t['角色_战场_设置武器'] = function(estr_player_相对身份, o_card_卡牌)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    if o_card_卡牌 ~= nil then
        local i_card_卡牌 = o_card_卡牌.name
        G.call('角色_战场_设置武器_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        G.call('卡牌实例化_信息更新_预处理', o_card_卡牌, {'root', '卡牌属性', '逻辑数据', '动态数据'})
        G.call('网络通用_广播消息', '角色_战场_设置武器_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
    end
end

t['角色_战场_移除武器'] = function(estr_player_相对身份, o_card_卡牌)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    local cur_weapon = G.call('角色_战场_获取武器', estr_player_相对身份)

    if (o_card_卡牌 ~= nil) and (o_card_卡牌 == cur_weapon) then
        local i_card_卡牌 = o_card_卡牌.name
        G.call('角色_战场_移除武器_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        G.call('网络通用_广播消息', '角色_战场_移除武器_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
    end
end

--hide=true
t['角色_战场_获取武器'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_战场_获取武器_绝对身份', estr_absolute_id_type_绝对身份)
end

--hide=true
t['角色_战场_添加随从'] = function(estr_player_相对身份, o_card_卡牌, int_随从编号)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    local int_当前随从数量 = G.call('角色_获取随从数量_绝对身份', estr_absolute_id_type_绝对身份)

    int_随从编号 = int_随从编号 or (int_当前随从数量 + 1)

    if (o_card_卡牌 ~= nil) and (int_当前随从数量 < BATTLEMINIONS_MAX_COUNT) then
        local i_card_卡牌 = o_card_卡牌.name
        G.call('角色_战场_添加随从_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌, int_随从编号)
        G.call('卡牌实例化_信息更新_预处理', o_card_卡牌, {'root', '卡牌属性', '逻辑数据', '动态数据'})
        G.call('网络通用_广播消息', '角色_战场_添加随从_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌, int_随从编号)
    end
end

t['角色_战场_移除随从'] = function(estr_player_相对身份, o_card_卡牌)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    local MinionList = G.call('角色_获取随从列表', estr_player_相对身份)
    if (o_card_卡牌 ~= nil) and (G.call('array_get_element_index', MinionList, o_card_卡牌) ~= nil) then
        local i_card_卡牌 = o_card_卡牌.name
        G.call('角色_战场_移除随从_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        G.call('网络通用_广播消息', '角色_战场_移除随从_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
    end
end

--hide=true
t['角色_获取随从数量'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_获取随从数量_绝对身份', estr_absolute_id_type_绝对身份)
end

--hide=true
t['角色_获取随从列表'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_获取随从列表_绝对身份', estr_absolute_id_type_绝对身份)
end

--hide=true
t['角色_获取随从编号'] = function(estr_player_相对身份, o_card_卡牌)
    return G.call('array_get_element_index', G.call('角色_获取随从列表', estr_player_相对身份), o_card_卡牌)
end

t['角色_设置水晶数据'] = function(estr_player_相对身份, estr_mana_type_修改类型, int_value)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    int_value = int_value or 0
    if int_value < 0 then
        int_value = 0
    elseif int_value > MANA_MAX_COUNT then
        int_value = MANA_MAX_COUNT
    end

    local int_oldv = G.call('角色_获取水晶数据_绝对身份', estr_absolute_id_type_绝对身份, estr_mana_type_修改类型)
    if int_value ~= int_oldv then
        G.call('角色_设置水晶数据_绝对身份', estr_absolute_id_type_绝对身份, estr_mana_type_修改类型, int_value)
        if (estr_mana_type_修改类型 ~= '预览值') and (estr_mana_type_修改类型 ~= '预览锁定值') then
            G.call('网络通用_广播消息', '角色_设置水晶数据_绝对身份', estr_absolute_id_type_绝对身份, estr_mana_type_修改类型, int_value)
        end
    end
end

t['角色_获取水晶数据'] = function(estr_player_相对身份, estr_mana_type_获取类型)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_获取水晶数据_绝对身份', estr_absolute_id_type_绝对身份, estr_mana_type_获取类型)
end

--hide=true
--ret=_o_card
t['角色_获取可用卡牌'] = function(estr_absolute_id_type_绝对身份, boolean_包含技能)
    local _o_card_可用卡牌 = {}
    local int_剩余水晶数 = G.call('角色_获取水晶数据_绝对身份', estr_absolute_id_type_绝对身份, '当前值')
    local _o_card_手牌列表 = G.call('角色_获取手牌_绝对身份', estr_absolute_id_type_绝对身份)
    for _, o_card_手牌 in ipairs(_o_card_手牌列表) do 
        local int_卡片费用 = G.call('卡牌属性_获取', o_card_手牌, '费用', '当前值') or 0
        if int_剩余水晶数 >= int_卡片费用 then 
            table.insert(_o_card_可用卡牌, o_card_手牌)
        end
    end
    if boolean_包含技能 then 
        local o_card_英雄技能 = G.call('角色_战场_获取英雄技能_绝对身份', estr_absolute_id_type_绝对身份)
        local int_卡片费用 = G.call('卡牌属性_获取', o_card_英雄技能, '费用', '当前值') or 0
        if int_剩余水晶数 >= int_卡片费用 then 
            table.insert(_o_card_可用卡牌, o_card_英雄技能)
        end
    end
    return _o_card_可用卡牌
end

--hide=true
--ret=boolean
t['角色_是否剩余可用水晶'] = function(estr_absolute_id_type_绝对身份)
    local _o_card_可用卡牌 = G.call('角色_获取可用卡牌', estr_absolute_id_type_绝对身份, true)
    return #_o_card_可用卡牌 > 0
end

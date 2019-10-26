--[[4008

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
t['角色_添加手牌'] = function(estr_player_相对身份, o_card_卡牌)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    local int_当前手牌数量 = G.call('角色_获取手牌数量_绝对身份', estr_absolute_id_type_绝对身份)

    if (o_card_卡牌 ~= nil) and (int_当前手牌数量 < HANDCARDS_MAX_COUNT) then
        if (o_card_卡牌.name == o_card_卡牌.root) then
            local i_card_卡牌 = o_card_卡牌.name
            G.call('角色_添加手牌_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
            G.call('网络通用_广播消息', '角色_添加手牌_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        end
    end
end

--hide=true
t['角色_移除手牌'] = function(estr_player_相对身份, int_手牌序号)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    local int_当前手牌数量 = G.call('角色_获取手牌数量_绝对身份', estr_absolute_id_type_绝对身份)

    if (int_手牌序号 > 0) and (int_当前手牌数量 >= int_手牌序号) and (int_手牌序号 <= HANDCARDS_MAX_COUNT) then
        G.call('角色_移除手牌_绝对身份', estr_absolute_id_type_绝对身份, int_手牌序号)
        G.call('网络通用_广播消息', '角色_移除手牌_绝对身份', estr_absolute_id_type_绝对身份, int_手牌序号)
    end
end

--hide=true
t['角色_获取手牌数量'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_获取手牌数量_绝对身份', estr_absolute_id_type_绝对身份)
end

--hide=true
t['角色_抽取随机卡牌'] = function(estr_player_抽牌者相对身份, estr_player_牌库所属相对身份)
    -- TODO: 从指定牌库中抽取随机卡牌
    local _o_card_牌库 = G.call('角色_获取牌库', estr_player_牌库所属相对身份)
    if #_o_card_牌库 == 0 then 
        -- TODO: 牌库没有卡牌的处理
        return 
    end
    _o_card_牌库 = G.call('array_find', _o_card_牌库, '可收集', true)
    local int_随机数 = G.random(1, #_o_card_牌库)
    G.call('角色_添加手牌', estr_player_抽牌者相对身份, _o_card_牌库[int_随机数])
end

--hide=true
t['角色_获取牌库'] = function(estr_player_牌库所属相对身份)
    -- TODO: 获取玩家身份
    return G.DBTable('o_card')
end

--hide=true
t['角色_战场_设置英雄'] = function(estr_player_相对身份, o_card_卡牌)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    if o_card_卡牌 ~= nil then
        if (o_card_卡牌.name == o_card_卡牌.root) then
            local i_card_卡牌 = o_card_卡牌.name
            G.call('角色_战场_设置英雄_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
            G.call('网络通用_广播消息', '角色_战场_设置英雄_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        end
    end
end

--hide=true
t['角色_战场_设置英雄技能'] = function(estr_player_相对身份, o_card_卡牌)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    if o_card_卡牌 ~= nil then
        if (o_card_卡牌.name == o_card_卡牌.root) then
            local i_card_卡牌 = o_card_卡牌.name
            G.call('角色_战场_设置英雄技能_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
            G.call('网络通用_广播消息', '角色_战场_设置英雄技能_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        end
    end
end

--hide=true
t['角色_战场_设置武器'] = function(estr_player_相对身份, o_card_卡牌)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    if o_card_卡牌 ~= nil then
        if (o_card_卡牌.name == o_card_卡牌.root) then
            local i_card_卡牌 = o_card_卡牌.name
            G.call('角色_战场_设置武器_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
            G.call('网络通用_广播消息', '角色_战场_设置武器_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌)
        end
    end
end

--hide=true
t['角色_战场_添加随从'] = function(estr_player_相对身份, o_card_卡牌, int_随从编号)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    local int_当前随从数量 = G.call('角色_获取随从数量_绝对身份', estr_absolute_id_type_绝对身份)

    int_随从编号 = int_随从编号 or (int_当前随从数量 + 1)

    if (o_card_卡牌 ~= nil) and (int_当前随从数量 < BATTLEMINIONS_MAX_COUNT) and (int_随从编号 > 0) and (int_随从编号 <= BATTLEMINIONS_MAX_COUNT) then
        if (o_card_卡牌.name == o_card_卡牌.root) then
            local i_card_卡牌 = o_card_卡牌.name
            G.call('角色_战场_添加随从_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌, int_随从编号)
            G.call('网络通用_广播消息', '角色_战场_添加随从_绝对身份', estr_absolute_id_type_绝对身份, i_card_卡牌, int_随从编号)
        end
    end
end

--hide=true
t['角色_获取随从数量'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_获取随从数量_绝对身份', estr_absolute_id_type_绝对身份)
end

t['角色_设置水晶数据'] = function(estr_player_相对身份, estr_mana_type_修改类型, int_value)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    int_value = int_value or 0
    if int_value < 0 then
        int_value = 0
    elseif int_value > MANA_MAX_COUNT then
        int_value = MANA_MAX_COUNT
    end

    if true then
        G.call('角色_设置水晶数据_绝对身份', estr_absolute_id_type_绝对身份, estr_mana_type_修改类型, int_value)
        G.call('网络通用_广播消息', '角色_设置水晶数据_绝对身份', estr_absolute_id_type_绝对身份, estr_mana_type_修改类型, int_value)
    end
end

t['角色_获取水晶数据'] = function(estr_player_相对身份, estr_mana_type_获取类型)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('角色_获取水晶数据_绝对身份', estr_absolute_id_type_绝对身份, estr_mana_type_获取类型)
end
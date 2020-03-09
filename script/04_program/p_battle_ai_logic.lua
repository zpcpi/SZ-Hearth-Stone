--[[401e

]]
local G = require "gf"
local L = {}
local t = G.api

--type=ailogic
t['AI逻辑_弱智酒馆老板_游戏开始'] = function()
    G.call('提示_添加提示', '欢迎!我的朋友!')
    G.call('提示_添加提示', '看来今晚要热闹起来了!')
end

--type=ailogic
t['AI逻辑_弱智酒馆老板_回合开始'] = function()
    local estr_absolute_id_type_绝对身份 = G.call('对决_获取当前回合玩家绝对身份')
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)
    G.call('提示_添加提示', '轮到我的回合了!')
    local int_当前回合数 = G.call('对决_获取当前回合数', estr_absolute_id_type_绝对身份)
    -- 只要有卡能用就一直用
    while G.call('角色_是否剩余可用水晶', estr_absolute_id_type_绝对身份) do 
        G.wait_time(1500)
        local _o_card_可用卡牌 = G.call('角色_获取可用卡牌', estr_absolute_id_type_绝对身份, true)
        if #_o_card_可用卡牌 == 0 then
            break 
        end
        -- 使用第一张可用卡牌
        local o_card_使用卡牌 = _o_card_可用卡牌[1]
        G.call('提示_添加提示', '我使用卡牌 ' .. (o_card_使用卡牌.showname or ''))
        local estr_absolute_id_type_敌方绝对身份 = G.call('对决_获取上一个行动角色绝对身份', estr_absolute_id_type_绝对身份)
        -- 目标是敌方英雄, 直接打脸
        local o_card_敌方英雄 = G.call('角色_战场_获取英雄_绝对身份', estr_absolute_id_type_敌方绝对身份)
        local o_order_info_当前指令信息 = {
            Caster = o_card_使用卡牌,
            Target = {o_card_敌方英雄},
            Player = estr_player_相对身份
        }
        G.call('卡牌使用_主流程_thread', estr_player_相对身份, o_order_info_当前指令信息)
    end
    if int_当前回合数 == 1 then
        G.call('提示_添加提示', '我要狠狠地踢你的屁股!')
    else
        G.call('提示_添加提示', '哒哒哒!')
    end
    G.call('对决_回合结束', estr_absolute_id_type_绝对身份)
end

--type=ailogic
t['AI逻辑_弱智酒馆老板_回合结束'] = function()
    G.call('提示_添加提示', '我结束了,看看你还有什么法子!')
end
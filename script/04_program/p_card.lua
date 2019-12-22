--[[4017

]]
local G = require "gf"
local L = {}
local t = G.api

t['card_造成伤害'] = function (o_card_目标卡牌, int_伤害值)
    if o_card_目标卡牌 then
        local cur_ap = G.call('卡牌属性_获取', o_card_目标卡牌, '护甲', '当前值') or 0
        local cur_hp = G.call('卡牌属性_获取', o_card_目标卡牌, '生命', '当前值') or 0
        if cur_ap >= int_伤害值 then
            G.call('卡牌属性_设置', o_card_目标卡牌, '护甲', '当前值', cur_ap - int_伤害值)
        else
            G.call('卡牌属性_设置', o_card_目标卡牌, '护甲', '当前值', 0)
            G.call('卡牌属性_设置', o_card_目标卡牌, '生命', '当前值', cur_hp + cur_ap - int_伤害值)
        end
        -- G.call('卡牌实例化_信息更新_预处理', o_card_目标卡牌, {{'动态数据', '当前属性'}})
    end
end

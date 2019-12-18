--[[4017

]]
local G = require "gf"
local L = {}
local t = G.api

t['card_造成伤害'] = function (o_card_当前卡牌, int_伤害值)
    local cur_value = G.call('卡牌属性_获取', o_card_当前卡牌, '生命', '当前值')
    if type(cur_value) == 'number' then
        G.call('卡牌属性_设置', o_card_当前卡牌, '生命', '当前值', cur_value - int_伤害值)
        G.call('卡牌实例化_信息更新_预处理', o_card_当前卡牌, {'卡牌属性'})
    end
end




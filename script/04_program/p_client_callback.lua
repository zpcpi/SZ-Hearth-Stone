--[[4021

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
t['客机处理回调_加入房间回调'] = function()
end

--hide=true
t['客机处理回调_对决开始回调'] = function()
    -- TODO: 接收对决数据
    -- TODO: 更新界面
    G.call('对决_初始化界面')
end

--hide=true
t['客机处理回调_同步牌库信息'] = function(string_牌库键, any_牌库)
    G.misc()[string_牌库键] = any_牌库
    G.trig_event('UI_牌库更新')
end

--hide=true
t['客机处理回调_动画逻辑'] = function(string_函数名, i_card_卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, int_value)
    local o_card_卡牌 = G.QueryName(i_card_卡牌)
    G.call(string_函数名, o_card_卡牌, estr_cardattr_enum_属性名, estr_cardattr_type_属性类型, int_value)
end
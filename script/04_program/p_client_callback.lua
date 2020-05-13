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
t['客机处理回调_抛出事件'] = function(string_事件名, ...)
    G.trig_event(string_事件名, ...)
end
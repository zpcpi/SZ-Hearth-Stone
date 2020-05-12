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
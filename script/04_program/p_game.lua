--[[401a

]]
local G = require "gf"
local L = {}
local t = G.api

t['游戏_单人模式'] = function()
    -- 当前阶段直接进入单人房间
    G.call('对决_设置对决模式', '挑战酒馆老板')
    G.call('主机_新建房间')
end

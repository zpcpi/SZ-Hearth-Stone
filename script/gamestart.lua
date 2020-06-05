require 'strict'
require 'require_a_n'
local G = require "gf"
local t = G.api

-- 主入口
t.init = function()
    G.call('初始化')
    -- G.call('收藏_解析卡组代码', 'AAECAf0GAA8whAGjAb8BhQP+A9AEiAWSB5cHmge2B84H+wfECAA=')
end
-- 游戏主入口,进入init函数
G.start_program('init')
-- G.addUI('v_net_test')
G.InitSteamDll()
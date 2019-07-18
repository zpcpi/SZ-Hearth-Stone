require 'strict'
require 'require_a_n'
local G = require "gf"
local t = G.api

-- 主入口
t.init = function()
    G.call('初始化')
end
-- 游戏主入口,进入init函数
G.start_program('init')
-- G.addUI('v_net_test')
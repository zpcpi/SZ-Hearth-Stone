--[[0

]]
local G = require "gf"
local t = G.api
local L = {}
--type=系统
--hide=false
--private=false
t['初始化'] = function()
	G.cacheData = {}
	G.call('系统_初始化玩家信息')
	G.start_program("作弊系统_初始化作弊系统")
	G.call('提示_初始化')
	-- G.call('card_create')
end

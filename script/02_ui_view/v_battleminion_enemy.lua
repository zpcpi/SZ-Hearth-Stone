--[[0

]]
local G = require 'gf'
local c_battleminion_enemy = require 'c_battleminion_enemy'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battleminion_enemy'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '功能区'
	tc.pivotY = 0.000
	tc.left = -425.000
	tc.right = 225.000
	tc.bottom = 20.000
	tc.top = 140.000
	tc.mouseEnabled = true
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景版'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.color = 0x3a3a4f
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
	tp.c_battleminion_enemy = setmetatable({}, c_battleminion_enemy)
	tp = tp.parent
	--end

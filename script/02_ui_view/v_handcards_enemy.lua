--[[0

]]
local G = require 'gf'
local c_handcards_enemy = require 'c_handcards_enemy'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_handcards_enemy'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '功能区'
	tc.pivotY = 0.600
	tc.left = -325.000
	tc.right = 125.000
	tc.bottom = -78.000
	tc.top = 52.000
	tc.anchor = 0x64643232
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
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '布局点'
		tc.left = -275.000
		tc.right = 275.000
		tc.bottom = -65.000
		tc.top = 65.000
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_handcards_enemy = setmetatable({}, c_handcards_enemy)

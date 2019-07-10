--[[2003

]]
local G = require 'gf'
local c_battle_handcards_self = require 'c_battle_handcards_self'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_handcards_self'
tc.right = 0.000
tc.top = 0.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '功能区'
	tc.left = -275.000
	tc.right = 275.000
	tc.bottom = -65.000
	tc.top = 65.000
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景版'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.color = 0x25252e
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
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = 'Tips版'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_battle_handcards_self = setmetatable({}, c_battle_handcards_self)

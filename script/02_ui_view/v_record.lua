--[[0

]]
local G = require 'gf'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_record'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '功能区'
	tc.pivotX = 1.000
	tc.left = -270.000
	tc.right = -20.000
	tc.bottom = -350.000
	tc.top = 350.000
	tc.anchor = 0x32326464
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景版'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.color = 0xabfafa
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end

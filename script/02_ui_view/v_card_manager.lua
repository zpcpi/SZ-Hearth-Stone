--[[2003

]]
local G = require 'gf'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_card_manager'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '卡背框'
	tc.right = 0.000
	tc.top = 0.000
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '卡背'
		tc.left = -163.500
		tc.right = 163.500
		tc.bottom = -236.000
		tc.top = 236.000
		tc.img = 0x5601000a
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end

--[[0

]]
local G = require 'gf'
local c_card_manager = require 'c_card_manager'
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
	tc.left = -182.500
	tc.right = 182.500
	tc.bottom = -256.000
	tc.top = 256.000
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '卡背'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.scaleX = 0.900
		tc.scaleY = 0.900
		tc.img = 0x5601000a
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '卡片实例'
	tc.left = -50.000
	tc.right = 50.000
	tc.bottom = -50.000
	tc.top = 50.000
	tp = tc
	tp = tp.parent
	--end
tp.c_card_manager = setmetatable({}, c_card_manager)

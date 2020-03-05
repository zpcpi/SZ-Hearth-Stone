--[[0

]]
local G = require 'gf'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_missile'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = '飞弹图片'
	tc.left = -254.000
	tc.right = 258.000
	tc.bottom = -286.000
	tc.top = 226.000
	tc.img = 0x56240001
	tp = tc
	tp = tp.parent
	--end

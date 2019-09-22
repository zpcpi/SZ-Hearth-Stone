--[[0

]]
local G = require 'gf'
local c_pop_pointline = require 'c_pop_pointline'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_pop_pointline'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '容器'
	tc.left = -50.000
	tc.right = 50.000
	tc.bottom = -50.000
	tc.top = 50.000
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = '线中'
	tc.pivotX = 0.700
	tc.left = -171.000
	tc.right = -71.000
	tc.bottom = -43.000
	tc.top = 57.000
	tc.visible = false
	tc.img = 0x56240003
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = '线头'
	tc.pivotX = 0.770
	tc.left = -69.000
	tc.right = 31.000
	tc.bottom = -172.000
	tc.top = -72.000
	tc.visible = false
	tc.img = 0x56240002
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = '靶点'
	tc.left = 21.000
	tc.right = 121.000
	tc.bottom = -45.000
	tc.top = 55.000
	tc.visible = false
	tc.img = 0x56240001
	tp = tc
	tp = tp.parent
	--end
tp.c_pop_pointline = setmetatable({}, c_pop_pointline)
com = tp.c_pop_pointline
com['p1x'] =nil
com['p1y'] =nil
com['p2x'] =nil
com['p2y'] =nil
com['p3x'] =nil
com['p3y'] =nil

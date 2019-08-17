--[[0

]]
local G = require 'gf'
local c_curved_text = require 'c_curved_text'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_curved_text'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '单字父级'
	tc.left = -50.000
	tc.right = 50.000
	tc.bottom = -50.000
	tc.top = 50.000
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = '字体模板'
	tc.left = -100.000
	tc.bottom = -50.000
	tc.top = 50.000
	tc.visible = false
	tc.text = '123'
	tc.font = 0x60200041
	tc.style = 13
	tc.outlineSize = 5.000
	tp = tc
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '中心点'
	tc.left = -50.000
	tc.right = 50.000
	tc.bottom = -50.000
	tc.top = 50.000
	tc.visible = false
	tp = tc
	tp = tp.parent
	--end
tp.c_curved_text = setmetatable({}, c_curved_text)
com = tp.c_curved_text
com['text'] =nil
com['p0x'] =nil
com['p0y'] =nil
com['p1x'] =nil
com['p1y'] =nil
com['p2x'] =nil
com['p2y'] =nil
com['p3x'] =nil
com['p3y'] =nil
com['space'] =nil

--[[2005

]]
local G = require 'gf'
local c_citymap_system_map = require 'c_citymap_system_map'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_citymap_system_map'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = '背景'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tc.img = 0x56020001
	tp = tc
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '城市'
	tc.pivotX = 0.000
	tc.pivotY = 0.000
	tc.right = 1290.000
	tc.top = 720.000
	tc.anchor = 0x0
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = '前景'
	tc.left = -50.000
	tc.right = 50.000
	tc.bottom = -50.000
	tc.top = 50.000
	tc.visible = false
	tc.img = 0x56000001
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = '标题'
	tc.left = -611.286
	tc.right = 68.714
	tc.bottom = 287.857
	tc.top = 343.571
	tc.text = '地图名称'
	tc.font = 0x60240000
	tc.align = 4
	tp = tc
	tp = tp.parent
	--end
tp.c_citymap_system_map = setmetatable({}, c_citymap_system_map)

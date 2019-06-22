--[[2006

]]
local G = require 'gf'
local c_button = require 'c_button'
local c_citymap_system_city = require 'c_citymap_system_city'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_citymap_system_city'
tc.left = -50.000
tc.right = 50.000
tc.bottom = -50.000
tc.top = 50.000
tp = tc
	tc = G.loadUI('v_button')
	tp.addChild(tc)
	tc.name = '按钮'
	tc.left = -33.000
	tc.right = 33.000
	tc.bottom = -30.500
	tc.top = 30.500
	tp = tc
		tc = tp.getChildByName('img')
		if tc then
		tc.img = 0x56020002
		tp = tc
		end
		tp = tp.parent
		--end
	com = tp.c_button
	com['img_normal'] =1442971650.000
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = '锁'
	tc.left = -15.000
	tc.right = 15.000
	tc.bottom = -19.000
	tc.top = 19.000
	tc.img = 0x56020004
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = '名称'
	tc.left = -54.000
	tc.right = 54.000
	tc.bottom = -63.000
	tc.top = -13.000
	tc.text = '名称'
	tc.font = 0x60140000
	tp = tc
	tp = tp.parent
	--end
tp.c_citymap_system_city = setmetatable({}, c_citymap_system_city)

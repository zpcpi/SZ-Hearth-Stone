--[[0

]]
local G = require 'gf'
local c_battlemana_self = require 'c_battlemana_self'
local c_mintextquadsize = require 'c_mintextquadsize'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battlemana_self'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '功能区'
	tc.left = 82.500
	tc.right = 327.500
	tc.bottom = -244.556
	tc.top = -187.444
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
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '水晶模板'
			tc.left = -230.000
			tc.right = 21.000
			tc.bottom = -121.000
			tc.top = 147.000
			tc.visible = false
			tc.scaleX = 0.075
			tc.scaleY = 0.075
			tc.img = 0x560b0001
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = '法力值数值'
		tc.left = -47.500
		tc.right = 47.500
		tc.bottom = 12.500
		tc.top = 47.500
		tc.anchor = 0x64643232
		tc.text = '3/10'
		tc.font = 0x633b0000
		tc.style = 14
		tp = tc
		tp.c_mintextquadsize = setmetatable({}, c_mintextquadsize)
		com = tp.c_mintextquadsize
		com['minWidth'] =0.000
		com['autowidth'] =true
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_battlemana_self = setmetatable({}, c_battlemana_self)
com = tp.c_battlemana_self
com['最大值'] =nil
com['当前值'] =nil
com['锁定值'] =nil
com['下回锁定值'] =nil
com['预览值'] =nil
com['预览锁定值'] =nil

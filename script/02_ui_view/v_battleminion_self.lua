--[[0

]]
local G = require 'gf'
local c_animactor = require 'c_animactor'
local c_battleminion_self = require 'c_battleminion_self'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battleminion_self'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '功能区'
	tc.pivotY = 1.000
	tc.left = -425.000
	tc.right = 225.000
	tc.bottom = -100.000
	tc.top = 20.000
	tc.mouseEnabled = true
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景版'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.color = 0x3a3a4f
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '布局点'
		tc.left = -325.000
		tc.right = 325.000
		tc.bottom = -60.000
		tc.top = 60.000
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '随从占位'
			tc.left = -50.000
			tc.right = 50.000
			tc.bottom = -50.000
			tc.top = 50.000
			tc.visible = false
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.loadUI('v_animactor')
		tc.prefab = true
		tp.addChild(tc)
		tc.name = '动画控件'
		tc.left = -640.000
		tc.right = 640.000
		tc.bottom = -360.000
		tc.top = 360.000
		tp = tc
		tp.c_animactor = setmetatable({}, c_animactor)
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_battleminion_self = setmetatable({}, c_battleminion_self)

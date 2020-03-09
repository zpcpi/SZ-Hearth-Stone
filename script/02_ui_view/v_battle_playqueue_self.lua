--[[0

]]
local G = require 'gf'
local c_animactor = require 'c_animactor'
local c_battle_playqueue_self = require 'c_battle_playqueue_self'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_playqueue_self'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '队列功能区'
	tc.left = -375.000
	tc.right = -285.000
	tc.bottom = 120.000
	tc.top = 245.000
	tc.anchor = 0x3232
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景版'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.visible = false
		tc.color = 0x3a3a4f
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '释放功能区'
	tc.left = -557.000
	tc.right = -373.000
	tc.bottom = 246.500
	tc.top = 510.500
	tc.anchor = 0x3232
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景版'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.visible = false
		tc.color = 0x3a3a4f
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
tp.c_battle_playqueue_self = setmetatable({}, c_battle_playqueue_self)

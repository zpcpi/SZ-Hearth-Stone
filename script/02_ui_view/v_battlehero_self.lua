--[[0

]]
local G = require 'gf'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_card_hero = require 'c_card_hero'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battlehero_self'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '功能区'
	tc.pivotY = 0.000
	tc.left = -280.000
	tc.right = 80.000
	tc.bottom = 115.000
	tc.top = 250.000
	tc.anchor = 0x3232
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
		tc = G.loadUI('v_card_hero')
		tc.prefab = true
		tp.addChild(tc)
		tc.name = 'c1'
		tc.right = 0.000
		tc.top = 0.000
		tc.scaleX = 0.280
		tc.scaleY = 0.280
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end

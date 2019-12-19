--[[0

]]
local G = require 'gf'
local c_card_manager = require 'c_card_manager'
local c_battlehero_self = require 'c_battlehero_self'
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
		tc = G.loadUI('v_card_manager')
		tc.prefab = true
		tp.addChild(tc)
		tc.name = '英雄'
		tc.left = -320.000
		tc.right = 320.000
		tc.bottom = -180.000
		tc.top = 180.000
		tc.mouseEnabled = true
		tc.visible = false
		tc.scaleX = 0.280
		tc.scaleY = 0.280
		tp = tc
		tp.c_card_manager = setmetatable({}, c_card_manager)
		tp = tp.parent
		--end
		tc = G.loadUI('v_card_manager')
		tc.prefab = true
		tp.addChild(tc)
		tc.name = '英雄技能'
		tc.left = -330.000
		tc.right = 310.000
		tc.bottom = -170.000
		tc.top = 190.000
		tc.anchor = 0x32325050
		tc.mouseEnabled = true
		tc.visible = false
		tc.scaleX = 0.280
		tc.scaleY = 0.280
		tp = tc
		tp.c_card_manager = setmetatable({}, c_card_manager)
		tp = tp.parent
		--end
		tc = G.loadUI('v_card_manager')
		tc.prefab = true
		tp.addChild(tc)
		tc.name = '武器'
		tc.left = -310.000
		tc.right = 330.000
		tc.bottom = -165.000
		tc.top = 195.000
		tc.anchor = 0x32321414
		tc.mouseEnabled = true
		tc.visible = false
		tc.scaleX = 0.250
		tc.scaleY = 0.250
		tp = tc
		tp.c_card_manager = setmetatable({}, c_card_manager)
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_battlehero_self = setmetatable({}, c_battlehero_self)

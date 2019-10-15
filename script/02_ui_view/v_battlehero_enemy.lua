--[[0

]]
local G = require 'gf'
local c_battle_weapon = require 'c_battle_weapon'
local c_battlehero_enemy = require 'c_battlehero_enemy'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_battle_hero = require 'c_battle_hero'
local c_battle_herospell = require 'c_battle_herospell'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battlehero_enemy'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '功能区'
	tc.pivotY = 1.000
	tc.left = -280.000
	tc.right = 80.000
	tc.bottom = -215.000
	tc.top = -80.000
	tc.anchor = 0x64643232
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
		tc = G.loadUI('v_battle_hero')
		tc.prefab = true
		tp.addChild(tc)
		tc.name = '英雄'
		tc.right = 0.000
		tc.top = 0.000
		tc.visible = false
		tc.scaleX = 0.280
		tc.scaleY = 0.280
		tp = tc
		tp = tp.parent
		--end
		tc = G.loadUI('v_battle_herospell')
		tc.prefab = true
		tp.addChild(tc)
		tc.name = '英雄技能'
		tc.left = -640.000
		tc.right = 0.000
		tc.bottom = -360.000
		tc.top = 0.000
		tc.anchor = 0x32325050
		tc.visible = false
		tc.scaleX = 0.350
		tc.scaleY = 0.350
		tp = tc
		tp = tp.parent
		--end
		tc = G.loadUI('v_battle_weapon')
		tc.prefab = true
		tp.addChild(tc)
		tc.name = '武器'
		tc.left = -640.000
		tc.right = 0.000
		tc.bottom = -360.000
		tc.top = 0.000
		tc.anchor = 0x32321414
		tc.visible = false
		tc.scaleX = 0.300
		tc.scaleY = 0.300
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_battlehero_enemy = setmetatable({}, c_battlehero_enemy)

--[[0

]]
local G = require 'gf'
local c_battle_1v1 = require 'c_battle_1v1'
local c_handcards_enemy = require 'c_handcards_enemy'
local c_pop_pointline = require 'c_pop_pointline'
local c_animactor = require 'c_animactor'
local c_handcards_self = require 'c_handcards_self'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_1v1'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = '背景版'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tc.mouseEnabled = true
	tc.color = 0xbcaf37
	tc.alpha = 150
	tc.img = 0x56000001
	tp = tc
	tp = tp.parent
	--end
	tc = G.loadUI('v_battleminion_enemy')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'EnemyBattleMinion'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp = tp.parent
	--end
	tc = G.loadUI('v_battleminion_self')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'SelfBattleMinion'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp = tp.parent
	--end
	tc = G.loadUI('v_battlehero_enemy')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'EnemyBattleHero'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp = tp.parent
	--end
	tc = G.loadUI('v_battlehero_self')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'SelfBattleHero'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp = tp.parent
	--end
	tc = G.loadUI('v_handcards_enemy')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'EnemyHandcard'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp.c_handcards_enemy = setmetatable({}, c_handcards_enemy)
	tp = tp.parent
	--end
	tc = G.loadUI('v_handcards_self')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'SelfHandcard'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp.c_handcards_self = setmetatable({}, c_handcards_self)
	tp = tp.parent
	--end
	tc = G.loadUI('v_record')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'Record'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp = tp.parent
	--end
	tc = G.loadUI('v_history')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'History'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp = tp.parent
	--end
	tc = G.loadUI('v_pop_pointline')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'c1'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp.c_pop_pointline = setmetatable({}, c_pop_pointline)
	com = tp.c_pop_pointline
	com['p1x'] =nil
	com['p1y'] =nil
	com['p2x'] =nil
	com['p2y'] =nil
	com['p3x'] =nil
	com['p3y'] =nil
	tp = tp.parent
	--end
tp.c_animactor = setmetatable({}, c_animactor)
tp.c_battle_1v1 = setmetatable({}, c_battle_1v1)

--[[0

]]
local G = require 'gf'
local c_battle_1v1 = require 'c_battle_1v1'
local c_handcards_self = require 'c_handcards_self'
local c_handcards_enemy = require 'c_handcards_enemy'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_1v1'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
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
tp.c_battle_1v1 = setmetatable({}, c_battle_1v1)

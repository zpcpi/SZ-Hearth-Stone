--[[0

]]
local G = require 'gf'
local c_battleminion_self = require 'c_battleminion_self'
local c_button = require 'c_button'
local c_animactor = require 'c_animactor'
local c_battlemana_self = require 'c_battlemana_self'
local c_battlehero_enemy = require 'c_battlehero_enemy'
local c_handcards_self = require 'c_handcards_self'
local c_battlemana_enemy = require 'c_battlemana_enemy'
local c_battle_1v1 = require 'c_battle_1v1'
local c_handcards_enemy = require 'c_handcards_enemy'
local c_battle_weapon = require 'c_battle_weapon'
local c_battlehero_self = require 'c_battlehero_self'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_battle_hero = require 'c_battle_hero'
local c_battle_herospell = require 'c_battle_herospell'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_1v1'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tc.mouseEnabled = true
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
	tc = G.loadUI('v_battlemana_enemy')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'EnemyBattleMana'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp = tp.parent
	--end
	tc = G.loadUI('v_battlemana_self')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'SelfBattleMana'
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
	tp.c_battlehero_enemy = setmetatable({}, c_battlehero_enemy)
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
	tp.c_battlehero_self = setmetatable({}, c_battlehero_self)
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
	tc = G.loadUI('v_animactor')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'MainActor'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp.c_animactor = setmetatable({}, c_animactor)
	tp = tp.parent
	--end
	tc = G.loadUI('v_animactor')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'SkillActor'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp.c_animactor = setmetatable({}, c_animactor)
	tp = tp.parent
	--end
	tc = G.loadUI('v_button')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'EndTurnButton'
	tc.left = 241.000
	tc.right = 353.000
	tc.bottom = -20.000
	tc.top = 20.000
	tc.mouseEnabled = true
	tp = tc
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='结束回合'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =1442840577.000
	com['color_normal'] =nil
	com['img_hover'] =nil
	com['color_hover'] =nil
	com['audio_hover'] =nil
	com['img_press'] =nil
	com['frameList_press'] =nil
	com['color_press'] =nil
	com['audio_press'] =nil
	com['img_disable'] =nil
	com['color_disable'] =nil
	com['img_toggle'] =nil
	com['color_toggle'] =nil
	com['img_togEx'] =nil
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '跨界面操作框'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tp = tc
	tp = tp.parent
	--end
tp.c_battle_1v1 = setmetatable({}, c_battle_1v1)

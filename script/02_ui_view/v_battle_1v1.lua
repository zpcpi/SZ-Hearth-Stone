--[[0

]]
local G = require 'gf'
local c_animactor = require 'c_animactor'
local c_battleminion_self = require 'c_battleminion_self'
local c_choose = require 'c_choose'
local c_handcards_enemy = require 'c_handcards_enemy'
local c_carddeck = require 'c_carddeck'
local c_give_up_button = require 'c_give_up_button'
local c_battle_playqueue_enemy = require 'c_battle_playqueue_enemy'
local c_battleminion_enemy = require 'c_battleminion_enemy'
local c_card_manager = require 'c_card_manager'
local c_layout_v = require 'c_layout_v'
local c_battlemana_self = require 'c_battlemana_self'
local c_perfectsize = require 'c_perfectsize'
local c_handcards_self = require 'c_handcards_self'
local c_battle_playqueue_self = require 'c_battle_playqueue_self'
local c_battlehero_enemy = require 'c_battlehero_enemy'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_battlehero_self = require 'c_battlehero_self'
local c_button = require 'c_button'
local c_battle_1v1 = require 'c_battle_1v1'
local c_battlemana_enemy = require 'c_battlemana_enemy'
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
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'EndTurnButton'
	tc.left = 241.000
	tc.right = 353.000
	tc.bottom = -20.000
	tc.top = 20.000
	tc.mouseEnabled = true
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'img_ex'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.visible = false
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'img'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.color = 0x0
		tc.text = '对方回合'
		tc.font = 0x60100000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='对方回合'
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
	tc = G.loadUI('v_battlemana_enemy')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'EnemyBattleMana'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp.c_battlemana_enemy = setmetatable({}, c_battlemana_enemy)
	com = tp.c_battlemana_enemy
	com['最大值'] =nil
	com['当前值'] =nil
	com['锁定值'] =nil
	com['下回锁定值'] =nil
	com['预览值'] =nil
	com['预览锁定值'] =nil
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
	tp.c_battlemana_self = setmetatable({}, c_battlemana_self)
	com = tp.c_battlemana_self
	com['最大值'] =nil
	com['当前值'] =nil
	com['锁定值'] =nil
	com['下回锁定值'] =nil
	com['预览值'] =nil
	com['预览锁定值'] =nil
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
	tp.c_battleminion_enemy = setmetatable({}, c_battleminion_enemy)
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
	tp.c_battleminion_self = setmetatable({}, c_battleminion_self)
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
	tc = G.loadUI('v_choose')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'Choose'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tc.visible = false
	tp = tc
	tp.c_choose = setmetatable({}, c_choose)
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
	tc = G.loadUI('v_battle_playqueue_enemy')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'enemyPlayQueue'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp.c_battle_playqueue_self = setmetatable({}, c_battle_playqueue_self)
	tp.c_battle_playqueue_enemy = setmetatable({}, c_battle_playqueue_enemy)
	tp = tp.parent
	--end
	tc = G.loadUI('v_battle_playqueue_self')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'selfPlayQueue'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp.c_battle_playqueue_self = setmetatable({}, c_battle_playqueue_self)
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
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '全局Tips版'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tp = tc
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '特效层级'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tp = tc
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
	tc = G.loadUI('v_give_up_button')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = 'GiveUpButton'
	tc.left = -637.500
	tc.right = -530.500
	tc.bottom = -356.833
	tc.top = -293.833
	tp = tc
	tp.c_give_up_button = setmetatable({}, c_give_up_button)
	tp = tp.parent
	--end
tp.c_battle_1v1 = setmetatable({}, c_battle_1v1)

--[[0

]]
local G = require 'gf'
local c_battle_result = require 'c_battle_result'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_result'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'Background'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tc.mouseEnabled = true
	tc.color = 0x0
	tc.img = 0x56000001
	tp = tc
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'Win'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tp = tc
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'Text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.text = '胜利'
		tc.font = 0x63400000
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'Lose'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tp = tc
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'Text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.text = '失败'
		tc.font = 0x63400000
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_battle_result = setmetatable({}, c_battle_result)

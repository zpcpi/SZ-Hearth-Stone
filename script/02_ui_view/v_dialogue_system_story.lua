--[[2002

]]
local G = require 'gf'
local c_dialogue_system_story = require 'c_dialogue_system_story'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_dialogue_system_story'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = '角色'
	tc.pivotY = 0.000
	tc.left = -618.000
	tc.right = 0.000
	tc.top = 828.000
	tc.anchor = 0x6464
	tc.mouseEnabled = true
	tc.img = 0x56010002
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = '对话框'
	tc.left = -632.500
	tc.right = 472.500
	tc.bottom = -349.000
	tc.top = -131.000
	tc.mouseEnabled = true
	tc.img = 0x56010003
	tp = tc
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = '文字'
		tc.left = 128.000
		tc.right = -128.000
		tc.bottom = 48.000
		tc.top = -48.000
		tc.anchor = 0x64006400
		tc.color = 0x0
		tc.text = '123'
		tc.font = 0x61200041
		tc.align = 1
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '角色名称'
	tc.left = 270.000
	tc.right = 370.000
	tc.bottom = -382.000
	tc.top = -282.000
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -204.000
		tc.right = 204.000
		tc.bottom = -33.000
		tc.top = 33.000
		tc.mouseEnabled = true
		tc.img = 0x56010004
		tp = tc
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = '姓名'
		tc.left = -100.000
		tc.bottom = -50.000
		tc.top = 50.000
		tc.text = '无名女子'
		tc.font = 0x61200041
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_dialogue_system_story = setmetatable({}, c_dialogue_system_story)

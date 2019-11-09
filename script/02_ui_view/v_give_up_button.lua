--[[0

]]
local G = require 'gf'
local c_give_up_button = require 'c_give_up_button'
local c_button = require 'c_button'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_give_up_button'
tc.left = -50.000
tc.right = 50.000
tc.bottom = -50.000
tc.top = 50.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'Button'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
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
		tc.text = '投降'
		tc.font = 0x63200041
		tc.style = 2
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='投降'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =1442840577.000
	com['color_normal'] =0.000
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
tp.c_give_up_button = setmetatable({}, c_give_up_button)

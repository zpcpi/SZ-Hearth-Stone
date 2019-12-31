--[[0

]]
local G = require 'gf'
local c_button = require 'c_button'
local c_choose = require 'c_choose'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_choose'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '功能区'
	tc.left = -514.500
	tc.right = 368.500
	tc.bottom = -285.000
	tc.top = 319.000
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景版'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.color = 0xbcaf37
		tc.alpha = 70
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '布局点'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tp = tc
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = 'HideButton'
		tc.left = -425.000
		tc.right = -313.000
		tc.bottom = -292.000
		tc.top = -252.000
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
			tc.text = '隐藏'
			tc.font = 0x60100000
			tp = tc
			tp = tp.parent
			--end
		tp.c_button = setmetatable({}, c_button)
		com = tp.c_button
		com['text'] ='隐藏'
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
	tp = tp.parent
	--end
tp.c_choose = setmetatable({}, c_choose)

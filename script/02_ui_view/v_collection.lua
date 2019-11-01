--[[0

]]
local G = require 'gf'
local c_layout_h = require 'c_layout_h'
local c_button = require 'c_button'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_collection'
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
	tc.color = 0xd6d6d6
	tc.img = 0x56000001
	tp = tc
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'CardCollection'
	tc.pivotX = 0.000
	tc.right = 1000.000
	tc.bottom = -251.000
	tc.top = 299.000
	tc.anchor = 0x32320000
	tp = tc
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = 'ClassMark'
		tc.pivotX = 0.000
		tc.pivotY = 0.000
		tc.top = 50.000
		tc.anchor = 0x64640000
		tp = tc
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = 'ClassMarkButton'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.right = 84.000
			tc.bottom = -50.000
			tc.top = 0.000
			tc.anchor = 0x64640000
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
				tc.pivotX = 0.000
				tc.pivotY = 1.000
				tc.right = 84.000
				tc.bottom = -50.000
				tc.top = 0.000
				tc.anchor = 0x64640000
				tc.color = 0x6c6c6c
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
				tc.text = '死亡骑士'
				tc.font = 0x65140000
				tp = tc
				tp = tp.parent
				--end
			tp.c_button = setmetatable({}, c_button)
			com = tp.c_button
			com['text'] ='死亡骑士'
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
		tp.c_layout_h = setmetatable({}, c_layout_h)
		com = tp.c_layout_h
		com['alignment_h'] =0.000
		com['alignment_v'] =1.000
		com['RowSpace'] =10.000
		com['StartX'] =0.000
		com['changePivot'] =false
		com['changeAnchor'] =false
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = 'ModMark'
		tc.pivotX = 1.000
		tc.pivotY = 0.000
		tc.left = -100.000
		tc.right = 0.000
		tc.top = 50.000
		tc.anchor = 0x64646464
		tp = tc
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = 'ModMarkButton'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.left = 16.000
			tc.bottom = -50.000
			tc.top = 0.000
			tc.anchor = 0x64640000
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
				tc.pivotX = 0.000
				tc.pivotY = 1.000
				tc.right = 84.000
				tc.bottom = -50.000
				tc.top = 0.000
				tc.anchor = 0x64640000
				tc.color = 0x6c6c6c
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
				tc.text = '基本'
				tc.font = 0x65140000
				tp = tc
				tp = tp.parent
				--end
			tp.c_button = setmetatable({}, c_button)
			com = tp.c_button
			com['text'] ='基本'
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
		tp.c_layout_h = setmetatable({}, c_layout_h)
		com = tp.c_layout_h
		com['alignment_h'] =2.000
		com['alignment_v'] =1.000
		com['RowSpace'] =10.000
		com['StartX'] =0.000
		com['changePivot'] =false
		com['changeAnchor'] =false
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'Background'
		tc.pivotX = 0.000
		tc.right = 1000.000
		tc.bottom = -275.000
		tc.top = 275.000
		tc.anchor = 0x32320000
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end

--[[0

]]
local G = require 'gf'
local c_scrollview = require 'c_scrollview'
local c_layout_v = require 'c_layout_v'
local c_room_list = require 'c_room_list'
local c_button = require 'c_button'
local c_perfectsize = require 'c_perfectsize'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_room_list'
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
	tc.alpha = 0
	tc.img = 0x56000001
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'ListBackground'
	tc.left = -162.833
	tc.right = 162.833
	tc.bottom = -234.833
	tc.top = 234.833
	tc.img = 0x56290007
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'RoomList'
	tc.left = -135.000
	tc.right = 135.000
	tc.bottom = -213.500
	tc.top = 213.500
	tc.mouseEnabled = true
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'mask'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.mouseEnabled = true
		tc.mask = 128
		tc.img = 0x56060001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'content'
		tc.pivotX = 0.000
		tc.pivotY = 1.000
		tc.right = 270.000
		tc.top = 0.000
		tc.anchor = 0x64640000
		tp = tc
		tp.c_layout_v = setmetatable({}, c_layout_v)
		com = tp.c_layout_v
		com['alignment_h'] =0.000
		com['alignment_v'] =0.000
		com['ColSpace'] =10.000
		com['startSpaceX'] =0.000
		com['startSpaceY'] =0.000
		com['changePivot'] =false
		com['changeAnchor'] =false
		tp.c_perfectsize = setmetatable({}, c_perfectsize)
		com = tp.c_perfectsize
		com['height'] =true
		com['expheight'] =0.000
		com['minheight'] =nil
		com['width'] =false
		com['expwidth'] =nil
		com['minwidth'] =nil
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = 'slider'
		tc.pivotX = 0.000
		tc.pivotY = 0.000
		tc.right = 6.000
		tc.top = 0.000
		tc.anchor = 0x64006464
		tc.visible = false
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '背景'
			tc.right = 0.000
			tc.top = 0.000
			tc.anchor = 0x64006400
			tc.img = 0x5622007f
			tp = tc
			tp = tp.parent
			--end
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = '按钮'
			tc.pivotY = 1.000
			tc.right = 0.000
			tc.bottom = -97.000
			tc.top = 0.000
			tc.anchor = 0x64646400
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
				tc.img = 0x56220080
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
				tp = tc
				tp = tp.parent
				--end
			tp.c_button = setmetatable({}, c_button)
			com = tp.c_button
			com['text'] =nil
			com['btn_class'] =nil
			com['customsize'] =true
			com['img_normal'] =1445068928.000
			com['color_normal'] =0.000
			com['img_hover'] =1445068929.000
			com['color_hover'] =nil
			com['audio_hover'] =nil
			com['img_press'] =1445068928.000
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
	tp.c_scrollview = setmetatable({}, c_scrollview)
	com = tp.c_scrollview
	com['Horizontal'] =false
	com['Vertical'] =true
	com['Sensitivity'] =10.000
	com['type'] =0.000
	com['autoMove'] =false
	com['hideSlider'] =true
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'RoomInfo'
	tc.left = 228.000
	tc.right = 410.000
	tc.bottom = -190.500
	tc.top = 190.500
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'Background'
		tc.left = -305.000
		tc.right = 305.000
		tc.bottom = -482.000
		tc.top = 482.000
		tc.scaleX = 0.500
		tc.scaleY = 0.500
		tc.img = 0x56290004
		tp = tc
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'Info'
		tc.left = -83.000
		tc.right = 83.000
		tc.bottom = -172.000
		tc.top = 184.000
		tc.text = '正在获取房间列表...'
		tc.wrap = true
		tc.font = 0x65180000
		tc.align = 1
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'RoomButton'
	tc.left = -135.000
	tc.right = 135.000
	tc.bottom = -42.000
	tc.top = 42.000
	tc.mouseEnabled = true
	tc.visible = false
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
		tc.img = 0x56290006
		tp = tc
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.text = 'Conight Room'
		tc.font = 0x65180000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='Conight Room'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =1445527558.000
	com['color_normal'] =16777215.000
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
tp.c_room_list = setmetatable({}, c_room_list)

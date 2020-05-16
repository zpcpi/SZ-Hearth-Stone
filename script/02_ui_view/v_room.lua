--[[0

]]
local G = require 'gf'
local c_layout_h = require 'c_layout_h'
local c_button = require 'c_button'
local c_layout_v = require 'c_layout_v'
local c_scrollview = require 'c_scrollview'
local c_perfectsize = require 'c_perfectsize'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_room = require 'c_room'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_room'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'Background'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'Background'
		tc.left = -1024.000
		tc.right = 1024.000
		tc.bottom = -1117.000
		tc.top = 931.000
		tc.scaleX = 0.700
		tc.scaleY = 0.700
		tc.img = 0x56280001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'Background1'
		tc.left = -512.000
		tc.right = 512.000
		tc.bottom = -372.500
		tc.top = 372.500
		tc.img = 0x562c0003
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'IP'
	tc.left = -629.333
	tc.right = -529.333
	tc.bottom = 279.333
	tc.top = 379.333
	tp = tc
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'IPTitle'
		tc.left = -100.000
		tc.bottom = -21.000
		tc.top = 21.000
		tc.text = 'IP地址'
		tc.font = 0x63200041
		tp = tc
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'IPText'
		tc.left = 59.000
		tc.right = 327.000
		tc.bottom = -22.000
		tc.top = 22.000
		tc.text = '192.168.215.114:nil'
		tc.font = 0x63200041
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'GameMode'
	tc.left = -630.000
	tc.right = -410.000
	tc.bottom = 211.000
	tc.top = 259.000
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
		tc.text = '1v1'
		tc.font = 0x63200041
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='1v1'
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
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'DeckInfo'
	tc.left = -630.000
	tc.right = -410.000
	tc.bottom = 144.000
	tc.top = 192.000
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
		tc.text = '动物园（术士）'
		tc.font = 0x63180000
		tc.style = 2
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='动物园（术士）'
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
	tc.name = 'StartGame'
	tc.left = 274.000
	tc.right = 430.000
	tc.bottom = -321.000
	tc.top = -165.000
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
		tc.img = 0x562c0001
		tp = tc
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.visible = false
		tc.color = 0x0
		tc.text = '开始'
		tc.font = 0x63200041
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='开始'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =1445724162.000
	com['color_normal'] =16777215.000
	com['img_hover'] =nil
	com['color_hover'] =nil
	com['audio_hover'] =nil
	com['img_press'] =1445724161.000
	com['frameList_press'] =nil
	com['color_press'] =nil
	com['audio_press'] =nil
	com['img_disable'] =nil
	com['color_disable'] =nil
	com['img_toggle'] =1445724161.000
	com['color_toggle'] =nil
	com['img_togEx'] =nil
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'Prepare'
	tc.left = 274.000
	tc.right = 430.000
	tc.bottom = -321.000
	tc.top = -165.000
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
		tc.img = 0x562c0001
		tp = tc
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.visible = false
		tc.color = 0x0
		tc.text = '准备'
		tc.font = 0x63200041
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='准备'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =1445724162.000
	com['color_normal'] =16777215.000
	com['img_hover'] =nil
	com['color_hover'] =nil
	com['audio_hover'] =nil
	com['img_press'] =1445724161.000
	com['frameList_press'] =nil
	com['color_press'] =nil
	com['audio_press'] =nil
	com['img_disable'] =nil
	com['color_disable'] =nil
	com['img_toggle'] =1445724161.000
	com['color_toggle'] =nil
	com['img_togEx'] =nil
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'Quit'
	tc.left = 453.333
	tc.right = 613.333
	tc.bottom = -324.000
	tc.top = -276.000
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
		tc.text = '退出'
		tc.font = 0x63200041
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='退出'
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
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'RoomMember'
	tc.left = -50.000
	tc.right = 50.000
	tc.bottom = -50.000
	tc.top = 50.000
	tp = tc
	tp.c_layout_h = setmetatable({}, c_layout_h)
	com = tp.c_layout_h
	com['alignment_h'] =1.000
	com['alignment_v'] =1.000
	com['RowSpace'] =10.000
	com['StartX'] =0.000
	com['changePivot'] =false
	com['changeAnchor'] =false
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'Info'
	tc.left = -630.500
	tc.right = -331.500
	tc.bottom = -352.000
	tc.top = -16.000
	tc.mouseEnabled = true
	tc.img = 0x56000001
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
		tc.right = 413.000
		tc.top = 0.000
		tc.anchor = 0x64640000
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = 'TextTemplate'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.left = 10.000
			tc.right = 289.000
			tc.bottom = -20.000
			tc.top = 0.000
			tc.anchor = 0x64640000
			tc.visible = false
			tc.color = 0x0
			tc.text = '123'
			tc.wrap = true
			tc.font = 0x63140000
			tc.align = 4
			tp = tc
			tp.c_mintextquadsize = setmetatable({}, c_mintextquadsize)
			com = tp.c_mintextquadsize
			com['minWidth'] =0.000
			com['autowidth'] =false
			tp = tp.parent
			--end
		tp.c_layout_v = setmetatable({}, c_layout_v)
		com = tp.c_layout_v
		com['alignment_h'] =0.000
		com['alignment_v'] =0.000
		com['ColSpace'] =10.000
		com['startSpaceX'] =10.000
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
			tc.bottom = -306.783
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
	com['hideSlider'] =false
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'DeckList'
	tc.left = -630.000
	tc.right = -410.000
	tc.bottom = -301.500
	tc.top = 141.500
	tc.mouseEnabled = true
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'Background'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
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
		tc.right = 220.000
		tc.top = 0.000
		tc.anchor = 0x64640000
		tp = tc
		tp.c_layout_v = setmetatable({}, c_layout_v)
		com = tp.c_layout_v
		com['alignment_h'] =1.000
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
	com['hideSlider'] =false
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'ModeList'
	tc.left = -630.000
	tc.right = -410.000
	tc.bottom = -237.500
	tc.top = 205.500
	tc.mouseEnabled = true
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'Background'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
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
		tc.right = 220.000
		tc.top = 0.000
		tc.anchor = 0x64640000
		tp = tc
		tp.c_layout_v = setmetatable({}, c_layout_v)
		com = tp.c_layout_v
		com['alignment_h'] =1.000
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
	com['hideSlider'] =false
	tp = tp.parent
	--end
tp.c_room = setmetatable({}, c_room)

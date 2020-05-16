--[[0

]]
local G = require 'gf'
local c_room = require 'c_room'
local c_layout_h = require 'c_layout_h'
local c_scrollview = require 'c_scrollview'
local c_perfectsize = require 'c_perfectsize'
local c_button = require 'c_button'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_layout_v = require 'c_layout_v'
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
	tc.left = -242.500
	tc.right = -47.500
	tc.bottom = 326.333
	tc.top = 356.333
	tp = tc
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'IPText'
		tc.left = -97.500
		tc.right = 97.500
		tc.bottom = -15.000
		tc.top = 15.000
		tc.color = 0x0
		tc.text = '192.168.215.114:nil'
		tc.font = 0x63140000
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'GameMode'
	tc.left = 302.000
	tc.right = 410.000
	tc.bottom = 166.000
	tc.top = 210.000
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
		tc.visible = false
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
		tc.text = '1v1'
		tc.font = 0x62100000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='1v1'
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
	tc.name = 'DeckInfo'
	tc.left = 296.000
	tc.right = 420.000
	tc.bottom = 74.000
	tc.top = 110.000
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
		tc.visible = false
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
		tc.text = '动物园术士'
		tc.font = 0x62100000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='动物园术士'
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
	tc.name = 'IDMode'
	tc.left = 297.000
	tc.right = 421.000
	tc.bottom = -23.000
	tc.top = 13.000
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
		tc.visible = false
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
		tc.text = '随机身份 '
		tc.font = 0x62100000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='随机身份 '
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
		tc.img = 0x562c0002
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
	com['color_normal'] =nil
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
		tc.img = 0x562c0002
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
	com['color_normal'] =nil
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
	tc.left = 549.333
	tc.right = 629.333
	tc.bottom = -350.000
	tc.top = -292.000
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
		tc.img = 0x562a0006
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
		tc.text = '退出'
		tc.font = 0x65180000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='退出'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =1445593094.000
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
	tc.name = 'Info'
	tc.left = -396.500
	tc.right = 76.500
	tc.bottom = -285.000
	tc.top = -203.000
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
		tc.right = 473.000
		tc.top = 0.000
		tc.anchor = 0x64640000
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = 'TextTemplate'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.left = 10.000
			tc.right = 410.000
			tc.bottom = -16.000
			tc.top = 0.000
			tc.anchor = 0x64640000
			tc.visible = false
			tc.color = 0x0
			tc.text = '123'
			tc.wrap = true
			tc.font = 0x63100000
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
			com['color_normal'] =nil
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
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'DeckList'
	tc.left = 250.000
	tc.right = 470.000
	tc.bottom = -282.500
	tc.top = 42.500
	tc.mouseEnabled = true
	tc.visible = false
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'Background'
		tc.left = -20.000
		tc.right = 20.000
		tc.bottom = -20.000
		tc.top = 20.000
		tc.anchor = 0x64006400
		tc.img = 0x56290007
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
			com['color_normal'] =nil
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
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'ModeList'
	tc.left = 250.000
	tc.right = 470.000
	tc.bottom = -182.500
	tc.top = 142.500
	tc.mouseEnabled = true
	tc.visible = false
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'Background'
		tc.left = -20.000
		tc.right = 20.000
		tc.bottom = -20.000
		tc.top = 20.000
		tc.anchor = 0x64006400
		tc.img = 0x56290007
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
			com['color_normal'] =nil
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
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'RoomMember'
	tc.left = -413.500
	tc.right = 153.500
	tc.bottom = -121.000
	tc.top = 271.000
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
		tc.right = 0.000
		tc.bottom = -392.000
		tc.top = 0.000
		tc.anchor = 0x64640000
		tp = tc
		tp.c_layout_h = setmetatable({}, c_layout_h)
		com = tp.c_layout_h
		com['alignment_h'] =0.000
		com['alignment_v'] =1.000
		com['RowSpace'] =10.000
		com['StartX'] =0.000
		com['changePivot'] =false
		com['changeAnchor'] =false
		tp.c_perfectsize = setmetatable({}, c_perfectsize)
		com = tp.c_perfectsize
		com['height'] =false
		com['expheight'] =nil
		com['minheight'] =nil
		com['width'] =true
		com['expwidth'] =0.000
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
			com['color_normal'] =nil
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
	com['Horizontal'] =true
	com['Vertical'] =false
	com['Sensitivity'] =10.000
	com['type'] =0.000
	com['autoMove'] =false
	com['hideSlider'] =false
	tp = tp.parent
	--end
tp.c_room = setmetatable({}, c_room)

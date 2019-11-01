--[[0

]]
local G = require 'gf'
local c_layout_h = require 'c_layout_h'
local c_card_manager = require 'c_card_manager'
local c_scrollview = require 'c_scrollview'
local c_button = require 'c_button'
local c_perfectsize = require 'c_perfectsize'
local c_layout_v = require 'c_layout_v'
local c_collection = require 'c_collection'
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
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = 'CardCollection'
		tc.left = -475.000
		tc.right = 475.000
		tc.bottom = -250.000
		tc.top = 250.000
		tp = tc
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = 'Card1'
			tc.left = -370.000
			tc.right = -270.000
			tc.bottom = 85.000
			tc.top = 185.000
			tc.visible = false
			tp = tc
				tc = G.loadUI('v_card_manager')
				tc.prefab = true
				tp.addChild(tc)
				tc.name = 'Card'
				tc.left = -640.000
				tc.right = 640.000
				tc.bottom = -360.000
				tc.top = 360.000
				tc.scaleX = 0.500
				tc.scaleY = 0.500
				tp = tc
				tp.c_card_manager = setmetatable({}, c_card_manager)
				tp = tp.parent
				--end
			tp = tp.parent
			--end
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = 'Card2'
			tc.left = -170.000
			tc.right = -70.000
			tc.bottom = 85.000
			tc.top = 185.000
			tc.visible = false
			tp = tc
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = 'Card'
				tc.left = -640.000
				tc.right = 640.000
				tc.bottom = -360.000
				tc.top = 360.000
				tc.scaleX = 0.500
				tc.scaleY = 0.500
				tp = tc
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡背框'
					tc.right = 0.000
					tc.top = 0.000
					tp = tc
						tc = G.Quad()
						tp.addChild(tc)
						tc.name = '卡背'
						tc.left = -163.500
						tc.right = 163.500
						tc.bottom = -236.000
						tc.top = 236.000
						tc.img = 0x5601000a
						tp = tc
						tp = tp.parent
						--end
					tp = tp.parent
					--end
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡片实例'
					tc.left = -50.000
					tc.right = 50.000
					tc.bottom = -50.000
					tc.top = 50.000
					tp = tc
					tp = tp.parent
					--end
				tp.c_card_manager = setmetatable({}, c_card_manager)
				tp = tp.parent
				--end
			tp = tp.parent
			--end
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = 'Card3'
			tc.left = 30.000
			tc.right = 130.000
			tc.bottom = 85.000
			tc.top = 185.000
			tc.visible = false
			tp = tc
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = 'Card'
				tc.left = -640.000
				tc.right = 640.000
				tc.bottom = -360.000
				tc.top = 360.000
				tc.scaleX = 0.500
				tc.scaleY = 0.500
				tp = tc
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡背框'
					tc.right = 0.000
					tc.top = 0.000
					tp = tc
						tc = G.Quad()
						tp.addChild(tc)
						tc.name = '卡背'
						tc.left = -163.500
						tc.right = 163.500
						tc.bottom = -236.000
						tc.top = 236.000
						tc.img = 0x5601000a
						tp = tc
						tp = tp.parent
						--end
					tp = tp.parent
					--end
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡片实例'
					tc.left = -50.000
					tc.right = 50.000
					tc.bottom = -50.000
					tc.top = 50.000
					tp = tc
					tp = tp.parent
					--end
				tp.c_card_manager = setmetatable({}, c_card_manager)
				tp = tp.parent
				--end
			tp = tp.parent
			--end
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = 'Card4'
			tc.left = 230.000
			tc.right = 330.000
			tc.bottom = 85.000
			tc.top = 185.000
			tc.visible = false
			tp = tc
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = 'Card'
				tc.left = -640.000
				tc.right = 640.000
				tc.bottom = -360.000
				tc.top = 360.000
				tc.scaleX = 0.500
				tc.scaleY = 0.500
				tp = tc
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡背框'
					tc.right = 0.000
					tc.top = 0.000
					tp = tc
						tc = G.Quad()
						tp.addChild(tc)
						tc.name = '卡背'
						tc.left = -163.500
						tc.right = 163.500
						tc.bottom = -236.000
						tc.top = 236.000
						tc.img = 0x5601000a
						tp = tc
						tp = tp.parent
						--end
					tp = tp.parent
					--end
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡片实例'
					tc.left = -50.000
					tc.right = 50.000
					tc.bottom = -50.000
					tc.top = 50.000
					tp = tc
					tp = tp.parent
					--end
				tp.c_card_manager = setmetatable({}, c_card_manager)
				tp = tp.parent
				--end
			tp = tp.parent
			--end
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = 'Card5'
			tc.left = -370.000
			tc.right = -270.000
			tc.bottom = -185.000
			tc.top = -85.000
			tc.visible = false
			tp = tc
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = 'Card'
				tc.left = -640.000
				tc.right = 640.000
				tc.bottom = -360.000
				tc.top = 360.000
				tc.scaleX = 0.500
				tc.scaleY = 0.500
				tp = tc
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡背框'
					tc.right = 0.000
					tc.top = 0.000
					tp = tc
						tc = G.Quad()
						tp.addChild(tc)
						tc.name = '卡背'
						tc.left = -163.500
						tc.right = 163.500
						tc.bottom = -236.000
						tc.top = 236.000
						tc.img = 0x5601000a
						tp = tc
						tp = tp.parent
						--end
					tp = tp.parent
					--end
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡片实例'
					tc.left = -50.000
					tc.right = 50.000
					tc.bottom = -50.000
					tc.top = 50.000
					tp = tc
					tp = tp.parent
					--end
				tp.c_card_manager = setmetatable({}, c_card_manager)
				tp = tp.parent
				--end
			tp = tp.parent
			--end
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = 'Card6'
			tc.left = -170.000
			tc.right = -70.000
			tc.bottom = -185.000
			tc.top = -85.000
			tc.visible = false
			tp = tc
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = 'Card'
				tc.left = -640.000
				tc.right = 640.000
				tc.bottom = -360.000
				tc.top = 360.000
				tc.scaleX = 0.500
				tc.scaleY = 0.500
				tp = tc
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡背框'
					tc.right = 0.000
					tc.top = 0.000
					tp = tc
						tc = G.Quad()
						tp.addChild(tc)
						tc.name = '卡背'
						tc.left = -163.500
						tc.right = 163.500
						tc.bottom = -236.000
						tc.top = 236.000
						tc.img = 0x5601000a
						tp = tc
						tp = tp.parent
						--end
					tp = tp.parent
					--end
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡片实例'
					tc.left = -50.000
					tc.right = 50.000
					tc.bottom = -50.000
					tc.top = 50.000
					tp = tc
					tp = tp.parent
					--end
				tp.c_card_manager = setmetatable({}, c_card_manager)
				tp = tp.parent
				--end
			tp = tp.parent
			--end
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = 'Card7'
			tc.left = 30.000
			tc.right = 130.000
			tc.bottom = -185.000
			tc.top = -85.000
			tc.visible = false
			tp = tc
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = 'Card'
				tc.left = -640.000
				tc.right = 640.000
				tc.bottom = -360.000
				tc.top = 360.000
				tc.scaleX = 0.500
				tc.scaleY = 0.500
				tp = tc
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡背框'
					tc.right = 0.000
					tc.top = 0.000
					tp = tc
						tc = G.Quad()
						tp.addChild(tc)
						tc.name = '卡背'
						tc.left = -163.500
						tc.right = 163.500
						tc.bottom = -236.000
						tc.top = 236.000
						tc.img = 0x5601000a
						tp = tc
						tp = tp.parent
						--end
					tp = tp.parent
					--end
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡片实例'
					tc.left = -50.000
					tc.right = 50.000
					tc.bottom = -50.000
					tc.top = 50.000
					tp = tc
					tp = tp.parent
					--end
				tp.c_card_manager = setmetatable({}, c_card_manager)
				tp = tp.parent
				--end
			tp = tp.parent
			--end
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = 'Card8'
			tc.left = 230.000
			tc.right = 330.000
			tc.bottom = -185.000
			tc.top = -85.000
			tc.visible = false
			tp = tc
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = 'Card'
				tc.left = -640.000
				tc.right = 640.000
				tc.bottom = -360.000
				tc.top = 360.000
				tc.scaleX = 0.500
				tc.scaleY = 0.500
				tp = tc
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡背框'
					tc.right = 0.000
					tc.top = 0.000
					tp = tc
						tc = G.Quad()
						tp.addChild(tc)
						tc.name = '卡背'
						tc.left = -163.500
						tc.right = 163.500
						tc.bottom = -236.000
						tc.top = 236.000
						tc.img = 0x5601000a
						tp = tc
						tp = tp.parent
						--end
					tp = tp.parent
					--end
					tc = G.Entity()
					tp.addChild(tc)
					tc.name = '卡片实例'
					tc.left = -50.000
					tc.right = 50.000
					tc.bottom = -50.000
					tc.top = 50.000
					tp = tc
					tp = tp.parent
					--end
				tp.c_card_manager = setmetatable({}, c_card_manager)
				tp = tp.parent
				--end
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = 'LastPage'
		tc.pivotX = 1.000
		tc.pivotY = 0.000
		tc.left = -204.000
		tc.right = -120.000
		tc.bottom = -50.000
		tc.top = 0.000
		tc.anchor = 0x6464
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
			tc.text = '上一页'
			tc.font = 0x65140000
			tp = tc
			tp = tp.parent
			--end
		tp.c_button = setmetatable({}, c_button)
		com = tp.c_button
		com['text'] ='上一页'
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
		tc.name = 'NextPage'
		tc.pivotX = 1.000
		tc.pivotY = 0.000
		tc.left = -104.000
		tc.right = -20.000
		tc.bottom = -50.000
		tc.top = 0.000
		tc.anchor = 0x6464
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
			tc.text = '下一页'
			tc.font = 0x65140000
			tp = tc
			tp = tp.parent
			--end
		tp.c_button = setmetatable({}, c_button)
		com = tp.c_button
		com['text'] ='下一页'
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
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'DeckList'
	tc.pivotX = 1.000
	tc.left = -260.000
	tc.right = -10.000
	tc.bottom = -255.000
	tc.top = 295.000
	tc.anchor = 0x32326464
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
		tc.name = 'DeckScrollView'
		tc.left = -125.000
		tc.right = 125.000
		tc.bottom = -275.000
		tc.top = 275.000
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
			tc.right = 250.000
			tc.bottom = -100.000
			tc.top = 0.000
			tc.anchor = 0x64640000
			tp = tc
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = 'DeckInfo'
				tc.pivotX = 0.000
				tc.pivotY = 1.000
				tc.left = 2.500
				tc.right = 247.500
				tc.bottom = -100.000
				tc.top = 0.000
				tc.anchor = 0x64640000
				tc.mouseEnabled = true
				tp = tc
					tc = G.Quad()
					tp.addChild(tc)
					tc.name = 'Background'
					tc.right = 0.000
					tc.top = 0.000
					tc.anchor = 0x64006400
					tc.mouseEnabled = true
					tc.color = 0x939393
					tc.img = 0x56000001
					tp = tc
					tp = tp.parent
					--end
					tc = G.TextQuad()
					tp.addChild(tc)
					tc.name = 'DeckName'
					tc.left = -100.000
					tc.bottom = -50.000
					tc.top = 50.000
					tc.text = '威兹班套牌'
					tc.font = 0x65200041
					tp = tc
					tp = tp.parent
					--end
				tp = tp.parent
				--end
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
		com['hideSlider'] =true
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'ReturnButton'
	tc.pivotX = 1.000
	tc.pivotY = 0.000
	tc.left = -84.000
	tc.right = 0.000
	tc.top = 50.000
	tc.anchor = 0x6464
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
		tc.text = '返回'
		tc.font = 0x65140000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='返回'
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
tp.c_collection = setmetatable({}, c_collection)

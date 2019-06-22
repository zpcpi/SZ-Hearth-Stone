--[[2004

]]
local G = require 'gf'
local c_scrollview = require 'c_scrollview'
local c_button = require 'c_button'
local c_layout_v = require 'c_layout_v'
local c_cheat_system = require 'c_cheat_system'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_cheat_system'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tc.mouseEnabled = true
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '作弊界面'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -0.500
		tc.right = 0.500
		tc.bottom = -0.500
		tc.top = 0.500
		tc.anchor = 0x64006400
		tc.alpha = 133
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = 'initlist'
		tc.pivotX = 0.000
		tc.pivotY = 1.000
		tc.right = 750.000
		tc.bottom = -670.000
		tc.top = 0.000
		tc.anchor = 0x64640000
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '说明'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.right = 0.000
			tc.bottom = -30.000
			tc.top = 0.000
			tc.anchor = 0x64646400
			tc.color = 0x0
			tc.text = '输入函数名执行对应函数，使用“空格”分隔输入参数'
			tc.wrap = true
			tc.align = 4
			tc.lineSpace = 10
			tc.alignOffset = 16
			tp = tc
			tp = tp.parent
			--end
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '提示信息'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.right = 0.000
			tc.bottom = -60.000
			tc.top = -30.000
			tc.anchor = 0x64646400
			tc.text = '[Ctrl + ↑ / ↓] 指令翻动  [Ctrl + ← / → ] 选参'
			tc.wrap = true
			tc.align = 4
			tc.alignOffset = 16
			tc.style = 10
			tp = tc
			tp = tp.parent
			--end
			tc = G.loadUI('v_scrollview')
			tp.addChild(tc)
			tc.name = '作弊条目面板'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.left = 0.000
			tc.right = 0.000
			tc.bottom = -670.000
			tc.top = -75.000
			tc.anchor = 0x64646400
			tp = tc
				tc = tp.getChildByName('content')
				if tc then
				tc.right = 0.000
				tc.anchor = 0x64006400
				tp = tc
				tp.c_layout_v = setmetatable({}, c_layout_v)
				com = tp.c_layout_v
				com['alignment_h'] =0.000
				com['alignment_v'] =0.000
				com['ColSpace'] =5.000
				com['startSpaceX'] =0.000
				com['startSpaceY'] =0.000
				com['changePivot'] =false
				com['changeAnchor'] =true
				tp = tp.parent
				end
				--end
			com = tp.c_scrollview
			com['type'] =1.000
			com['autoMove'] =false
			com['hideSlider'] =false
			tp = tp.parent
			--end
			tc = G.loadUI('v_button')
			tp.addChild(tc)
			tc.name = '作弊条目'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.right = 200.000
			tc.bottom = -125.000
			tc.top = -75.000
			tc.anchor = 0x64640000
			tc.visible = false
			tc.alpha = 250
			tp = tc
				tc = tp.getChildByName('img')
				if tc then
				tc.img = 0x56220008
				tp = tc
				tp = tp.parent
				end
				--end
				tc = tp.getChildByName('text')
				if tc then
				tc.text = '按钮'
				tp = tc
				tp = tp.parent
				end
				--end
				tc = G.Quad()
				tp.addChild(tc)
				tc.name = '背景'
				tc.left = 120.000
				tc.right = 520.000
				tc.bottom = -25.000
				tc.top = 25.000
				tc.color = 0x797979
				tc.img = 0x56000001
				tp = tc
				tp = tp.parent
				--end
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '参数'
				tc.left = 120.000
				tc.right = 520.000
				tc.bottom = -25.000
				tc.top = 25.000
				tc.mouseEnabled = true
				tc.text = '参数'
				tc.readOnly = false
				tc.font = 0x61200041
				tc.align = 4
				tc.style = 2
				tp = tc
				tp = tp.parent
				--end
			com = tp.c_button
			com['customsize'] =true
			com['img_normal'] =1445068808.000
			com['img_hover'] =1445068809.000
			com['color_hover'] =255.000
			com['img_press'] =1445068810.000
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.loadUI('v_scrollview')
		tp.addChild(tc)
		tc.name = 'cheatlist'
		tc.pivotX = 1.000
		tc.pivotY = 1.000
		tc.left = -450.000
		tc.right = 0.000
		tc.bottom = -670.000
		tc.top = 0.000
		tc.anchor = 0x64646464
		tp = tc
			tc = tp.getChildByName('content')
			if tc then
			tc.right = 0.000
			tc.anchor = 0x64006400
			tp = tc
			tp.c_layout_v = setmetatable({}, c_layout_v)
			com = tp.c_layout_v
			com['alignment_h'] =0.000
			com['alignment_v'] =0.000
			com['ColSpace'] =1.000
			com['startSpaceX'] =0.000
			com['startSpaceY'] =0.000
			com['changePivot'] =false
			com['changeAnchor'] =true
			tp = tp.parent
			end
			--end
			tc = G.loadUI('v_button')
			tp.addChild(tc)
			tc.name = '作弊指令'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.right = 0.000
			tc.bottom = -30.000
			tc.top = 0.000
			tc.anchor = 0x64646400
			tc.visible = false
			tp = tc
				tc = tp.getChildByName('img')
				if tc then
				tc.img = 0x56160010
				tp = tc
				tp = tp.parent
				end
				--end
				tc = tp.getChildByName('text')
				if tc then
				tc.pivotX = 0.000
				tc.font = 0x60120000
				tc.align = 4
				tc.alignOffset = 40
				tp = tc
				tp = tp.parent
				end
				--end
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = 'text_count'
				tc.pivotX = 0.000
				tc.right = 0.000
				tc.top = 0.000
				tc.anchor = 0x64006400
				tc.color = 0xff
				tc.align = 4
				tp = tc
				tp = tp.parent
				--end
			com = tp.c_button
			com['customsize'] =true
			com['img_normal'] =1444282384.000
			com['img_hover'] =1444282370.000
			com['color_hover'] =255.000
			com['img_press'] =1444282384.000
			tp = tp.parent
			--end
		com = tp.c_scrollview
		com['type'] =1.000
		com['autoMove'] =false
		com['hideSlider'] =false
		tp = tp.parent
		--end
		tc = G.loadUI('v_button')
		tp.addChild(tc)
		tc.name = '输入框'
		tc.pivotX = 0.000
		tc.pivotY = 0.000
		tc.right = 0.000
		tc.top = 45.000
		tc.anchor = 0x6400
		tp = tc
			tc = tp.getChildByName('img')
			if tc then
			tc.img = 0x56160010
			tp = tc
			tp = tp.parent
			end
			--end
			tc = tp.getChildByName('text')
			if tc then
			tc.pivotX = 0.000
			tc.font = 0x60120000
			tc.align = 4
			tc.alignOffset = 40
			tp = tc
			tp = tp.parent
			end
			--end
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = 'cheat'
			tc.pivotX = 0.000
			tc.right = 0.000
			tc.top = 0.000
			tc.anchor = 0x64006400
			tc.color = 0x0
			tc.font = 0x60280000
			tc.align = 4
			tp = tc
			tp = tp.parent
			--end
		com = tp.c_button
		com['customsize'] =true
		com['img_normal'] =1444282384.000
		com['img_hover'] =1444282370.000
		com['color_hover'] =255.000
		com['img_press'] =1444282384.000
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_cheat_system = setmetatable({}, c_cheat_system)

--[[2003

]]
local G = require 'gf'
local c_layout_v = require 'c_layout_v'
local c_button = require 'c_button'
local c_scrollview = require 'c_scrollview'
local c_dialogue_system_select = require 'c_dialogue_system_select'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_dialogue_system_select'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.loadUI('v_scrollview')
	tp.addChild(tc)
	tc.name = '选项'
	tc.left = -565.000
	tc.right = 37.000
	tc.bottom = -151.500
	tc.top = 291.500
	tp = tc
		tc = tp.getChildByName('content')
		if tc then
		tp = tc
		tp.c_layout_v = setmetatable({}, c_layout_v)
		com = tp.c_layout_v
		com['alignment_h'] =0.000
		com['alignment_v'] =1.000
		com['ColSpace'] =10.000
		com['startSpaceX'] =0.000
		com['startSpaceY'] =0.000
		com['changePivot'] =false
		com['changeAnchor'] =false
		end
		tp = tp.parent
		--end
	com = tp.c_scrollview
	com['autoMove'] =false
	com['hideSlider'] =false
	tp = tp.parent
	--end
	tc = G.loadUI('v_button')
	tp.addChild(tc)
	tc.name = '选项原型'
	tc.pivotX = 0.000
	tc.pivotY = 1.000
	tc.right = 602.000
	tc.bottom = -52.000
	tc.top = 0.000
	tc.anchor = 0x64640000
	tc.visible = false
	tp = tc
		tc = tp.getChildByName('img')
		if tc then
		tc.img = 0x56010001
		tp = tc
		end
		tp = tp.parent
		--end
		tc = tp.getChildByName('text')
		if tc then
		tc.left = 60.000
		tc.right = -160.000
		tc.bottom = 10.000
		tc.top = -10.000
		tc.text = '123'
		tc.font = 0x61180000
		tp = tc
		end
		tp = tp.parent
		--end
	com = tp.c_button
	com['text'] ='123'
	com['img_normal'] =1442906113.000
	com['img_hover'] =1442906117.000
	com['img_press'] =1442906118.000
	tp = tp.parent
	--end
tp.c_dialogue_system_select = setmetatable({}, c_dialogue_system_select)

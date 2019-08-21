--[[0

]]
local G = require 'gf'
local c_button = require 'c_button'
local c_room_member = require 'c_room_member'
local c_room = require 'c_room'
local c_layout_h = require 'c_layout_h'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_room'
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
	tc.color = 0x909090
	tc.img = 0x56000001
	tp = tc
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
		tc.bottom = -50.000
		tc.top = 50.000
		tc.text = 'IP地址'
		tc.font = 0x63200041
		tp = tc
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'IPText'
		tc.left = 14.000
		tc.right = 214.000
		tc.bottom = -50.000
		tc.top = 50.000
		tc.text = '127.0.0.1'
		tc.font = 0x63200041
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'GameMode'
	tc.left = -625.000
	tc.right = -465.000
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
	tc.name = 'StartGame'
	tc.left = 453.333
	tc.right = 613.333
	tc.bottom = -244.000
	tc.top = -196.000
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
	tc.name = 'Prepare'
	tc.left = 453.333
	tc.right = 613.333
	tc.bottom = -244.000
	tc.top = -196.000
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
		tc = G.loadUI('v_room_member')
		tc.prefab = true
		tp.addChild(tc)
		tc.name = 'Self'
		tc.pivotX = 0.000
		tc.pivotY = 1.000
		tc.left = -219.000
		tc.right = 41.000
		tc.bottom = -250.000
		tc.top = 150.000
		tc.anchor = 0x64640000
		tp = tc
		tp.c_room_member = setmetatable({}, c_room_member)
		tp = tp.parent
		--end
		tc = G.loadUI('v_room_member')
		tc.prefab = true
		tp.addChild(tc)
		tc.name = 'Enemy'
		tc.pivotX = 0.000
		tc.pivotY = 1.000
		tc.left = 51.000
		tc.right = 319.000
		tc.bottom = -250.000
		tc.top = 150.000
		tc.anchor = 0x64640000
		tp = tc
		tp.c_room_member = setmetatable({}, c_room_member)
		tp = tp.parent
		--end
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
tp.c_room = setmetatable({}, c_room)

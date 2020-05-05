--[[0

]]
local G = require 'gf'
local c_connect = require 'c_connect'
local c_button = require 'c_button'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_connect'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'Background'
	tc.left = -278.000
	tc.right = 278.000
	tc.bottom = -185.000
	tc.top = 185.000
	tc.img = 0x56290004
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'InputFieldBackground'
	tc.left = -194.500
	tc.right = 194.500
	tc.bottom = 12.000
	tc.top = 80.000
	tc.img = 0x56290006
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'IPAddress'
	tc.left = -173.500
	tc.right = 173.500
	tc.bottom = 27.500
	tc.top = 66.500
	tc.mouseEnabled = true
	tc.text = '127.0.0.1'
	tc.readOnly = false
	tc.font = 0x62200041
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'ConnectStatus'
	tc.left = -173.500
	tc.right = 173.500
	tc.bottom = 27.500
	tc.top = 66.500
	tc.visible = false
	tc.text = '正在连接......'
	tc.wrap = true
	tc.readOnly = false
	tc.font = 0x62200041
	tp = tc
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'Connect'
	tc.left = -180.000
	tc.right = -20.000
	tc.bottom = -99.000
	tc.top = -51.000
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
		tc.img = 0x56290001
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
		tc.text = '连接'
		tc.font = 0x621a0000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='连接'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =1445527553.000
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
	tc.name = 'Cancel'
	tc.left = 20.000
	tc.right = 180.000
	tc.bottom = -99.000
	tc.top = -51.000
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
		tc.img = 0x56290001
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
		tc.text = '取消'
		tc.font = 0x621a0000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='取消'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =1445527553.000
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
	tc.name = 'CancelConnect'
	tc.left = -80.000
	tc.right = 80.000
	tc.bottom = -88.000
	tc.top = -40.000
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
		tc.text = '取消连接'
		tc.font = 0x63200041
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='取消连接'
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
tp.c_connect = setmetatable({}, c_connect)

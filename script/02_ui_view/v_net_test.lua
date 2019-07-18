--[[0

]]
local G = require 'gf'
local c_net_test = require 'c_net_test'
local c_button = require 'c_button'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_net_test'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'bg'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tc.color = 0x2e9f64
	tc.img = 0x56000001
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'ConnectIP'
	tc.pivotX = 0.000
	tc.left = 177.000
	tc.right = 535.000
	tc.bottom = 233.000
	tc.top = 279.000
	tc.img = 0x56000001
	tp = tc
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.mouseEnabled = true
		tc.color = 0x0
		tc.text = '123'
		tc.readOnly = false
		tc.font = 0x60200041
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'IPTitle'
	tc.pivotX = 0.000
	tc.left = 177.000
	tc.right = 270.000
	tc.bottom = 290.000
	tc.top = 322.000
	tc.color = 0x0
	tc.autosize = 3
	tc.text = 'IP地址'
	tc.font = 0x60200041
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'ConnectPort'
	tc.pivotX = 0.000
	tc.left = 177.000
	tc.right = 535.000
	tc.bottom = 83.000
	tc.top = 129.000
	tc.img = 0x56000001
	tp = tc
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.mouseEnabled = true
		tc.color = 0x0
		tc.text = '123'
		tc.readOnly = false
		tc.font = 0x60200041
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'PortTitle'
	tc.pivotX = 0.000
	tc.left = 177.000
	tc.right = 273.000
	tc.bottom = 140.000
	tc.top = 172.000
	tc.color = 0x0
	tc.autosize = 3
	tc.text = '端口号'
	tc.font = 0x60200041
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'ConnectButton'
	tc.pivotX = 0.000
	tc.left = 177.000
	tc.right = 535.000
	tc.bottom = -16.000
	tc.top = 28.000
	tc.mouseEnabled = true
	tc.img = 0x56000001
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'img'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
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
		tc.text = 'Connect'
		tc.readOnly = false
		tc.font = 0x60200041
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='Connect'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =nil
	com['color_normal'] =16777215.000
	com['img_hover'] =nil
	com['color_hover'] =12040119.000
	com['audio_hover'] =nil
	com['img_press'] =nil
	com['frameList_press'] =nil
	com['color_press'] =5921370.000
	com['audio_press'] =nil
	com['img_disable'] =nil
	com['color_disable'] =nil
	com['img_toggle'] =nil
	com['color_toggle'] =nil
	com['img_togEx'] =nil
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'SelfIP'
	tc.pivotX = 0.000
	tc.left = -545.000
	tc.right = -452.000
	tc.bottom = 290.000
	tc.top = 322.000
	tc.color = 0x0
	tc.autosize = 3
	tc.text = 'IP地址'
	tc.font = 0x60200041
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'HostPort'
	tc.pivotX = 0.000
	tc.left = -545.000
	tc.right = -187.000
	tc.bottom = 184.000
	tc.top = 230.000
	tc.img = 0x56000001
	tp = tc
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.mouseEnabled = true
		tc.color = 0x0
		tc.text = '123'
		tc.readOnly = false
		tc.font = 0x60200041
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'HostPortTitle'
	tc.pivotX = 0.000
	tc.left = -545.000
	tc.right = -449.000
	tc.bottom = 241.000
	tc.top = 273.000
	tc.color = 0x0
	tc.autosize = 3
	tc.text = '端口号'
	tc.font = 0x60200041
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'HostButton'
	tc.pivotX = 0.000
	tc.left = -545.000
	tc.right = -187.000
	tc.bottom = 85.000
	tc.top = 129.000
	tc.mouseEnabled = true
	tc.img = 0x56000001
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'img'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
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
		tc.text = 'Host'
		tc.readOnly = false
		tc.font = 0x60200041
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='Host'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =nil
	com['color_normal'] =16777215.000
	com['img_hover'] =nil
	com['color_hover'] =12040119.000
	com['audio_hover'] =nil
	com['img_press'] =nil
	com['frameList_press'] =nil
	com['color_press'] =5921370.000
	com['audio_press'] =nil
	com['img_disable'] =nil
	com['color_disable'] =nil
	com['img_toggle'] =nil
	com['color_toggle'] =nil
	com['img_togEx'] =nil
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'ChatTitle'
	tc.pivotX = 0.000
	tc.left = -545.000
	tc.right = -417.000
	tc.bottom = -239.000
	tc.top = -207.000
	tc.color = 0x0
	tc.autosize = 3
	tc.text = '消息内容'
	tc.font = 0x60200041
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'ChatButton'
	tc.pivotX = 0.000
	tc.left = -113.000
	tc.right = 6.000
	tc.bottom = -302.000
	tc.top = -258.000
	tc.mouseEnabled = true
	tc.img = 0x56000001
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'img'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
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
		tc.text = 'Host'
		tc.readOnly = false
		tc.font = 0x60200041
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='Host'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =nil
	com['color_normal'] =16777215.000
	com['img_hover'] =nil
	com['color_hover'] =12040119.000
	com['audio_hover'] =nil
	com['img_press'] =nil
	com['frameList_press'] =nil
	com['color_press'] =5921370.000
	com['audio_press'] =nil
	com['img_disable'] =nil
	com['color_disable'] =nil
	com['img_toggle'] =nil
	com['color_toggle'] =nil
	com['img_togEx'] =nil
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'Chat'
	tc.pivotX = 0.000
	tc.left = -545.000
	tc.right = -187.000
	tc.bottom = -303.000
	tc.top = -257.000
	tc.img = 0x56000001
	tp = tc
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.color = 0x0
		tc.text = '123'
		tc.readOnly = false
		tc.font = 0x60200041
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_net_test = setmetatable({}, c_net_test)

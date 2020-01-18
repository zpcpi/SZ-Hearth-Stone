--[[0

]]
local G = require 'gf'
local c_common_popup = require 'c_common_popup'
local c_button = require 'c_button'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_common_popup'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'Background'
	tc.left = -256.000
	tc.right = 256.000
	tc.bottom = -128.000
	tc.top = 128.000
	tc.img = 0x56000001
	tp = tc
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'ConfirmButton'
	tc.left = -200.000
	tc.right = -100.000
	tc.bottom = -101.000
	tc.top = -69.000
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
		tp = tc
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.text = '确定'
		tc.font = 0x60140000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='确定'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =nil
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
	tc.name = 'CancelButton'
	tc.left = 100.000
	tc.right = 200.000
	tc.bottom = -101.000
	tc.top = -69.000
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
		tp = tc
		tp = tp.parent
		--end
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.text = '取消'
		tc.font = 0x60140000
		tp = tc
		tp = tp.parent
		--end
	tp.c_button = setmetatable({}, c_button)
	com = tp.c_button
	com['text'] ='取消'
	com['btn_class'] =nil
	com['customsize'] =true
	com['img_normal'] =nil
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
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'TextBackground'
	tc.left = -200.000
	tc.right = 200.000
	tc.bottom = -24.000
	tc.top = 104.000
	tc.img = 0x5601000d
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'Text'
	tc.left = -171.000
	tc.right = 171.000
	tc.bottom = -10.000
	tc.top = 90.000
	tc.text = '是否继续？'
	tc.wrap = true
	tc.font = 0x63180000
	tp = tc
	tp = tp.parent
	--end
tp.c_common_popup = setmetatable({}, c_common_popup)

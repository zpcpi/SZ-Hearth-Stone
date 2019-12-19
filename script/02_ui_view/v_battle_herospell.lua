--[[0

]]
local G = require 'gf'
local c_battle_herospell = require 'c_battle_herospell'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_herospell'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '卡牌框'
	tc.left = -50.000
	tc.right = 50.000
	tc.bottom = -50.000
	tc.top = 50.000
	tp = tc
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '原画组合'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tp = tc
			tc = G.Shape()
			tp.addChild(tc)
			tc.name = 'mask'
			tc.left = -86.000
			tc.right = 86.000
			tc.bottom = -65.500
			tc.top = 95.500
			tc.mask = 10
			tc.shapeimg = 0x5625000b
			tc.SetVertexBuf(35,{0.0,0.0,-69.5,11.5,-70.5,11.5,-68.5,-14.5,-62.5,-30.5,-57.5,-39.5,-33.5,-59.5,-26.5,-63.5,-19.5,-64.5,-19.5,-65.5,4.5,-66.5,20.5,-63.5,41.5,-52.5,57.5,-37.5,63.5,-24.5,69.5,-2.5,68.5,19.5,58.5,41.5,41.5,59.5,28.5,67.5,21.5,66.5,20.5,67.5,14.5,64.5,14.5,62.5,11.5,58.5,-14.5,58.5,-15.5,59.5,-19.5,59.5,-29.5,67.5,-33.5,65.5,-54.5,48.5,-66.5,28.5,-66.5,23.5,-68.5,21.5,-69.5,11.5}, {0,0},0xffffffff)
			tc.meshType = 6
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '原画'
			tc.left = -128.000
			tc.right = 128.000
			tc.bottom = -128.000
			tc.top = 128.000
			tc.anchor = 0x4b4b3232
			tc.scaleX = 0.680
			tc.scaleY = 0.680
			tc.mask = -10
			tc.img = 0x5601000c
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Shape()
		tp.addChild(tc)
		tc.name = 'mask'
		tc.left = -125.000
		tc.right = 131.000
		tc.bottom = -109.000
		tc.top = 147.000
		tc.mask = 10
		tc.shapeimg = 0x5625000c
		tc.SetVertexBuf(41,{0.0,0.0,-100.5,15.0,-101.5,15.0,-101.5,-14.0,-100.5,-14.0,-99.5,-23.0,-92.5,-44.0,-91.5,-44.0,-80.5,-63.0,-70.5,-75.0,-43.5,-93.0,-18.5,-101.0,-14.5,-101.0,-14.5,-102.0,12.5,-102.0,44.5,-92.0,72.5,-72.0,91.5,-43.0,99.5,-19.0,99.5,-14.0,100.5,-13.0,100.5,14.0,99.5,15.0,99.5,20.0,91.5,44.0,79.5,64.0,62.5,82.0,43.5,94.0,19.5,102.0,14.5,102.0,13.5,103.0,-14.5,103.0,-15.5,102.0,-20.5,102.0,-44.5,94.0,-63.5,82.0,-74.5,72.0,-80.5,65.0,-92.5,45.0,-100.5,21.0,-100.5,15.0}, {0,0},0xffffffff)
		tc.meshType = 6
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -123.000
		tc.right = 133.000
		tc.bottom = -104.000
		tc.top = 152.000
		tc.scaleX = 1.200
		tc.scaleY = 1.200
		tc.img = 0x5625000a
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '遮挡版'
		tc.left = -103.500
		tc.right = 99.500
		tc.bottom = -90.000
		tc.top = 120.000
		tc.visible = false
		tc.scaleX = 0.900
		tc.scaleY = 0.900
		tc.img = 0x56250009
		tp = tc
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '属性值组合'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '费用'
			tc.left = -60.308
			tc.right = 55.692
			tc.bottom = 79.769
			tc.top = 197.769
			tc.scaleX = 0.750
			tc.scaleY = 0.750
			tc.img = 0x560b0001
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '费用数值'
				tc.left = -19.071
				tc.right = 21.929
				tc.bottom = 13.929
				tc.top = 48.929
				tc.scaleX = 1.950
				tc.scaleY = 1.950
				tc.text = '2'
				tc.font = 0x63500000
				tc.style = 14
				tp = tc
				tp = tp.parent
				--end
			tp = tp.parent
			--end
		tp = tp.parent
		--end
	tp.c_battle_herospell = setmetatable({}, c_battle_herospell)
	com = tp.c_battle_herospell
	com['cost'] =nil
	com['used'] =nil
	tp = tp.parent
	--end

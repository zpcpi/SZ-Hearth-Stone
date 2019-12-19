--[[0

]]
local G = require 'gf'
local c_battle_weapon = require 'c_battle_weapon'
local c_mintextquadsize = require 'c_mintextquadsize'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_weapon'
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
			tc.left = -92.500
			tc.right = 92.500
			tc.bottom = -77.000
			tc.top = 107.000
			tc.scaleX = 1.250
			tc.scaleY = 1.250
			tc.mask = 10
			tc.shapeimg = 0x5625000f
			tc.SetVertexBuf(36,{0.0,0.0,-90.5,18.0,-91.5,18.0,-91.5,-12.0,-90.5,-12.0,-88.5,-28.0,-87.5,-28.0,-74.5,-53.0,-61.5,-68.0,-35.5,-85.0,-16.5,-89.0,-16.5,-90.0,15.5,-90.0,38.5,-83.0,60.5,-69.0,71.5,-56.0,79.5,-43.0,79.5,-44.0,88.5,-20.0,90.5,3.0,84.5,32.0,80.5,42.0,64.5,63.0,54.5,73.0,27.5,88.0,12.5,90.0,11.5,91.0,-16.5,91.0,-17.5,90.0,-26.5,89.0,-42.5,82.0,-45.5,82.0,-60.5,72.0,-70.5,62.0,-87.5,34.0,-90.5,18.0}, {0,0},0xffffffff)
			tc.meshType = 6
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '原画'
			tc.left = -256.000
			tc.right = 256.000
			tc.bottom = -256.000
			tc.top = 256.000
			tc.anchor = 0x46463232
			tc.scaleX = 0.480
			tc.scaleY = 0.480
			tc.img = 0x56010009
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -132.500
		tc.right = 122.500
		tc.bottom = -97.000
		tc.top = 143.000
		tc.scaleX = 1.250
		tc.scaleY = 1.250
		tc.img = 0x5625000d
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -102.500
		tc.right = 148.500
		tc.bottom = 24.000
		tc.top = 176.000
		tc.scaleX = 1.250
		tc.scaleY = 1.250
		tc.img = 0x560a000f
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '遮挡板'
		tc.left = -93.500
		tc.right = 91.500
		tc.bottom = -77.000
		tc.top = 107.000
		tc.visible = false
		tc.scaleX = 1.250
		tc.scaleY = 1.250
		tc.img = 0x5625000e
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
			tc.name = '攻击力'
			tc.left = -156.846
			tc.right = -50.846
			tc.bottom = -93.000
			tc.top = 13.000
			tc.visible = false
			tc.scaleX = 0.950
			tc.scaleY = 0.950
			tc.img = 0x560b0006
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '攻击力数值'
				tc.left = 3.000
				tc.right = 3.000
				tc.bottom = -8.815
				tc.top = 42.815
				tc.scaleX = 1.400
				tc.scaleY = 1.400
				tc.font = 0x63500000
				tc.style = 14
				tc.outColor = 0x1
				tp = tc
				tp.c_mintextquadsize = setmetatable({}, c_mintextquadsize)
				com = tp.c_mintextquadsize
				com['minWidth'] =0.000
				com['autowidth'] =true
				tp = tp.parent
				--end
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '生命值'
			tc.left = 147.039
			tc.right = 51.039
			tc.bottom = -88.962
			tc.top = 2.038
			tc.scaleX = 0.950
			tc.scaleY = 0.950
			tc.img = 0x560b0008
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '生命值数值'
				tc.left = 5.000
				tc.right = 5.000
				tc.bottom = -2.132
				tc.top = 32.868
				tc.scaleX = 1.400
				tc.scaleY = 1.400
				tc.font = 0x63500000
				tc.style = 14
				tc.outColor = 0x1
				tp = tc
				tp.c_mintextquadsize = setmetatable({}, c_mintextquadsize)
				com = tp.c_mintextquadsize
				com['minWidth'] =0.000
				com['autowidth'] =true
				tp = tp.parent
				--end
			tp = tp.parent
			--end
		tp = tp.parent
		--end
	tp.c_battle_weapon = setmetatable({}, c_battle_weapon)
	com = tp.c_battle_weapon
	com['atk'] =nil
	com['hp'] =nil
	com['used'] =nil
	tp = tp.parent
	--end

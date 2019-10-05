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
			tc.left = -182.500
			tc.right = 182.500
			tc.bottom = -256.000
			tc.top = 256.000
			tc.mask = 10
			tc.shapeimg = 0x560a0011
			tc.SetVertexBuf(37,{0.0,0.0,-111.0,110.0,-112.0,110.0,-110.0,79.0,-109.0,79.0,-105.0,60.0,-90.0,33.0,-72.0,13.0,-47.0,-3.0,-47.0,-4.0,-32.0,-9.0,-6.0,-14.0,11.0,-14.0,30.0,-11.0,55.0,-1.0,80.0,17.0,89.0,28.0,103.0,51.0,112.0,78.0,114.0,104.0,113.0,105.0,113.0,112.0,106.0,138.0,95.0,160.0,86.0,172.0,68.0,189.0,61.0,194.0,38.0,205.0,24.0,209.0,-6.0,212.0,-36.0,206.0,-59.0,195.0,-77.0,181.0,-84.0,174.0,-100.0,151.0,-109.0,128.0,-111.0,110.0}, {0,0},0xffffffff)
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
		tc.left = -250.000
		tc.right = 250.000
		tc.bottom = -353.500
		tc.top = 353.500
		tc.scaleX = 0.900
		tc.scaleY = 0.900
		tc.img = 0x560a000c
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -90.000
		tc.right = 166.000
		tc.bottom = 104.000
		tc.top = 264.000
		tc.scaleX = 0.900
		tc.scaleY = 0.900
		tc.img = 0x560a000f
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
			tc.left = -176.500
			tc.right = -77.500
			tc.bottom = -240.500
			tc.top = -127.500
			tc.scaleX = 0.950
			tc.scaleY = 0.950
			tc.img = 0x560b0003
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '攻击力数值'
				tc.left = -11.500
				tc.right = 23.500
				tc.bottom = -14.815
				tc.top = 36.815
				tc.scaleX = 1.400
				tc.scaleY = 1.400
				tc.text = '0'
				tc.font = 0x63500000
				tc.style = 14
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
			tc.left = 101.750
			tc.right = 173.250
			tc.bottom = -241.250
			tc.top = -128.750
			tc.scaleX = 0.950
			tc.scaleY = 0.950
			tc.img = 0x560b0002
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '生命值数值'
				tc.left = -19.447
				tc.right = 15.553
				tc.bottom = -6.132
				tc.top = 28.868
				tc.scaleX = 1.400
				tc.scaleY = 1.400
				tc.text = '4'
				tc.font = 0x63500000
				tc.style = 14
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
	tp = tp.parent
	--end

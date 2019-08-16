--[[2001

]]
local G = require 'gf'
local c_card_weapon = require 'c_card_weapon'
local c_mintextquadsize = require 'c_mintextquadsize'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_card_weapon'
tc.right = 0.000
tc.top = 0.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '卡背框'
	tc.right = 0.000
	tc.top = 0.000
	tc.visible = false
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
	tc.name = '卡牌框'
	tc.left = -182.500
	tc.right = 182.500
	tc.bottom = -256.000
	tc.top = 256.000
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
			tc.bottom = -153.000
			tc.top = 359.000
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
		tc.left = -183.500
		tc.right = 183.500
		tc.bottom = -256.000
		tc.top = 256.000
		tc.img = 0x560a000c
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '品质板'
		tc.left = -34.000
		tc.right = 30.000
		tc.bottom = -73.500
		tc.top = -28.500
		tc.img = 0x560a0012
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '品质宝石'
			tc.left = -14.000
			tc.right = 16.000
			tc.bottom = -29.000
			tc.top = 11.000
			tc.img = 0x560b0011
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -298.893
		tc.right = 296.893
		tc.bottom = -79.286
		tc.top = 27.286
		tc.scaleX = 0.560
		tc.scaleY = 0.560
		tc.img = 0x560a0001
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = -33.000
			tc.right = 33.000
			tc.bottom = 19.857
			tc.top = 19.857
			tc.anchor = 0x64003232
			tc.scaleX = 1.780
			tc.scaleY = 1.780
			tc.shadowX = 3
			tc.shadowY = -3
			tc.shadowAlpha = 255
			tc.text = '弑君'
			tc.font = 0x61200041
			tc.style = 13
			tc.outlineSize = 5.000
			tp = tc
			tp.c_mintextquadsize = setmetatable({}, c_mintextquadsize)
			com = tp.c_mintextquadsize
			com['minWidth'] =0.000
			com['autowidth'] =true
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '描述板'
		tc.left = -132.500
		tc.right = 132.500
		tc.bottom = -217.000
		tc.top = -77.000
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '描述字符'
			tc.left = -132.500
			tc.right = 132.500
			tc.bottom = -70.000
			tc.top = 70.000
			tc.shadowX = 2
			tc.shadowY = -2
			tc.shadowAlpha = 150
			tc.text = '      亡语：[br]将这把武器洗入你的[br]   牌库。保留所[br]   有额外效果。'
			tc.font = 0x61190000
			tc.lineSpace = 2
			tp = tc
			tp = tp.parent
			--end
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
			tc.left = -193.000
			tc.right = -77.000
			tc.bottom = 133.000
			tc.top = 251.000
			tc.scaleX = 0.700
			tc.scaleY = 0.700
			tc.img = 0x560b0001
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '费用数值'
				tc.left = -24.000
				tc.right = 24.000
				tc.top = 0.000
				tc.anchor = 0x64003232
				tc.scaleX = 1.430
				tc.scaleY = 1.430
				tc.text = '1'
				tc.font = 0x60500000
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
			tc.name = '攻击力'
			tc.left = -265.000
			tc.right = -9.000
			tc.bottom = -338.000
			tc.top = -82.000
			tc.scaleX = 0.500
			tc.scaleY = 0.500
			tc.img = 0x560b0006
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '攻击力数值'
				tc.left = -24.000
				tc.right = 24.000
				tc.top = 0.000
				tc.anchor = 0x64003232
				tc.scaleX = 2.000
				tc.scaleY = 2.000
				tc.text = '1'
				tc.font = 0x60500000
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
			tc.left = 93.000
			tc.right = 189.000
			tc.bottom = -248.500
			tc.top = -157.500
			tc.img = 0x560b0008
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '生命值数值'
				tc.left = -24.000
				tc.right = 24.000
				tc.top = 0.000
				tc.anchor = 0x64003232
				tc.text = '3'
				tc.font = 0x60500000
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
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -91.000
		tc.right = 165.000
		tc.bottom = 115.000
		tc.top = 275.000
		tc.img = 0x560a000f
		tp = tc
		tp = tp.parent
		--end
	tp.c_card_weapon = setmetatable({}, c_card_weapon)
	com = tp.c_card_weapon
	com['autowidth'] =false
	com['cost'] =1.000
	tp = tp.parent
	--end

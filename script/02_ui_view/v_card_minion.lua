--[[0

]]
local G = require 'gf'
local c_card_minion = require 'c_card_minion'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_curved_text = require 'c_curved_text'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_card_minion'
tc.right = 0.000
tc.top = 0.000
tp = tc
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
			tc.scaleX = 1.110
			tc.scaleY = 1.110
			tc.mask = 10
			tc.shapeimg = 0x56060011
			tc.SetVertexBuf(54,{0.0,0.0,-98.0,117.0,-99.0,117.0,-98.0,111.0,-99.0,110.0,-99.0,85.0,-95.0,57.0,-87.0,31.0,-86.0,31.0,-81.0,19.0,-67.0,-4.0,-65.0,-4.0,-65.0,-6.0,-63.0,-6.0,-62.0,-9.0,-59.0,-9.0,-51.0,-20.0,-31.0,-32.0,-31.0,-34.0,-17.0,-39.0,-17.0,-40.0,14.0,-42.0,17.0,-41.0,20.0,-42.0,41.0,-33.0,41.0,-32.0,47.0,-28.0,47.0,-29.0,56.0,-21.0,58.0,-16.0,58.0,-17.0,71.0,-5.0,93.0,38.0,93.0,42.0,95.0,43.0,101.0,84.0,102.0,85.0,102.0,120.0,101.0,121.0,98.0,139.0,86.0,176.0,71.0,200.0,44.0,225.0,23.0,235.0,13.0,236.0,12.0,237.0,-8.0,237.0,-37.0,227.0,-55.0,214.0,-73.0,191.0,-74.0,191.0,-85.0,171.0,-95.0,141.0,-98.0,117.0}, {0,0},0xffffffff)
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
			tc.scaleX = 0.550
			tc.scaleY = 0.550
			tc.img = 0x56010002
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '插画边缘阴影'
			tc.left = -97.500
			tc.right = 113.500
			tc.bottom = -36.000
			tc.top = 256.000
			tc.img = 0x56060013
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -166.500
		tc.right = 180.500
		tc.bottom = -250.500
		tc.top = 270.500
		tc.img = 0x56060001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -148.500
		tc.right = 170.500
		tc.bottom = -55.000
		tc.top = 19.000
		tc.img = 0x56060002
		tp = tc
			tc = G.loadUI('v_curved_text')
			tc.prefab = true
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = -320.000
			tc.right = 320.000
			tc.bottom = -9.000
			tc.top = -9.000
			tp = tc
			tp.c_curved_text = setmetatable({}, c_curved_text)
			com = tp.c_curved_text
			com['text'] ='游学者周卓'
			com['p0x'] =-142.000
			com['p0y'] =-1.000
			com['p1x'] =-104.000
			com['p1y'] =-13.000
			com['p2x'] =70.000
			com['p2y'] =45.000
			com['p3x'] =133.000
			com['p3y'] =7.000
			com['space'] =10.000
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '描述板'
		tc.left = -143.794
		tc.right = 155.206
		tc.bottom = -227.294
		tc.top = -55.294
		tc.img = 0x56060006
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '描述字符'
			tc.left = -133.000
			tc.right = 133.000
			tc.bottom = -63.500
			tc.top = 63.500
			tc.color = 0x0
			tc.text = '每当一个玩家施放一个[br]法术，复制该法术，将[br]   其置入另一个玩家[br]          的手牌。'
			tc.font = 0x651a0000
			tc.lineSpace = 2
			tc.style = 2
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '品质板'
		tc.left = -34.500
		tc.right = 64.500
		tc.bottom = -58.000
		tc.top = -28.000
		tc.img = 0x56060012
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '品质宝石'
			tc.left = -19.556
			tc.right = 10.444
			tc.bottom = -31.889
			tc.top = 8.111
			tc.img = 0x560b0011
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '种族板'
		tc.left = -88.353
		tc.right = 111.647
		tc.bottom = -234.706
		tc.top = -200.706
		tc.img = 0x56060004
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '种族字符'
			tc.left = -99.000
			tc.right = 93.000
			tc.bottom = -23.500
			tc.top = 23.500
			tc.text = '元素'
			tc.font = 0x62180000
			tc.lineSpace = 2
			tc.style = 14
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -92.500
		tc.right = 196.500
		tc.bottom = 85.000
		tc.top = 297.000
		tc.img = 0x5606000f
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
			tc.left = -194.106
			tc.right = -77.820
			tc.bottom = 150.993
			tc.top = 268.993
			tc.scaleX = 0.800
			tc.scaleY = 0.800
			tc.img = 0x560b0001
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '费用数值'
				tc.right = 0.000
				tc.bottom = 65.609
				tc.top = -1.000
				tc.anchor = 0x64003232
				tc.scaleX = 1.950
				tc.scaleY = 1.950
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
			tc.name = '攻击力'
			tc.left = -188.265
			tc.right = -89.265
			tc.bottom = -258.147
			tc.top = -145.147
			tc.scaleX = 0.950
			tc.scaleY = 0.950
			tc.img = 0x560b0003
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '攻击力数值'
				tc.left = 6.000
				tc.right = 6.000
				tc.bottom = -14.815
				tc.top = 36.815
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
			tc.left = 115.868
			tc.right = 187.368
			tc.bottom = -252.426
			tc.top = -139.926
			tc.scaleX = 0.950
			tc.scaleY = 0.950
			tc.img = 0x560b0002
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '生命值数值'
				tc.left = -1.947
				tc.right = -1.947
				tc.bottom = -6.132
				tc.top = 28.868
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
	tp.c_card_minion = setmetatable({}, c_card_minion)
	com = tp.c_card_minion
	com['cost'] =nil
	com['atk'] =nil
	com['hp'] =nil
	tp = tp.parent
	--end

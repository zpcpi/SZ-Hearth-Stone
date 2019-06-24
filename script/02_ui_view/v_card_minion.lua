--[[2001

]]
local G = require 'gf'
local c_card_minion = require 'c_card_minion'
local c_mintextquadsize = require 'c_mintextquadsize'
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
			tc.left = -254.000
			tc.right = 258.000
			tc.bottom = -157.000
			tc.top = 355.000
			tc.scaleX = 0.580
			tc.scaleY = 0.580
			tc.img = 0x56010002
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -182.500
		tc.right = 182.500
		tc.bottom = -256.000
		tc.top = 256.000
		tc.img = 0x56060001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -221.000
		tc.right = 307.000
		tc.bottom = -8.500
		tc.top = 372.500
		tc.scaleX = 0.500
		tc.scaleY = 0.550
		tc.img = 0x5606000f
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '品质板'
		tc.left = -28.000
		tc.right = 36.000
		tc.bottom = -82.000
		tc.top = -32.000
		tc.img = 0x56060003
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -154.500
		tc.right = 164.500
		tc.bottom = -64.500
		tc.top = 14.500
		tc.img = 0x56060002
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = -82.500
			tc.right = 82.500
			tc.bottom = 6.000
			tc.top = 6.000
			tc.anchor = 0x64003232
			tc.rotation = -5.000
			tc.text = '游学者周卓'
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
			tc.color = 0x0
			tc.text = '每当一个玩家施放一个[br]法术，复制该法术，将[br]  其置入另一个玩家[br]      的手牌。'
			tc.font = 0x61190000
			tc.lineSpace = 2
			tc.style = 2
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
			tc.left = -205.000
			tc.right = -65.000
			tc.bottom = 119.000
			tc.top = 265.000
			tc.scaleX = 0.700
			tc.scaleY = 0.700
			tc.img = 0x56070008
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
				tc.text = '2'
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
			tc.left = -184.500
			tc.right = -85.500
			tc.bottom = -263.500
			tc.top = -156.500
			tc.img = 0x56070005
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '攻击力数值'
				tc.left = -24.000
				tc.right = 24.000
				tc.top = 0.000
				tc.anchor = 0x64003232
				tc.text = '0'
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
			tc.left = 100.500
			tc.right = 181.500
			tc.bottom = -261.000
			tc.top = -145.000
			tc.img = 0x5607000a
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '生命值数值'
				tc.left = -24.000
				tc.right = 24.000
				tc.top = 0.000
				tc.anchor = 0x64003232
				tc.text = '4'
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
	tp.c_card_minion = setmetatable({}, c_card_minion)
	tp = tp.parent
	--end

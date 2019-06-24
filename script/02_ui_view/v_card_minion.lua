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
	tc.left = -75.000
	tc.right = 75.000
	tc.bottom = -105.000
	tc.top = 105.000
	tp = tc
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '原画组合'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = 'mask'
			tc.right = 0.000
			tc.top = 0.000
			tc.anchor = 0x64006400
			tc.mask = 10
			tc.img = 0x56060011
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '原画'
			tc.left = -255.000
			tc.right = 257.000
			tc.bottom = -215.000
			tc.top = 297.000
			tc.scaleX = 0.230
			tc.scaleY = 0.230
			tc.img = 0x56010002
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.img = 0x56060001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -105.625
		tc.right = 136.375
		tc.bottom = -6.875
		tc.top = 153.125
		tc.scaleX = 0.480
		tc.scaleY = 0.480
		tc.img = 0x5606000f
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '品质板'
		tc.left = -32.000
		tc.right = 32.000
		tc.bottom = -49.545
		tc.top = 0.455
		tc.scaleX = 0.410
		tc.scaleY = 0.410
		tc.img = 0x56060003
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -158.071
		tc.right = 160.929
		tc.bottom = -49.929
		tc.top = 29.071
		tc.scaleX = 0.420
		tc.scaleY = 0.420
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
		tc.left = -109.408
		tc.right = 109.027
		tc.bottom = -125.299
		tc.top = -1.342
		tc.scaleX = 0.500
		tc.scaleY = 0.500
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '描述字符'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.right = 0.000
			tc.top = 0.000
			tc.anchor = 0x64006400
			tc.color = 0x0
			tc.text = '每当一个玩家施放一个[br]法术，复制该法术，将[br]  其置入另一个玩家[br]      的手牌。'
			tc.font = 0x61140000
			tc.lineSpace = 2
			tc.style = 12
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
			tc.left = -126.000
			tc.right = 14.000
			tc.bottom = 6.000
			tc.top = 152.000
			tc.scaleX = 0.280
			tc.scaleY = 0.280
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
			tc.left = -107.500
			tc.right = -8.500
			tc.bottom = -138.500
			tc.top = -31.500
			tc.scaleX = 0.400
			tc.scaleY = 0.400
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
			tc.left = 17.500
			tc.right = 98.500
			tc.bottom = -143.000
			tc.top = -27.000
			tc.scaleX = 0.400
			tc.scaleY = 0.400
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

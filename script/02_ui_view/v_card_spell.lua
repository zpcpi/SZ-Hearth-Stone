--[[2001

]]
local G = require 'gf'
local c_card_minion = require 'c_card_minion'
local c_mintextquadsize = require 'c_mintextquadsize'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_card_spell'
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
			tc.img = 0x56090011
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '原画'
			tc.left = -257.143
			tc.right = 254.857
			tc.bottom = -222.500
			tc.top = 289.500
			tc.scaleX = 0.230
			tc.scaleY = 0.230
			tc.img = 0x56010007
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
		tc.img = 0x56090010
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -108.394
		tc.right = 147.606
		tc.bottom = 3.087
		tc.top = 140.087
		tc.scaleX = 0.520
		tc.scaleY = 0.480
		tc.img = 0x5609000f
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '品质板'
		tc.left = -30.500
		tc.right = 30.500
		tc.bottom = -50.891
		tc.top = 3.109
		tc.scaleX = 0.410
		tc.scaleY = 0.410
		tc.img = 0x56090003
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -180.074
		tc.right = 181.450
		tc.bottom = -60.768
		tc.top = 31.803
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56090002
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = -33.000
			tc.right = 33.000
			tc.bottom = 23.000
			tc.top = 27.000
			tc.anchor = 0x64003232
			tc.text = '妖术'
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
		tc.bottom = -114.513
		tc.top = -5.556
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
			tc.text = '   使一个随从变[br]形成为一个0/1并具[br]  有嘲讽的青蛙。'
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

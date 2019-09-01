--[[0

]]
local G = require 'gf'
local c_card_herospell = require 'c_card_herospell'
local c_mintextquadsize = require 'c_mintextquadsize'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_card_herospell'
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
			tc.left = -83.000
			tc.right = 89.000
			tc.bottom = 38.500
			tc.top = 199.500
			tc.mask = 10
			tc.shapeimg = 0x5605000f
			tc.SetVertexBuf(37,{0.0,0.0,-85.0,23.5,-86.0,23.5,-86.0,-5.5,-77.0,-31.5,-70.0,-45.5,-69.0,-45.5,-61.0,-56.5,-45.0,-67.5,-23.0,-77.5,-23.0,-78.5,7.0,-79.5,22.0,-76.5,39.0,-69.5,49.0,-63.5,49.0,-64.5,64.0,-52.5,64.0,-53.5,76.0,-35.5,80.0,-26.5,80.0,-27.5,85.0,-8.5,84.0,-7.5,83.0,15.5,80.0,27.5,68.0,56.5,49.0,74.5,38.0,80.5,23.0,58.5,-22.0,57.5,-40.0,79.5,-49.0,74.5,-50.0,75.5,-57.0,70.5,-72.0,54.5,-84.0,30.5,-85.0,23.5}, {0,0},0xffffffff)
			tc.meshType = 6
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '原画'
			tc.left = -126.000
			tc.right = 130.000
			tc.bottom = -5.000
			tc.top = 251.000
			tc.scaleX = 0.680
			tc.scaleY = 0.680
			tc.img = 0x5601000c
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -179.000
		tc.right = 179.000
		tc.bottom = -264.000
		tc.top = 264.000
		tc.img = 0x5605000e
		tp = tc
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -251.000
		tc.right = 253.000
		tc.bottom = -45.000
		tc.top = 55.000
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = -58.000
			tc.right = 58.000
			tc.top = 0.000
			tc.anchor = 0x64003232
			tc.text = '虚空形态'
			tc.font = 0x621d0000
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
		tc.left = -234.000
		tc.right = 234.000
		tc.bottom = -213.000
		tc.top = -15.000
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '描述字符'
			tc.left = -148.000
			tc.right = 148.000
			tc.bottom = -94.000
			tc.top = 78.000
			tc.color = 0x0
			tc.text = '           英雄技能[br]造成2点伤害。在你使用[br]    一张牌后，复原你[br]        的英雄技能。'
			tc.font = 0x65190000
			tc.style = 2
			tc.outlineSize = 5.000
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
			tc = G.Entity()
			tp.addChild(tc)
			tc.name = '费用'
			tc.left = -50.000
			tc.right = 50.000
			tc.bottom = 172.000
			tc.top = 272.000
			tc.scaleX = 0.700
			tc.scaleY = 0.700
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
	tp.c_card_herospell = setmetatable({}, c_card_herospell)
	tp = tp.parent
	--end

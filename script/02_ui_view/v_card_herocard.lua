--[[2001

]]
local G = require 'gf'
local c_curved_text = require 'c_curved_text'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_card_herocard = require 'c_card_herocard'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_card_herocard'
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
			tc.shapeimg = 0x5604000d
			tc.SetVertexBuf(34,{0.0,0.0,-82.0,90.0,-83.0,91.0,-83.0,90.0,-82.0,91.0,-82.0,99.0,-78.0,120.0,-68.0,142.0,-59.0,155.0,-44.0,171.0,-20.0,183.0,-9.0,186.0,12.0,186.0,12.0,185.0,27.0,181.0,27.0,180.0,44.0,171.0,59.0,159.0,69.0,146.0,78.0,130.0,85.0,110.0,87.0,89.0,88.0,89.0,87.0,-2.0,88.0,-2.0,87.0,-9.0,86.0,-10.0,52.0,-10.0,51.0,-11.0,50.0,-10.0,-81.0,-11.0,-83.0,-9.0,-83.0,87.0,-82.0,90.0}, {0,0},0xffffffff)
			tc.meshType = 6
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '原画'
			tc.left = -253.000
			tc.right = 259.000
			tc.bottom = -166.000
			tc.top = 346.000
			tc.scaleX = 0.400
			tc.scaleY = 0.400
			tc.img = 0x56010008
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -168.000
		tc.right = 168.000
		tc.bottom = -256.000
		tc.top = 256.000
		tc.img = 0x56040005
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '品质板'
		tc.left = -41.000
		tc.right = 43.000
		tc.bottom = -118.000
		tc.top = 0.000
		tc.scaleX = 0.300
		tc.scaleY = 0.300
		tc.img = 0x560b0011
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -286.500
		tc.right = 286.500
		tc.bottom = -116.000
		tc.top = 66.000
		tc.scaleX = 0.530
		tc.scaleY = 0.530
		tc.img = 0x56040001
		tp = tc
			tc = G.loadUI('v_curved_text')
			tc.prefab = true
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = 0.000
			tc.right = 0.000
			tc.bottom = -22.000
			tc.top = -22.000
			tc.scaleX = 1.54
			tc.scaleY = 1.54
			tp = tc
				tp.c_curved_text = setmetatable({}, c_curved_text)
				com = tp.c_curved_text
				com['text'] ='天灾领主加尔鲁什'
				com['p0x'] =-142.000
				com['p0y'] =-20.000
				com['p1x'] =-104.000
				com['p1y'] =15.000
				com['p2x'] =70.000
				com['p2y'] =30.000
				com['p3x'] =133.000
				com['p3y'] =-20.000
				com['space'] =10.000
				tp = tp.parent
				--end
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '描述板'
		tc.left = -221.500
		tc.right = 221.500
		tc.bottom = -248.000
		tc.top = -56.000
		tc.scaleX = 0.500
		tc.scaleY = 0.500
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '描述字符'
			tc.left = -221.500
			tc.right = 221.500
			tc.bottom = -92.000
			tc.scaleX = 2.000
			tc.scaleY = 2.000
			tc.color = 0x0
			tc.text = '战吼：装备一把4/3的影[br] 之哀伤，影之哀伤同时[br] 对其攻击目标相邻的随[br]       从造成伤害。'
			tc.font = 0x65160000
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
			tc.left = -181.000
			tc.right = -65.000
			tc.bottom = 111.000
			tc.top = 229.000
			tc.scaleX = 0.700
			tc.scaleY = 0.700
			tc.img = 0x560b0001
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '费用数值'
				tc.left = -16.357
				tc.right = 18.643
				tc.bottom = 13.929
				tc.top = 44.929
				tc.scaleX = 1.950
				tc.scaleY = 1.950
				tc.text = '8'
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
			tc.left = 87.167
			tc.right = 170.833
			tc.bottom = -256.222
			tc.top = -161.778
			tc.scaleX = 0.850
			tc.scaleY = 0.850
			tc.img = 0x560b0004
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '生命值数值'
				tc.left = -13.833
				tc.right = 21.167
				tc.bottom = 1.160
				tc.top = 38.160
				tc.scaleX = 1.500
				tc.scaleY = 1.500
				tc.text = '5'
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
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -225.000
		tc.right = 303.000
		tc.bottom = -41.500
		tc.top = 339.500
		tc.scaleX = 0.500
		tc.scaleY = 0.500
		tc.img = 0x5604000b
		tp = tc
		tp = tp.parent
		--end
	tp.c_card_herocard = setmetatable({}, c_card_herocard)
	tp = tp.parent
	--end

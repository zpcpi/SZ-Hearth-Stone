--[[0

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
			tc.bottom = -235.000
			tc.top = 277.000
			tc.scaleX = 1.100
			tc.scaleY = 1.100
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
			tc.left = -256.000
			tc.right = 256.000
			tc.bottom = -244.471
			tc.top = 267.529
			tc.anchor = 0x46463232
			tc.scaleX = 0.450
			tc.scaleY = 0.450
			tc.img = 0x56010008
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '插画边缘阴影'
			tc.left = -97.176
			tc.right = 96.824
			tc.bottom = 4.706
			tc.top = 228.706
			tc.img = 0x56040011
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -174.000
		tc.right = 174.000
		tc.bottom = -262.000
		tc.top = 262.000
		tc.img = 0x5604000e
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '品质宝石'
		tc.left = -15.556
		tc.right = 14.444
		tc.bottom = -71.889
		tc.top = -31.889
		tc.scaleX = 0.900
		tc.scaleY = 0.900
		tc.img = 0x560b0011
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -159.735
		tc.right = 163.265
		tc.bottom = -66.382
		tc.top = 14.618
		tc.img = 0x56040001
		tp = tc
			tc = G.loadUI('v_curved_text')
			tc.prefab = true
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = -320.000
			tc.right = 320.000
			tc.bottom = -2.000
			tc.top = -2.000
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
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '描述板'
		tc.left = -151.000
		tc.right = 151.000
		tc.bottom = -236.882
		tc.top = -42.882
		tc.img = 0x56040010
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '描述字符'
			tc.left = -124.824
			tc.right = 124.824
			tc.bottom = -69.000
			tc.top = 47.000
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
			tc.left = -197.059
			tc.right = -81.059
			tc.bottom = 144.176
			tc.top = 262.176
			tc.scaleX = 0.800
			tc.scaleY = 0.800
			tc.img = 0x560b0001
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '费用数值'
				tc.left = 1.143
				tc.right = 1.143
				tc.bottom = 13.929
				tc.top = 44.929
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
			tc.name = '精英板'
			tc.left = -110.088
			tc.right = 184.912
			tc.bottom = 93.647
			tc.top = 291.647
			tc.img = 0x56040013
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '生命值'
			tc.left = 96.579
			tc.right = 180.245
			tc.bottom = -270.928
			tc.top = -176.484
			tc.scaleX = 0.850
			tc.scaleY = 0.850
			tc.img = 0x560b0004
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '生命值数值'
				tc.left = 3.667
				tc.right = 3.667
				tc.bottom = 1.160
				tc.top = 38.160
				tc.scaleX = 1.500
				tc.scaleY = 1.500
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
	tp.c_card_herocard = setmetatable({}, c_card_herocard)
	com = tp.c_card_herocard
	com['cost'] =nil
	com['hp'] =nil
	tp = tp.parent
	--end

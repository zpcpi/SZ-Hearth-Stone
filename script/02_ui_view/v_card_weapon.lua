--[[0

]]
local G = require 'gf'
local c_curved_text = require 'c_curved_text'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_card_weapon = require 'c_card_weapon'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_card_weapon'
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
			tc.scaleX = 1.100
			tc.scaleY = 1.100
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
			tc.scaleX = 0.550
			tc.scaleY = 0.550
			tc.img = 0x56010009
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '插画边缘阴影'
			tc.left = -115.500
			tc.right = 119.500
			tc.bottom = -10.250
			tc.top = 227.750
			tc.img = 0x560a0005
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -173.000
		tc.right = 173.000
		tc.bottom = -252.500
		tc.top = 252.500
		tc.img = 0x560a0001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -166.500
		tc.right = 166.500
		tc.bottom = -56.750
		tc.top = 13.250
		tc.img = 0x560a0003
		tp = tc
			tc = G.loadUI('v_curved_text')
			tc.prefab = true
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = -320.000
			tc.right = 320.000
			tc.bottom = -4.000
			tc.top = -4.000
			tp = tc
			tp.c_curved_text = setmetatable({}, c_curved_text)
			com = tp.c_curved_text
			com['text'] ='弑君'
			com['p0x'] =-142.000
			com['p0y'] =15.000
			com['p1x'] =-104.000
			com['p1y'] =15.000
			com['p2x'] =70.000
			com['p2y'] =15.000
			com['p3x'] =133.000
			com['p3y'] =15.000
			com['space'] =10.000
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '描述板'
		tc.left = -154.500
		tc.right = 146.500
		tc.bottom = -233.500
		tc.top = -59.500
		tc.img = 0x560a0002
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '描述字符'
			tc.left = -140.000
			tc.right = 140.000
			tc.bottom = -72.000
			tc.top = 72.000
			tc.shadowAlpha = 150
			tc.text = '          亡语：[br]将这把武器洗入你的[br]     牌库。保留所[br]     有额外效果。'
			tc.font = 0x65170000
			tc.lineSpace = 2
			tc.outlineSize = 0.000
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '品质板'
		tc.left = -25.000
		tc.right = 29.000
		tc.bottom = -54.000
		tc.top = -38.000
		tc.scaleX = 1.100
		tc.scaleY = 1.100
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
		tc.name = '精英板'
		tc.left = -95.278
		tc.right = 185.722
		tc.bottom = 121.333
		tc.top = 283.333
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
			tc.name = '费用'
			tc.left = -197.625
			tc.right = -81.625
			tc.bottom = 151.250
			tc.top = 269.250
			tc.scaleX = 0.800
			tc.scaleY = 0.800
			tc.img = 0x560b0001
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '费用数值'
				tc.left = -17.500
				tc.right = 17.500
				tc.bottom = 18.357
				tc.top = 47.357
				tc.scaleX = 1.950
				tc.scaleY = 1.950
				tc.text = '1'
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
			tc.left = -216.250
			tc.right = -91.250
			tc.bottom = -257.250
			tc.top = -170.250
			tc.img = 0x560b0006
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '攻击力数值'
				tc.left = 15.000
				tc.right = 15.000
				tc.bottom = 3.875
				tc.top = 44.875
				tc.scaleX = 1.350
				tc.scaleY = 1.350
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
			tc.left = 101.750
			tc.right = 184.750
			tc.bottom = -261.375
			tc.top = -167.375
			tc.img = 0x560b0008
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '生命值数值'
				tc.left = -3.750
				tc.right = -3.750
				tc.bottom = -3.614
				tc.top = 44.864
				tc.scaleX = 1.350
				tc.scaleY = 1.350
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
	tp.c_card_weapon = setmetatable({}, c_card_weapon)
	com = tp.c_card_weapon
	com['cost'] =1.000
	com['atk'] =nil
	com['hp'] =nil
	tp = tp.parent
	--end

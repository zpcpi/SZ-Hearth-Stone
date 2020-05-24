--[[0

]]
local G = require 'gf'
local c_curved_text = require 'c_curved_text'
local c_card_spell = require 'c_card_spell'
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
			tc.bottom = -250.000
			tc.top = 262.000
			tc.scaleX = 1.100
			tc.scaleY = 1.100
			tc.mask = 10
			tc.shapeimg = 0x56090011
			tc.SetVertexBuf(88,{0.0,0.0,-127.0,153.0,-128.0,153.0,-128.0,12.0,-124.0,12.0,-124.0,9.0,-112.0,8.0,-111.0,3.0,-108.0,2.0,-108.0,1.0,-88.0,0.0,-88.0,-3.0,-72.0,-4.0,-72.0,-7.0,-67.0,-7.0,-67.0,-8.0,-42.0,-8.0,-24.0,-4.0,-24.0,-5.0,-12.0,-5.0,-9.0,-4.0,-7.0,-5.0,-7.0,-6.0,0.0,-6.0,1.0,-4.0,12.0,-4.0,12.0,-6.0,20.0,-7.0,21.0,-4.0,24.0,-4.0,24.0,-7.0,32.0,-7.0,32.0,-8.0,71.0,-8.0,77.0,-6.0,77.0,-4.0,89.0,-4.0,93.0,-2.0,93.0,0.0,105.0,2.0,105.0,4.0,109.0,4.0,113.0,6.0,113.0,8.0,117.0,8.0,121.0,10.0,121.0,12.0,125.0,13.0,125.0,168.0,124.0,169.0,118.0,169.0,116.0,173.0,110.0,173.0,107.0,177.0,98.0,177.0,95.0,181.0,86.0,181.0,85.0,183.0,81.0,185.0,70.0,185.0,69.0,187.0,64.0,189.0,50.0,189.0,49.0,191.0,44.0,193.0,22.0,193.0,20.0,196.0,-4.0,196.0,-5.0,193.0,-43.0,193.0,-44.0,192.0,-52.0,192.0,-53.0,189.0,-67.0,189.0,-75.0,185.0,-88.0,184.0,-89.0,181.0,-96.0,181.0,-96.0,178.0,-100.0,177.0,-100.0,170.0,-104.0,168.0,-104.0,162.0,-108.0,160.0,-108.0,158.0,-112.0,156.0,-113.0,153.0,-127.0,153.0}, {0,0},0xffffffff)
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
			tc.img = 0x56010007
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '插画边缘阴影'
			tc.left = -134.611
			tc.right = 134.389
			tc.bottom = -4.556
			tc.top = 221.444
			tc.img = 0x56090005
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -173.500
		tc.right = 173.500
		tc.bottom = -244.500
		tc.top = 244.500
		tc.img = 0x56090001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -168.000
		tc.right = 168.000
		tc.bottom = -71.056
		tc.top = 31.944
		tc.img = 0x56090013
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
			com['text'] ='妖术'
			com['p0x'] =-142.000
			com['p0y'] =10.000
			com['p1x'] =-104.000
			com['p1y'] =25.000
			com['p2x'] =70.000
			com['p2y'] =40.000
			com['p3x'] =133.000
			com['p3y'] =10.000
			com['space'] =10.000
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '描述板'
		tc.left = -149.944
		tc.right = 151.056
		tc.bottom = -220.556
		tc.top = -32.556
		tc.img = 0x56090003
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '描述字符'
			tc.left = -129.000
			tc.right = 129.000
			tc.bottom = -72.000
			tc.top = 72.000
			tc.color = 0x0
			tc.text = '   使一个随从变[br]形成为一个0/1并具[br]  有嘲讽的青蛙。'
			tc.font = 0x651c0000
			tc.lineSpace = 2
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '品质板'
		tc.left = -38.000
		tc.right = 38.000
		tc.bottom = -71.500
		tc.top = -20.500
		tc.img = 0x56090012
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '品质宝石'
			tc.left = -13.444
			tc.right = 16.556
			tc.bottom = -25.500
			tc.top = 14.500
			tc.scaleX = 1.050
			tc.scaleY = 1.050
			tc.img = 0x560b0011
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -93.389
		tc.right = 219.611
		tc.bottom = 106.111
		tc.top = 274.111
		tc.img = 0x5609000f
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
			tc.left = -196.222
			tc.right = -80.222
			tc.bottom = 157.667
			tc.top = 275.667
			tc.scaleX = 0.800
			tc.scaleY = 0.800
			tc.img = 0x560b0001
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '费用数值'
				tc.left = -2.857
				tc.right = -2.857
				tc.bottom = 32.857
				tc.top = 32.857
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
		tp = tp.parent
		--end
	tp.c_card_spell = setmetatable({}, c_card_spell)
	com = tp.c_card_spell
	com['cost'] =nil
	tp = tp.parent
	--end

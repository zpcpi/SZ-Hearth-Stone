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
			tc.shapeimg = 0x56090011
			tc.SetVertexBuf(88,{0.0,0.0,-127.0,153.0,-128.0,153.0,-128.0,12.0,-124.0,12.0,-124.0,9.0,-112.0,8.0,-111.0,3.0,-108.0,2.0,-108.0,1.0,-88.0,0.0,-88.0,-3.0,-72.0,-4.0,-72.0,-7.0,-67.0,-7.0,-67.0,-8.0,-42.0,-8.0,-24.0,-4.0,-24.0,-5.0,-12.0,-5.0,-9.0,-4.0,-7.0,-5.0,-7.0,-6.0,0.0,-6.0,1.0,-4.0,12.0,-4.0,12.0,-6.0,20.0,-7.0,21.0,-4.0,24.0,-4.0,24.0,-7.0,32.0,-7.0,32.0,-8.0,71.0,-8.0,77.0,-6.0,77.0,-4.0,89.0,-4.0,93.0,-2.0,93.0,0.0,105.0,2.0,105.0,4.0,109.0,4.0,113.0,6.0,113.0,8.0,117.0,8.0,121.0,10.0,121.0,12.0,125.0,13.0,125.0,168.0,124.0,169.0,118.0,169.0,116.0,173.0,110.0,173.0,107.0,177.0,98.0,177.0,95.0,181.0,86.0,181.0,85.0,183.0,81.0,185.0,70.0,185.0,69.0,187.0,64.0,189.0,50.0,189.0,49.0,191.0,44.0,193.0,22.0,193.0,20.0,196.0,-4.0,196.0,-5.0,193.0,-43.0,193.0,-44.0,192.0,-52.0,192.0,-53.0,189.0,-67.0,189.0,-75.0,185.0,-88.0,184.0,-89.0,181.0,-96.0,181.0,-96.0,178.0,-100.0,177.0,-100.0,170.0,-104.0,168.0,-104.0,162.0,-108.0,160.0,-108.0,158.0,-112.0,156.0,-113.0,153.0,-127.0,153.0}, {0,0},0xffffffff)
			tc.meshType = 6
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '原画'
			tc.left = -254.143
			tc.right = 257.857
			tc.bottom = -174.500
			tc.top = 337.500
			tc.scaleX = 0.580
			tc.scaleY = 0.580
			tc.img = 0x56010007
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
		tc.img = 0x56090010
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '品质板'
		tc.left = -30.500
		tc.right = 30.500
		tc.bottom = -83.436
		tc.top = -29.436
		tc.img = 0x56090003
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -265.812
		tc.right = 261.188
		tc.bottom = -115.482
		tc.top = 48.518
		tc.scaleX = 0.650
		tc.scaleY = 0.650
		tc.img = 0x56090002
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = -33.000
			tc.right = 33.000
			tc.bottom = 20.000
			tc.top = 70.000
			tc.scaleX = 1.540
			tc.scaleY = 1.540
			tc.text = '妖术'
			tc.font = 0x61200000
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
			tc.text = '   使一个随从变[br]形成为一个0/1并具[br]  有嘲讽的青蛙。'
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
			tc.left = -208.000
			tc.right = -68.000
			tc.bottom = 122.000
			tc.top = 268.000
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
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -78.000
		tc.right = 178.000
		tc.bottom = 106.500
		tc.top = 243.500
		tc.scaleX = 1.300
		tc.scaleY = 1.300
		tc.img = 0x5609000f
		tp = tc
		tp = tp.parent
		--end
	tp.c_card_minion = setmetatable({}, c_card_minion)
	tp = tp.parent
	--end

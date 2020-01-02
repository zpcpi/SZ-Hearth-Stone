--[[0

]]
local G = require 'gf'
local c_battle_minion = require 'c_battle_minion'
local c_mintextquadsize = require 'c_mintextquadsize'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_minion'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '卡牌框'
	tc.left = -50.000
	tc.right = 50.000
	tc.bottom = -50.000
	tc.top = 50.000
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
			tc.left = -79.643
			tc.right = 99.643
			tc.bottom = -117.230
			tc.top = 117.230
			tc.scaleX = 1.180
			tc.scaleY = 1.180
			tc.mask = 10
			tc.shapeimg = 0x56250005
			tc.SetVertexBuf(62,{0.0,0.0,-78.0,19.5,-79.0,19.5,-78.0,-4.5,-77.0,-4.5,-77.0,-8.5,-76.0,-8.5,-76.0,-29.5,-71.0,-31.5,-71.0,-53.5,-70.0,-53.5,-70.0,-55.5,-65.0,-58.5,-62.0,-58.5,-61.0,-63.5,-57.0,-70.5,-47.0,-83.5,-46.0,-83.5,-45.0,-86.5,-35.0,-88.5,-35.0,-89.5,-24.0,-95.5,-23.0,-99.5,-2.0,-103.5,9.0,-103.5,22.0,-99.5,29.0,-94.5,29.0,-95.5,31.0,-91.5,36.0,-91.5,40.0,-88.5,41.0,-84.5,50.0,-80.5,50.0,-81.5,59.0,-65.5,65.0,-62.5,66.0,-60.5,66.0,-52.5,71.0,-33.5,75.0,-26.5,75.0,-17.5,78.0,5.5,72.0,26.5,73.0,32.5,69.0,39.5,63.0,56.5,54.0,71.5,40.0,86.5,38.0,90.5,20.0,100.5,12.0,100.5,6.0,104.5,-4.0,102.5,-7.0,104.5,-23.0,99.5,-45.0,87.5,-60.0,70.5,-71.0,48.5,-71.0,40.5,-74.0,39.5,-76.0,25.5,-78.0,19.5}, {0,0},0xffffffff)
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
		tc.name = '嘲讽框'
		tc.left = -85.000
		tc.right = 97.000
		tc.bottom = -128.167
		tc.top = 108.833
		tc.scaleX = 1.320
		tc.scaleY = 1.320
		tc.img = 0x56250006
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -81.826
		tc.right = 92.174
		tc.bottom = -109.000
		tc.top = 109.000
		tc.scaleX = 1.300
		tc.scaleY = 1.300
		tc.img = 0x56250007
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '精英板'
		tc.left = -227.312
		tc.right = 318.688
		tc.bottom = -64.682
		tc.top = 232.682
		tc.scaleX = 0.500
		tc.scaleY = 0.550
		tc.img = 0x5606000f
		tp = tc
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '状态栏'
		tc.left = -50.000
		tc.right = 50.000
		tc.bottom = -50.000
		tc.top = 50.000
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '攻击'
			tc.left = 70.000
			tc.right = 110.000
			tc.bottom = 112.000
			tc.top = 132.000
			tc.rotation = -44.000
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '冻结'
			tc.left = 83.000
			tc.right = 123.000
			tc.bottom = 96.000
			tc.top = 116.000
			tc.rotation = -36.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0xff0000
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '作废'
			tc.left = 94.000
			tc.right = 134.000
			tc.bottom = 77.000
			tc.top = 97.000
			tc.visible = false
			tc.rotation = -29.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0xf502ff
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '免疫'
			tc.left = 113.000
			tc.right = 153.000
			tc.bottom = -37.000
			tc.top = -17.000
			tc.rotation = 6.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0xff
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '复生'
			tc.left = 110.000
			tc.right = 150.000
			tc.bottom = -59.000
			tc.top = -39.000
			tc.rotation = 12.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0xdbff00
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '圣盾'
			tc.left = 104.000
			tc.right = 144.000
			tc.bottom = -80.000
			tc.top = -60.000
			tc.rotation = 22.000
			tc.color = 0x7befec
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '作废'
			tc.left = 53.000
			tc.right = 93.000
			tc.bottom = -147.000
			tc.top = -127.000
			tc.visible = false
			tc.rotation = 61.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0xff0000
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '光环'
			tc.left = 35.000
			tc.right = 75.000
			tc.bottom = -157.000
			tc.top = -137.000
			tc.rotation = 69.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0xd9ff
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '亡语'
			tc.left = 14.000
			tc.right = 54.000
			tc.bottom = -166.000
			tc.top = -146.000
			tc.rotation = 80.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0x0
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '被动'
			tc.left = -9.000
			tc.right = 31.000
			tc.bottom = -168.000
			tc.top = -148.000
			tc.rotation = 90.000
			tc.color = 0xffff
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '作废'
			tc.left = -30.000
			tc.right = 10.000
			tc.bottom = -168.000
			tc.top = -148.000
			tc.visible = false
			tc.rotation = -80.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0x538b39
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '超杀'
			tc.left = -48.000
			tc.right = -8.000
			tc.bottom = -162.000
			tc.top = -142.000
			tc.rotation = -69.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0xfa0088
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '吸血'
			tc.left = -66.000
			tc.right = -26.000
			tc.bottom = -153.000
			tc.top = -133.000
			tc.rotation = -62.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0xf502ff
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '剧毒'
			tc.left = -83.000
			tc.right = -43.000
			tc.bottom = -141.000
			tc.top = -121.000
			tc.rotation = -55.000
			tc.scaleX = 1.000
			tc.scaleY = 1.000
			tc.color = 0xff4e
			tc.alpha = 130
			tc.img = 0x56000001
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '属性值组合'
		tc.right = 40.667
		tc.top = 46.000
		tc.anchor = 0x64006400
		tc.scaleX = 0.800
		tc.scaleY = 0.800
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '攻击力'
			tc.left = -170.907
			tc.right = -71.907
			tc.bottom = -182.741
			tc.top = -69.741
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
			tc.left = 44.899
			tc.right = 116.399
			tc.bottom = -183.377
			tc.top = -70.877
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
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '护甲值'
			tc.left = 32.316
			tc.right = 129.316
			tc.bottom = -124.369
			tc.top = -14.369
			tc.visible = false
			tc.scaleX = 0.800
			tc.scaleY = 0.800
			tc.img = 0x560b0004
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '护甲值数值'
				tc.left = 0.158
				tc.right = 0.158
				tc.bottom = 0.342
				tc.top = 35.342
				tc.scaleX = 1.600
				tc.scaleY = 1.600
				tc.font = 0x63410000
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
	tp.c_battle_minion = setmetatable({}, c_battle_minion)
	com = tp.c_battle_minion
	com['cost'] =nil
	com['atk'] =nil
	com['hp'] =nil
	com['ap'] =nil
	tp = tp.parent
	--end

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
	tc.name = '卡背框'
	tc.right = 0.000
	tc.top = 0.000
	tc.visible = false
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '卡背'
		tc.left = -163.500
		tc.right = 163.500
		tc.bottom = -236.000
		tc.top = 236.000
		tc.img = 0x5601000a
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
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
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = 0.000
			tc.right = 0.000
			tc.bottom = -22.000
			tc.top = -22.000
			tc.scaleX = 1.540
			tc.scaleY = 1.540
			tp = tc
				tc = tp.getChildByName('单字父级')
				if tc then
				tp = tc
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -204.856
					tc.right = -4.856
					tc.bottom = -51.760
					tc.top = 48.240
					tc.rotation = -16.998
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '天'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -177.749
					tc.right = 22.251
					tc.bottom = -45.115
					tc.top = 54.885
					tc.rotation = -11.015
					tc.text = '灾'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -146.928
					tc.right = 53.072
					tc.bottom = -40.480
					tc.top = 59.520
					tc.rotation = -6.269
					tc.text = '领'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -113.875
					tc.right = 86.125
					tc.bottom = -38.125
					tc.top = 61.875
					tc.rotation = -1.898
					tc.text = '主'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -80.072
					tc.right = 119.928
					tc.bottom = -38.320
					tc.top = 61.680
					tc.rotation = 2.676
					tc.text = '加'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -47.001
					tc.right = 152.999
					tc.bottom = -41.335
					tc.top = 58.665
					tc.rotation = 8.014
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '尔'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -16.144
					tc.right = 183.856
					tc.bottom = -47.440
					tc.top = 52.560
					tc.rotation = 14.869
					tc.text = '鲁'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 11.017
					tc.right = 211.017
					tc.bottom = -56.905
					tc.top = 43.095
					tc.rotation = 24.430
					tc.text = '什'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
				tp = tp.parent
				end
				--end
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
			tc = G.loadUI('v_curved_text')
			tp.addChild(tc)
			tc.name = '名称字符辅助线'
			tc.left = 0.000
			tc.right = 0.000
			tc.bottom = 0.000
			tc.top = 0.000
			tc.visible = false
			tc.scaleX = 1.900
			tc.scaleY = 1.900
			tp = tc
				tc = tp.getChildByName('单字父级')
				if tc then
				tp = tc
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -246.649
					tc.right = -46.649
					tc.bottom = -75.394
					tc.top = 24.606
					tc.rotation = -57.389
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -245.891
					tc.right = -45.891
					tc.bottom = -74.293
					tc.top = 25.707
					tc.rotation = -53.993
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -245.046
					tc.right = -45.046
					tc.bottom = -73.203
					tc.top = 26.797
					tc.rotation = -50.846
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -244.115
					tc.right = -44.115
					tc.bottom = -72.124
					tc.top = 27.876
					tc.rotation = -47.937
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -243.099
					tc.right = -43.099
					tc.bottom = -71.056
					tc.top = 28.944
					tc.rotation = -45.251
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -242.000
					tc.right = -42.000
					tc.bottom = -70.000
					tc.top = 30.000
					tc.rotation = -42.771
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -240.819
					tc.right = -40.819
					tc.bottom = -68.956
					tc.top = 31.044
					tc.rotation = -40.481
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -239.559
					tc.right = -39.559
					tc.bottom = -67.924
					tc.top = 32.076
					tc.rotation = -38.364
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -238.219
					tc.right = -38.219
					tc.bottom = -66.905
					tc.top = 33.095
					tc.rotation = -36.405
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -236.803
					tc.right = -36.803
					tc.bottom = -65.899
					tc.top = 34.101
					tc.rotation = -34.588
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -235.311
					tc.right = -35.311
					tc.bottom = -64.906
					tc.top = 35.094
					tc.rotation = -32.901
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -233.745
					tc.right = -33.745
					tc.bottom = -63.926
					tc.top = 36.074
					tc.rotation = -31.331
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -232.106
					tc.right = -32.106
					tc.bottom = -62.959
					tc.top = 37.041
					tc.rotation = -29.867
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -230.395
					tc.right = -30.395
					tc.bottom = -62.007
					tc.top = 37.993
					tc.rotation = -28.498
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -228.615
					tc.right = -28.615
					tc.bottom = -61.069
					tc.top = 38.931
					tc.rotation = -27.216
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -226.767
					tc.right = -26.767
					tc.bottom = -60.145
					tc.top = 39.855
					tc.rotation = -26.013
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -224.852
					tc.right = -24.852
					tc.bottom = -59.236
					tc.top = 40.764
					tc.rotation = -24.881
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -222.872
					tc.right = -22.872
					tc.bottom = -58.342
					tc.top = 41.658
					tc.rotation = -23.813
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -220.827
					tc.right = -20.827
					tc.bottom = -57.463
					tc.top = 42.537
					tc.rotation = -22.804
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -218.721
					tc.right = -18.721
					tc.bottom = -56.599
					tc.top = 43.401
					tc.rotation = -21.848
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -216.554
					tc.right = -16.554
					tc.bottom = -55.752
					tc.top = 44.248
					tc.rotation = -20.941
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -214.327
					tc.right = -14.327
					tc.bottom = -54.920
					tc.top = 45.080
					tc.rotation = -20.078
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -212.042
					tc.right = -12.042
					tc.bottom = -54.105
					tc.top = 45.895
					tc.rotation = -19.256
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -209.701
					tc.right = -9.701
					tc.bottom = -53.306
					tc.top = 46.694
					tc.rotation = -18.470
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -207.305
					tc.right = -7.305
					tc.bottom = -52.525
					tc.top = 47.475
					tc.rotation = -17.719
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -204.856
					tc.right = -4.856
					tc.bottom = -51.760
					tc.top = 48.240
					tc.rotation = -16.998
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -202.355
					tc.right = -2.355
					tc.bottom = -51.013
					tc.top = 48.987
					tc.rotation = -16.305
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -199.803
					tc.right = 0.197
					tc.bottom = -50.283
					tc.top = 49.717
					tc.rotation = -15.639
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -197.202
					tc.right = 2.798
					tc.bottom = -49.572
					tc.top = 50.428
					tc.rotation = -14.996
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -194.554
					tc.right = 5.446
					tc.bottom = -48.878
					tc.top = 51.122
					tc.rotation = -14.375
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -191.859
					tc.right = 8.141
					tc.bottom = -48.203
					tc.top = 51.797
					tc.rotation = -13.774
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -189.120
					tc.right = 10.880
					tc.bottom = -47.547
					tc.top = 52.453
					tc.rotation = -13.191
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -186.339
					tc.right = 13.661
					tc.bottom = -46.910
					tc.top = 53.090
					tc.rotation = -12.625
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -183.515
					tc.right = 16.485
					tc.bottom = -46.292
					tc.top = 53.708
					tc.rotation = -12.075
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -180.651
					tc.right = 19.349
					tc.bottom = -45.694
					tc.top = 54.306
					tc.rotation = -11.538
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -177.749
					tc.right = 22.251
					tc.bottom = -45.115
					tc.top = 54.885
					tc.rotation = -11.015
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -174.810
					tc.right = 25.190
					tc.bottom = -44.557
					tc.top = 55.443
					tc.rotation = -10.503
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -171.835
					tc.right = 28.165
					tc.bottom = -44.019
					tc.top = 55.981
					tc.rotation = -10.001
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -168.825
					tc.right = 31.175
					tc.bottom = -43.501
					tc.top = 56.499
					tc.rotation = -9.510
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -165.783
					tc.right = 34.217
					tc.bottom = -43.005
					tc.top = 56.995
					tc.rotation = -9.027
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -162.710
					tc.right = 37.290
					tc.bottom = -42.529
					tc.top = 57.471
					tc.rotation = -8.552
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -159.607
					tc.right = 40.393
					tc.bottom = -42.076
					tc.top = 57.924
					tc.rotation = -8.085
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -156.476
					tc.right = 43.524
					tc.bottom = -41.643
					tc.top = 58.357
					tc.rotation = -7.623
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -153.318
					tc.right = 46.682
					tc.bottom = -41.233
					tc.top = 58.767
					tc.rotation = -7.167
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -150.135
					tc.right = 49.865
					tc.bottom = -40.845
					tc.top = 59.155
					tc.rotation = -6.716
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -146.928
					tc.right = 53.072
					tc.bottom = -40.480
					tc.top = 59.520
					tc.rotation = -6.269
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -143.699
					tc.right = 56.301
					tc.bottom = -40.137
					tc.top = 59.863
					tc.rotation = -5.826
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -140.449
					tc.right = 59.551
					tc.bottom = -39.818
					tc.top = 60.182
					tc.rotation = -5.385
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -137.179
					tc.right = 62.821
					tc.bottom = -39.522
					tc.top = 60.478
					tc.rotation = -4.947
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -133.892
					tc.right = 66.108
					tc.bottom = -39.249
					tc.top = 60.751
					tc.rotation = -4.511
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -130.588
					tc.right = 69.412
					tc.bottom = -39.001
					tc.top = 60.999
					tc.rotation = -4.075
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -127.269
					tc.right = 72.731
					tc.bottom = -38.776
					tc.top = 61.224
					tc.rotation = -3.641
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -123.937
					tc.right = 76.063
					tc.bottom = -38.576
					tc.top = 61.424
					tc.rotation = -3.206
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -120.593
					tc.right = 79.407
					tc.bottom = -38.401
					tc.top = 61.599
					tc.rotation = -2.771
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -117.239
					tc.right = 82.761
					tc.bottom = -38.250
					tc.top = 61.750
					tc.rotation = -2.335
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -113.875
					tc.right = 86.125
					tc.bottom = -38.125
					tc.top = 61.875
					tc.rotation = -1.898
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -110.504
					tc.right = 89.496
					tc.bottom = -38.025
					tc.top = 61.975
					tc.rotation = -1.458
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -107.127
					tc.right = 92.873
					tc.bottom = -37.951
					tc.top = 62.049
					tc.rotation = -1.016
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -103.745
					tc.right = 96.255
					tc.bottom = -37.903
					tc.top = 62.097
					tc.rotation = -0.571
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -100.361
					tc.right = 99.639
					tc.bottom = -37.882
					tc.top = 62.118
					tc.rotation = -0.122
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -96.975
					tc.right = 103.025
					tc.bottom = -37.887
					tc.top = 62.113
					tc.rotation = 0.331
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -93.588
					tc.right = 106.412
					tc.bottom = -37.919
					tc.top = 62.081
					tc.rotation = 0.788
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -90.203
					tc.right = 109.797
					tc.bottom = -37.978
					tc.top = 62.022
					tc.rotation = 1.251
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -86.821
					tc.right = 113.179
					tc.bottom = -38.064
					tc.top = 61.936
					tc.rotation = 1.719
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -83.444
					tc.right = 116.556
					tc.bottom = -38.178
					tc.top = 61.822
					tc.rotation = 2.194
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -80.072
					tc.right = 119.928
					tc.bottom = -38.320
					tc.top = 61.680
					tc.rotation = 2.676
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -76.708
					tc.right = 123.292
					tc.bottom = -38.490
					tc.top = 61.510
					tc.rotation = 3.165
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -73.352
					tc.right = 126.648
					tc.bottom = -38.689
					tc.top = 61.311
					tc.rotation = 3.662
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -70.006
					tc.right = 129.994
					tc.bottom = -38.916
					tc.top = 61.084
					tc.rotation = 4.168
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -66.673
					tc.right = 133.327
					tc.bottom = -39.172
					tc.top = 60.828
					tc.rotation = 4.684
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -63.352
					tc.right = 136.648
					tc.bottom = -39.458
					tc.top = 60.542
					tc.rotation = 5.209
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -60.047
					tc.right = 139.953
					tc.bottom = -39.773
					tc.top = 60.227
					tc.rotation = 5.745
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -56.757
					tc.right = 143.243
					tc.bottom = -40.118
					tc.top = 59.882
					tc.rotation = 6.293
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -53.486
					tc.right = 146.514
					tc.bottom = -40.493
					tc.top = 59.507
					tc.rotation = 6.853
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -50.233
					tc.right = 149.767
					tc.bottom = -40.899
					tc.top = 59.101
					tc.rotation = 7.427
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -47.001
					tc.right = 152.999
					tc.bottom = -41.335
					tc.top = 58.665
					tc.rotation = 8.014
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -43.791
					tc.right = 156.209
					tc.bottom = -41.802
					tc.top = 58.198
					tc.rotation = 8.616
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -40.605
					tc.right = 159.395
					tc.bottom = -42.300
					tc.top = 57.700
					tc.rotation = 9.234
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -37.444
					tc.right = 162.556
					tc.bottom = -42.830
					tc.top = 57.170
					tc.rotation = 9.868
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -34.310
					tc.right = 165.690
					tc.bottom = -43.391
					tc.top = 56.609
					tc.rotation = 10.520
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -31.203
					tc.right = 168.797
					tc.bottom = -43.984
					tc.top = 56.016
					tc.rotation = 11.191
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -28.126
					tc.right = 171.874
					tc.bottom = -44.610
					tc.top = 55.390
					tc.rotation = 11.882
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -25.080
					tc.right = 174.920
					tc.bottom = -45.268
					tc.top = 54.732
					tc.rotation = 12.594
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -22.067
					tc.right = 177.933
					tc.bottom = -45.959
					tc.top = 54.041
					tc.rotation = 13.328
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -19.088
					tc.right = 180.912
					tc.bottom = -46.683
					tc.top = 53.317
					tc.rotation = 14.086
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -16.144
					tc.right = 183.856
					tc.bottom = -47.440
					tc.top = 52.560
					tc.rotation = 14.869
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -13.237
					tc.right = 186.763
					tc.bottom = -48.231
					tc.top = 51.769
					tc.rotation = 15.679
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -10.369
					tc.right = 189.631
					tc.bottom = -49.056
					tc.top = 50.944
					tc.rotation = 16.516
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -7.540
					tc.right = 192.460
					tc.bottom = -49.914
					tc.top = 50.086
					tc.rotation = 17.383
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -4.753
					tc.right = 195.247
					tc.bottom = -50.808
					tc.top = 49.192
					tc.rotation = 18.281
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = -2.009
					tc.right = 197.991
					tc.bottom = -51.736
					tc.top = 48.264
					tc.rotation = 19.212
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 0.691
					tc.right = 200.691
					tc.bottom = -52.699
					tc.top = 47.301
					tc.rotation = 20.178
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 3.345
					tc.right = 203.345
					tc.bottom = -53.697
					tc.top = 46.303
					tc.rotation = 21.181
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 5.952
					tc.right = 205.952
					tc.bottom = -54.730
					tc.top = 45.270
					tc.rotation = 22.223
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 8.509
					tc.right = 208.509
					tc.bottom = -55.800
					tc.top = 44.200
					tc.rotation = 23.305
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 11.017
					tc.right = 211.017
					tc.bottom = -56.905
					tc.top = 43.095
					tc.rotation = 24.430
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 13.473
					tc.right = 213.473
					tc.bottom = -58.047
					tc.top = 41.953
					tc.rotation = 25.601
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 15.875
					tc.right = 215.875
					tc.bottom = -59.225
					tc.top = 40.775
					tc.rotation = 26.819
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 18.223
					tc.right = 218.223
					tc.bottom = -60.440
					tc.top = 39.560
					tc.rotation = 28.087
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 20.515
					tc.right = 220.515
					tc.bottom = -61.692
					tc.top = 38.308
					tc.rotation = 29.407
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 22.748
					tc.right = 222.748
					tc.bottom = -62.982
					tc.top = 37.018
					tc.rotation = 30.782
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 24.923
					tc.right = 224.923
					tc.bottom = -64.309
					tc.top = 35.691
					tc.rotation = 32.213
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 27.037
					tc.right = 227.037
					tc.bottom = -65.674
					tc.top = 34.326
					tc.rotation = 33.703
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 29.089
					tc.right = 229.089
					tc.bottom = -67.078
					tc.top = 32.922
					tc.rotation = 35.255
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 31.077
					tc.right = 231.077
					tc.bottom = -68.519
					tc.top = 31.481
					tc.rotation = 36.870
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 33.000
					tc.right = 233.000
					tc.bottom = -70.000
					tc.top = 30.000
					tc.rotation = 38.550
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 34.856
					tc.right = 234.856
					tc.bottom = -71.520
					tc.top = 28.480
					tc.rotation = 40.296
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 36.645
					tc.right = 236.645
					tc.bottom = -73.078
					tc.top = 26.922
					tc.rotation = 42.110
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 38.364
					tc.right = 238.364
					tc.bottom = -74.677
					tc.top = 25.323
					tc.rotation = 43.992
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 40.011
					tc.right = 240.011
					tc.bottom = -76.315
					tc.top = 23.685
					tc.rotation = 45.943
					tc.scaleX = 1.000
					tc.scaleY = 1.000
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 41.587
					tc.right = 241.587
					tc.bottom = -77.993
					tc.top = 22.007
					tc.rotation = 47.962
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
					tc = tp.getChildByName('字体模板')
					if tc then
					tc.name = '字体模板'
					tc.left = 43.088
					tc.right = 243.088
					tc.bottom = -79.712
					tc.top = 20.288
					tc.rotation = 50.048
					tc.text = '.'
					tc.font = 0x62200041
					tc.style = 13
					tc.outlineSize = 5.000
					tp = tc
					tp = tp.parent
					end
					--end
				tp = tp.parent
				end
				--end
			com = tp.c_curved_text
			com['text'] ='................................................................................................................'
			com['p0x'] =-142.000
			com['p0y'] =-20.000
			com['p1x'] =-104.000
			com['p1y'] =15.000
			com['p2x'] =70.000
			com['p2y'] =30.000
			com['p3x'] =133.000
			com['p3y'] =-20.000
			com['space'] =1.000
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

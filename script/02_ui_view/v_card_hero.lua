--[[0

]]
local G = require 'gf'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_card_hero = require 'c_card_hero'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_card_hero'
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
			tc.left = -167.000
			tc.right = 167.000
			tc.bottom = -137.000
			tc.top = 249.000
			tc.mask = 10
			tc.shapeimg = 0x560c000c
			tc.SetVertexBuf(47,{0.0,0.0,-159.0,-30.5,-160.0,-30.5,-160.0,-88.5,-158.0,-88.5,-157.0,-159.5,-158.0,-160.5,-158.0,-172.5,152.0,-172.5,154.0,-171.5,154.0,-57.5,157.0,-56.5,156.0,-55.5,156.0,-44.5,159.0,-43.5,157.0,-39.5,157.0,-26.5,158.0,-23.5,156.0,-20.5,156.0,-4.5,157.0,-3.5,154.0,5.5,151.0,27.5,153.0,28.5,148.0,42.5,142.0,49.5,140.0,68.5,137.0,70.5,132.0,78.5,118.0,95.5,114.0,102.5,78.0,141.5,41.0,164.5,18.0,172.5,-6.0,173.5,-25.0,167.5,-54.0,154.5,-92.0,128.5,-121.0,97.5,-128.0,87.5,-142.0,60.5,-146.0,49.5,-150.0,46.5,-151.0,40.5,-150.0,40.5,-155.0,19.5,-159.0,-30.5}, {0,0},0xffffffff)
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
			tc.anchor = 0x3c3c3232
			tc.scaleX = 0.800
			tc.scaleY = 0.800
			tc.img = 0x5601000b
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景'
		tc.left = -177.000
		tc.right = 177.000
		tc.bottom = -259.000
		tc.top = 259.000
		tc.img = 0x560c000d
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '职业图标3'
		tc.left = -105.500
		tc.right = -14.500
		tc.bottom = -266.000
		tc.top = -174.000
		tc.visible = false
		tc.scaleX = 0.800
		tc.scaleY = 0.800
		tc.img = 0x560d0002
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '职业图标2'
		tc.left = 14.500
		tc.right = 105.500
		tc.bottom = -266.000
		tc.top = -174.000
		tc.visible = false
		tc.scaleX = 0.800
		tc.scaleY = 0.800
		tc.img = 0x560d0002
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '职业图标1'
		tc.left = -45.500
		tc.right = 45.500
		tc.bottom = -274.000
		tc.top = -182.000
		tc.visible = false
		tc.img = 0x560d0002
		tp = tc
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '名称板'
		tc.left = -212.000
		tc.right = 220.000
		tc.bottom = -287.000
		tc.top = -39.000
		tc.scaleX = 0.500
		tc.scaleY = 0.500
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '名称字符'
			tc.left = -80.000
			tc.right = 80.000
			tc.top = 0.000
			tc.anchor = 0x64003232
			tc.scaleX = 1.890
			tc.scaleY = 1.890
			tc.text = '黑曜石雕像'
			tc.font = 0x62200041
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
		tc.name = '属性值组合'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '生命值'
			tc.left = 131.329
			tc.right = 202.829
			tc.bottom = -131.145
			tc.top = -18.645
			tc.scaleX = 0.950
			tc.scaleY = 0.950
			tc.img = 0x560b0002
			tp = tc
				tc = G.TextQuad()
				tp.addChild(tc)
				tc.name = '生命值数值'
				tc.left = 0.158
				tc.right = 0.158
				tc.bottom = -16.658
				tc.top = 18.342
				tc.scaleX = 1.400
				tc.scaleY = 1.400
				tc.font = 0x63410000
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
	tp.c_card_hero = setmetatable({}, c_card_hero)
	com = tp.c_card_hero
	com['hp'] =nil
	tp = tp.parent
	--end

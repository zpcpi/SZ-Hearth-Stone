--[[0

]]
local G = require 'gf'
local c_battle_result = require 'c_battle_result'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_result'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'Background'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tc.mouseEnabled = true
	tc.color = 0x0
	tc.alpha = 50
	tc.img = 0x56000001
	tp = tc
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'Win'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tp = tc
		tc = G.TextQuad()
		tp.addChild(tc)
		tc.name = 'Text'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.text = '胜利'
		tc.font = 0x63400000
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = 'Lose'
	tc.right = 0.000
	tc.top = 0.000
	tc.anchor = 0x64006400
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'c1'
		tc.left = -251.156
		tc.right = 508.844
		tc.bottom = -201.522
		tc.top = 283.478
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56300001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'c2'
		tc.left = -380.000
		tc.right = 380.000
		tc.bottom = -74.500
		tc.top = 410.500
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56300002
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'L1'
		tc.left = -512.000
		tc.right = 248.000
		tc.bottom = -160.500
		tc.top = 324.500
		tc.rotation = 32.000
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56300003
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'c11'
		tc.left = -146.000
		tc.right = 614.000
		tc.bottom = -80.500
		tc.top = 404.500
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56300001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'R1'
		tc.left = -254.000
		tc.right = 506.000
		tc.bottom = -168.500
		tc.top = 316.500
		tc.rotation = -91.000
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56300004
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'R2'
		tc.left = -224.000
		tc.right = 536.000
		tc.bottom = -270.500
		tc.top = 214.500
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56300005
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'c6'
		tc.left = -329.333
		tc.right = 430.667
		tc.bottom = -301.595
		tc.top = 183.405
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56300006
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'c7'
		tc.left = -430.476
		tc.right = 329.524
		tc.bottom = -312.976
		tc.top = 172.024
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56300007
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'L2'
		tc.left = -538.000
		tc.right = 222.000
		tc.bottom = -263.167
		tc.top = 221.833
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56300009
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'c11'
		tc.left = -491.000
		tc.right = 269.000
		tc.bottom = -251.111
		tc.top = 233.889
		tc.rotation = -2.000
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x5630000b
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'c12'
		tc.left = -284.724
		tc.right = 475.276
		tc.bottom = -340.041
		tc.top = 144.959
		tc.rotation = -266.000
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x5630000c
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'c8'
		tc.left = -373.333
		tc.right = 386.667
		tc.bottom = -366.595
		tc.top = 118.405
		tc.rotation = 5.000
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x56300008
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = 'Text'
			tc.left = -91.000
			tc.right = 91.000
			tc.bottom = -58.500
			tc.top = 34.500
			tc.text = '败北'
			tc.font = 0x623b0000
			tc.outlineSize = 0.000
			tp = tc
			tp = tp.parent
			--end
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'Player'
		tc.left = -180.000
		tc.right = 180.000
		tc.bottom = -265.000
		tc.top = 265.000
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x560c000a
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'L3'
		tc.left = -491.333
		tc.right = 268.667
		tc.bottom = -399.167
		tc.top = 85.833
		tc.scaleX = 0.400
		tc.scaleY = 0.400
		tc.img = 0x5630000a
		tp = tc
		tp = tp.parent
		--end
	tp = tp.parent
	--end
tp.c_battle_result = setmetatable({}, c_battle_result)

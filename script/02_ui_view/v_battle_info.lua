--[[0

]]
local G = require 'gf'
local c_animactor = require 'c_animactor'
local c_mintextquadsize = require 'c_mintextquadsize'
local c_battle_info = require 'c_battle_info'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_battle_info'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '伤害信息'
	tc.left = -50.000
	tc.right = 50.000
	tc.bottom = -50.000
	tc.top = 50.000
	tc.visible = false
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '底图'
		tc.left = -256.000
		tc.right = 256.000
		tc.bottom = -256.000
		tc.top = 256.000
		tc.scaleX = 0.500
		tc.scaleY = 0.500
		tc.img = 0x56250008
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '信息数值'
			tc.left = -23.000
			tc.right = 23.000
			tc.bottom = 12.500
			tc.top = 47.500
			tc.rotation = -21.000
			tc.scaleX = 3.000
			tc.scaleY = 3.000
			tc.text = '-3'
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
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '治疗信息'
	tc.left = 187.421
	tc.right = 287.421
	tc.bottom = -40.053
	tc.top = 59.947
	tc.visible = false
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '底图'
		tc.left = -256.000
		tc.right = 256.000
		tc.bottom = -256.000
		tc.top = 256.000
		tc.scaleX = 0.500
		tc.scaleY = 0.500
		tc.img = 0x56250004
		tp = tc
			tc = G.TextQuad()
			tp.addChild(tc)
			tc.name = '信息数值'
			tc.left = -37.000
			tc.right = 37.000
			tc.bottom = -0.500
			tc.top = 34.500
			tc.rotation = -21.000
			tc.scaleX = 3.000
			tc.scaleY = 3.000
			tc.text = '+3'
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
	tc = G.loadUI('v_animactor')
	tc.prefab = true
	tp.addChild(tc)
	tc.name = '动画控件'
	tc.left = -640.000
	tc.right = 640.000
	tc.bottom = -360.000
	tc.top = 360.000
	tp = tc
	tp.c_animactor = setmetatable({}, c_animactor)
	tp = tp.parent
	--end
tp.c_battle_info = setmetatable({}, c_battle_info)

--[[0

]]
local G = require 'gf'
local c_tip = require 'c_tip'
local c_mintextquadsize = require 'c_mintextquadsize'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_tip'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'Background'
	tc.left = -211.500
	tc.right = 211.500
	tc.bottom = -32.000
	tc.top = 32.000
	tc.img = 0x56000001
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'TipText'
	tc.left = -119.000
	tc.right = 119.000
	tc.bottom = -17.000
	tc.top = 17.000
	tc.text = '你已经断开连接'
	tc.font = 0x63200041
	tc.style = 2
	tp = tc
	tp.c_mintextquadsize = setmetatable({}, c_mintextquadsize)
	com = tp.c_mintextquadsize
	com['minWidth'] =0.000
	com['autowidth'] =true
	tp = tp.parent
	--end
tp.c_tip = setmetatable({}, c_tip)

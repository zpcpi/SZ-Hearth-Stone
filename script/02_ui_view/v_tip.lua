--[[0

]]
local G = require 'gf'
local c_tip = require 'c_tip'
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
	tc.left = -256.000
	tc.right = 256.000
	tc.bottom = -256.000
	tc.top = 256.000
	tc.img = 0x562d0001
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'TipText'
	tc.left = -176.500
	tc.right = 176.500
	tc.bottom = -48.000
	tc.top = 48.000
	tc.text = '你已经断开连接'
	tc.wrap = true
	tc.font = 0x621e0000
	tc.style = 2
	tp = tc
	tp = tp.parent
	--end
tp.c_tip = setmetatable({}, c_tip)

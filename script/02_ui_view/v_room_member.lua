--[[0

]]
local G = require 'gf'
local c_room_member = require 'c_room_member'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_room_member'
tc.left = -134.000
tc.right = 134.000
tc.bottom = -200.000
tc.top = 200.000
tp = tc
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'Background'
	tc.left = -134.000
	tc.right = 134.000
	tc.bottom = -200.000
	tc.top = 200.000
	tc.img = 0x56000001
	tp = tc
	tp = tp.parent
	--end
	tc = G.Quad()
	tp.addChild(tc)
	tc.name = 'Head'
	tc.left = -120.000
	tc.right = 120.000
	tc.bottom = -94.000
	tc.top = 146.000
	tc.img = 0x56010008
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'PlayerName'
	tc.left = -100.000
	tc.bottom = 148.000
	tc.top = 198.000
	tc.color = 0x0
	tc.text = '炉石牌手'
	tc.font = 0x63200041
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'PlayerStatus'
	tc.left = -100.000
	tc.bottom = -192.000
	tc.top = -106.000
	tc.color = 0x0
	tc.text = '准备就绪'
	tc.font = 0x63200041
	tp = tc
	tp = tp.parent
	--end
tp.c_room_member = setmetatable({}, c_room_member)

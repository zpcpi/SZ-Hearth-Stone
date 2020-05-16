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
	tc.left = -112.500
	tc.right = 112.500
	tc.bottom = -165.000
	tc.top = 165.000
	tc.mask = -10
	tc.img = 0x560c000a
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
	tc.visible = false
	tc.img = 0x56010008
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'PlayerStatus'
	tc.left = -97.000
	tc.right = 103.000
	tc.bottom = -96.000
	tc.top = -10.000
	tc.text = '准备就绪'
	tc.font = 0x62140000
	tc.style = 16
	tp = tc
	tp = tp.parent
	--end
	tc = G.TextQuad()
	tp.addChild(tc)
	tc.name = 'PlayerName'
	tc.left = -97.000
	tc.right = 103.000
	tc.bottom = -147.000
	tc.top = -61.000
	tc.text = '炉石玩家'
	tc.font = 0x62180000
	tp = tc
	tp = tp.parent
	--end
tp.c_room_member = setmetatable({}, c_room_member)

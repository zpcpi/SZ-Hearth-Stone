--[[2002

]]
local G = require 'gf'
local c_animactor = require 'c_animactor'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_animactor'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
tp.c_animactor = setmetatable({}, c_animactor)

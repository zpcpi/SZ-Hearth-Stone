--[[300c

]]

local G = require "gf"
local t = G.com()
function t:init()
end

function t:mouseUp(tar)
    G.trig_event('UI_卡牌确认使用', '我方')
end

return t
--[[3009

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.tipText = self.obj.getChildByName('TipText')
end

function t:setData(tipText)
    self.tipText.text = tostring(tipText)
    print('--== tostring(tipText)', tostring(tipText))
end

return t
--[[3014

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.giveupButton = self.obj.getChildByName('Button')
end

function t:click(tar)
    if tar == self.giveupButton then 
        G.call('对决_投降')
    end
end

return t
--[[3012

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.returnButton = self.obj.getChildByName('ReturnButton')
end

function t:click(tar)
    if tar == self.returnButton then
        G.call('收藏_退出收藏界面')
    end
end

return t
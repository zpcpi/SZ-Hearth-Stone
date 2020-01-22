--[[3013

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.winNode = self.obj.getChildByName('Win')
    self.loseNode = self.obj.getChildByName('Lose')
end

function t:setData(isWin)
    if isWin then 
        self.winNode.visible = true
        self.loseNode.visible = false
    else
        self.winNode.visible = false
        self.loseNode.visible = true
    end
end

function t:click(tar)
    local node = G.changeUI('v_room')
    if node then 
        node.c_room:UpdateRoom()
    end
end

return t

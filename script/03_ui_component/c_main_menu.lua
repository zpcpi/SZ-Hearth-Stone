--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.hostGameBtn = self.obj.getChildByName('HostGame')
    self.connectGameBtn = self.obj.getChildByName('ConnectGame')
    self.quitGameBtn = self.obj.getChildByName('QuitGame')
end

function t:click(tar)
    if tar == self.hostGameBtn then 
        G.addUI('v_room')
        G.removeUI('v_main_menu')
    elseif tar == self.connectGameBtn then 
        G.addUI('v_connect')
    elseif tar == self.quitGameBtn then 
    end
end

return t
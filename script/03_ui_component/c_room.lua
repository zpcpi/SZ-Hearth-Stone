--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.gameModeBtn = self.obj.getChildByName('HostGame')
    self.startGameBtn = self.obj.getChildByName('StartGame')
    self.prepareBtn = self.obj.getChildByName('Prepare')
    self.quitBtn = self.obj.getChildByName('Quit')
end

function t:click(tar)
    if tar == self.gameModeBtn then 
    elseif tar == self.startGameBtn then 
        -- TODO: 判断游戏模式
        G.addUI('v_battle_1v1')
        G.removeUI('v_room')
    elseif tar == self.prepareBtn then 
    elseif tar == self.quitBtn then 
        G.addUI('v_main_menu')
        G.removeUI('v_room')
    end
end

return t
--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.hostGameBtn = self.obj.getChildByName('HostGame')
    self.connectGameBtn = self.obj.getChildByName('ConnectGame')
    self.quitGameBtn = self.obj.getChildByName('QuitGame')

    self.playerName = self.obj.getChildByName('PlayerName').getChildByName('PlayerNameText')
    self.playerName.text = G.misc().玩家信息.玩家名称
    self.oldPlayerName = self.playerName.text
end

function t:click(tar)
    if tar == self.hostGameBtn then 
        G.call('主机_新建房间')
    elseif tar == self.connectGameBtn then 
        G.addUI('v_connect')
    elseif tar == self.quitGameBtn then 
    end
end

function t:update()
    if G.is_editor then 
        return 
    end

    local newName = self.playerName.text
    if self.oldPlayerName ~= newName then 
        self.oldPlayerName = newName
        G.call('系统_设置玩家名称', newName)
    end
end

return t
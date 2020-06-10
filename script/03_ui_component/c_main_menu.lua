--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.hostGameBtn = self.obj.getChildByName('HostGame')
    self.connectGameBtn = self.obj.getChildByName('ConnectGame')
    self.collectionBtn = self.obj.getChildByName('Collection')
    self.quitGameBtn = self.obj.getChildByName('QuitGame')

    self.playerName = self.obj.getChildByName('PlayerName').getChildByName('PlayerNameText')
    local any_当前玩家信息 = G.call('系统_获取当前玩家信息')
    self.playerName.text = any_当前玩家信息.玩家名称
    self.oldPlayerName = self.playerName.text
end

function t:click(tar)
    if tar == self.hostGameBtn then 
        G.call('主机_新建房间')
    elseif tar == self.connectGameBtn then 
        if G.IsSteamAvaliable() then 
            G.addUI('v_room_list')
        else
            G.addUI('v_connect')
        end
    elseif tar == self.collectionBtn then 
        G.call('收藏_进入收藏界面')
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
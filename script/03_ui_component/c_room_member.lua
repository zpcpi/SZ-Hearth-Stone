--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.playerName = self.obj.getChildByName('PlayerName')
    self.playerStatus = self.obj.getChildByName('PlayerStatus')
end

function t:UpdatePlayerInfo(o_battle_player_玩家信息)
    self.playerName.text = o_battle_player_玩家信息.玩家名称 or ''
    if o_battle_player_玩家信息.是主机 then 
        self:SetPlayerStatus('主机')
    elseif o_battle_player_玩家信息.准备就绪 then 
        self:SetPlayerStatus('准备就绪')
    else
        self:SetPlayerStatus('未准备')
    end
    
end

function t:SetPlayerStatus(status)
    self.playerStatus.text = tostring(status)
end

return t
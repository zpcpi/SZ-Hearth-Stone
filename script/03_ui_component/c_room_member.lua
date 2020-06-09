--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.playerName = self.obj.getChildByName('PlayerName')
    self.playerStatus = self.obj.getChildByName('PlayerStatus')
end

function t:UpdatePlayerInfo(o_room_player_玩家信息)
    self.playerName.text = o_room_player_玩家信息.玩家名称 or ''
    if o_room_player_玩家信息.是主机 then 
        self:SetPlayerStatus('主机')
    elseif o_room_player_玩家信息.准备就绪 then 
        self:SetPlayerStatus('准备就绪')
    else
        self:SetPlayerStatus('未准备')
    end
end

function t:UpdatePlayerInfoByIndex(memberIndex)
    self.playerName.text = G.Steam_GetLobbyMemberName(memberIndex)
    if G.Steam_IsLobbyMemberOwner(memberIndex) then 
        self:SetPlayerStatus('主机')
    else
        local isReady = G.Steam_GetLobbyMemberData(memberIndex, 'Ready') == '1'
        if isReady then 
            self:SetPlayerStatus('准备就绪')    
        else
            self:SetPlayerStatus('未就绪')
        end
    end
end

function t:SetPlayerStatus(status)
    self.playerStatus.text = tostring(status)
end

return t
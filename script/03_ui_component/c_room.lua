--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.gameModeBtn = self.obj.getChildByName('HostGame')
    self.startGameBtn = self.obj.getChildByName('StartGame')
    self.prepareBtn = self.obj.getChildByName('Prepare')
    self.quitBtn = self.obj.getChildByName('Quit')

    self.roomMemberParent = self.obj.getChildByName('RoomMember')

    if not G.is_editor then 
        self:UpdateRoomMember()
    end
end

function t:UpdateRoomMember()
    self.roomMemberParent.removeAllChildren()
    local _o_battle_player_对决玩家信息列表 = G.call('对决_获取对决玩家信息列表')
    for _, o_battle_player_对决玩家 in ipairs(_o_battle_player_对决玩家信息列表) do 
        local node = G.loadUI('v_room_member')
        self.roomMemberParent.addChild(node)
        node.c_room_member:UpdatePlayerInfo(o_battle_player_对决玩家)
    end
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
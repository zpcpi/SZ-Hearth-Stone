--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.gameModeBtn = self.obj.getChildByName('HostGame')
    self.startGameBtn = self.obj.getChildByName('StartGame')
    self.prepareBtn = self.obj.getChildByName('Prepare')
    self.quitBtn = self.obj.getChildByName('Quit')

    self.ipText = self.obj.getChildByName('IP').getChildByName('IPText')
    self.ipText.text = G.call('系统_获取本机IP地址')

    self.roomMemberParent = self.obj.getChildByName('RoomMember')

    self.roomInfoParent = self.obj.getChildByName('Info').getChildByName('content')
    self.infoTextTemp = self.roomInfoParent.getChildByName('TextTemplate')
    self.infoTextTemp.visible = false

    self:ResetRoomMember()
end

function t:ResetRoomMember()
    self.roomMemberParent.removeAllChildren()
end

function t:UpdateRoomMember()
    self:ResetRoomMember()
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
        G.call('主机_断开连接')
    end
end

function t:AddInfo(info)
    local textQuad = G.Clone(self.infoTextTemp)
    textQuad.visible = true
    textQuad.text = tostring(info)
    self.roomInfoParent.addChild(textQuad)
end

return t
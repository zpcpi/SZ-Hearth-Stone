--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.gameModeBtn = self.obj.getChildByName('HostGame')

    self.startGameBtn = self.obj.getChildByName('StartGame')
    self.prepareBtn = self.obj.getChildByName('Prepare')
    if G.call('主机_是主机') then 
        self.startGameBtn.visible = true
        self.prepareBtn.visible = false
    else
        self.startGameBtn.visible = false
        self.prepareBtn.visible = true
    end

    self.quitBtn = self.obj.getChildByName('Quit')

    self.ipText = self.obj.getChildByName('IP').getChildByName('IPText')
    self.ipText.text = G.call('网络通用_获取本机IP地址') .. ':' .. G.call('网络通用_获取主机端口')

    self.roomMemberParent = self.obj.getChildByName('RoomMember')

    self.roomInfoParent = self.obj.getChildByName('Info').getChildByName('content')
    self.infoTextTemp = self.roomInfoParent.getChildByName('TextTemplate')
    self.infoTextTemp.visible = false

    self:ResetRoomMember()
end

function t:ResetRoomMember()
    self.roomMemberParent.removeAllChildren()
end

function t:UpdateRoom()
    self.ipText.text = G.call('网络通用_获取本机IP地址') .. ':' .. G.call('网络通用_获取主机端口')
    self:UpdateRoomMember()
end

function t:UpdateRoomMember()
    self:ResetRoomMember()
    local _o_room_player_对决玩家信息列表 = G.call('房间_获取玩家信息列表')
    for _, o_room_player_对决玩家 in ipairs(_o_room_player_对决玩家信息列表) do 
        local node = G.loadUI('v_room_member')
        self.roomMemberParent.addChild(node)
        node.c_room_member:UpdatePlayerInfo(o_room_player_对决玩家)
    end
end

function t:click(tar)
    if tar == self.gameModeBtn then 
    elseif tar == self.startGameBtn then 
        G.call('对决_开始')
    elseif tar == self.prepareBtn then 
        G.call('房间_当前玩家准备')
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
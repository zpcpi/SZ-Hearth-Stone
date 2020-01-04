--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    if G.is_editor then 
        return
    end
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

    self.deckButton = self.obj.getChildByName('DeckInfo')
    self.deckList = self.obj.getChildByName('DeckList')
    self.deckList.visible = false
    self.deckListContent = self.deckList.getChildByName('content')

    self:ResetRoomMember()
end

function t:ResetRoomMember()
    self.roomMemberParent.removeAllChildren()
end

function t:UpdateRoom()
    self.ipText.text = G.call('网络通用_获取本机IP地址') .. ':' .. G.call('网络通用_获取主机端口')
    self:UpdateRoomMember()
    self:UpdateDeckInfo()
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

function t:UpdateDeckInfo()
    self.deckButton.c_button.text = '[03]请选择卡组'
    local o_deck_卡组 = G.call('对决_获取对决卡组')
    if o_deck_卡组 == nil then 
        return 
    end
    local deckName = G.call('收藏_获取卡组全称', o_deck_卡组)
    self.deckButton.c_button.text = deckName
end

function t:click(tar)
    if tar == self.gameModeBtn then 
    elseif tar == self.startGameBtn then 
        G.call('对决_开始')
    elseif tar == self.prepareBtn then 
        G.call('房间_当前玩家准备')
    elseif tar == self.quitBtn then 
        G.call('房间_退出房间')
    elseif tar == self.deckButton then 
        if self:IsDeckListVisible() then 
            self:HideDeckList()
        else
            self:ShowDeckList()
        end
    elseif tar.parent == self.deckListContent then
        local i_deck_卡组ID = math.floor(tar.data)
        local o_deck_卡组 = G.QueryName(i_deck_卡组ID)
        G.call('对决_设置对决卡组', o_deck_卡组)
        self:HideDeckList()
    end
end

function t:AddInfo(info)
    local textQuad = G.Clone(self.infoTextTemp)
    textQuad.visible = true
    textQuad.text = tostring(info)
    self.roomInfoParent.addChild(textQuad)
end

function t:ShowDeckList()
    self.deckList.visible = true
    self.deckListContent.removeAllChildren()
    local _o_deck_卡组列表 = G.call('收藏_获取所有卡组')
    for _, o_deck_卡组 in ipairs(_o_deck_卡组列表) do
        local deckButton = G.Clone(self.deckButton)
        deckButton.c_button.text = G.call('收藏_获取卡组全称', o_deck_卡组)
        deckButton.data = o_deck_卡组.name
        self.deckListContent.addChild(deckButton)
    end
end

function t:HideDeckList()
    self.deckList.visible = false
end

function t:IsDeckListVisible()
    return self.deckList.visible
end

return t
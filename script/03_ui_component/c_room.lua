--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    if G.is_editor then 
        return
    end
    self.startGameBtn = self.obj.getChildByName('StartGame')
    self.prepareBtn = self.obj.getChildByName('Prepare')
    if G.call('主机_是主机') then 
        self.startGameBtn.visible = true
        self.prepareBtn.visible = false
    else
        self.startGameBtn.visible = false
        self.prepareBtn.visible = true
        if G.call('房间_获取当前玩家准备状态') then 
            self.prepareBtn.c_button.state = 'c'
        else
            self.prepareBtn.c_button.state = 'n'
        end
    end

    self.quitBtn = self.obj.getChildByName('Quit')

    self.roomNameText = self.obj.getChildByName('IP').getChildByName('IPText')
    self.roomNameText.text = G.call('房间_获取当前房间名称')

    self.roomMemberParent = self.obj.getChildByName('RoomMember').getChildByName('content')

    self.roomInfoParent = self.obj.getChildByName('Info').getChildByName('content')
    self.infoTextTemp = self.roomInfoParent.getChildByName('TextTemplate')
    self.infoTextTemp.visible = false

    self.gameModeBtn = self.obj.getChildByName('GameMode')
    self.modeListNode = self.obj.getChildByName('ModeList')
    self.modeListNode.visible = false
    self.modeListContent = self.modeListNode.getChildByName('content')

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
    self.roomNameText.text = G.call('房间_获取当前房间名称')
    self:UpdateRoomMember()
    self:UpdateGameModeInfo()
    self:UpdateDeckInfo()
end

function t:UpdateRoomMember()
    self:ResetRoomMember()
    if G.IsSteamAvaliable() then 
        local roomMemberCount = G.Steam_GetLobbyMemberCount()
        for memberIndex = 0, roomMemberCount - 1 do 
            local node = G.loadUI('v_room_member')
            self.roomMemberParent.addChild(node)
            node.c_room_member:UpdatePlayerInfoByIndex(memberIndex)
        end
    else
        local _o_room_player_对决玩家信息列表 = G.call('房间_获取玩家信息列表')
        for _, o_room_player_对决玩家 in ipairs(_o_room_player_对决玩家信息列表) do 
            local node = G.loadUI('v_room_member')
            self.roomMemberParent.addChild(node)
            node.c_room_member:UpdatePlayerInfo(o_room_player_对决玩家)
        end
    end
end

function t:UpdateDeckInfo()
    self.deckButton.c_button.text = '[03]请选择卡组'
    local o_deck_卡组 = G.call('对决_获取当前玩家对决卡组')
    if o_deck_卡组 == nil then 
        return 
    end
    local deckName = G.call('收藏_获取卡组全称', o_deck_卡组)
    self.deckButton.c_button.text = deckName
end

function t:UpdateGameModeInfo()
    local i_game_mode_游戏模式 = G.call('对决_获取当前游戏模式')
    local o_game_mode_游戏模式 = G.QueryName(i_game_mode_游戏模式)
    local modeName = 'None'
    if o_game_mode_游戏模式 ~= nil then 
        modeName = o_game_mode_游戏模式.模式名称
    end
    self.gameModeBtn.c_button.text = modeName
end

function t:click(tar)
    if tar == self.gameModeBtn then 
        if not G.call('主机_是主机') then 
            G.call('提示_添加提示', '只有房主可以修改游戏模式')
            return
        end
        if self:IsModeListVisible() then 
            self:HideModeList()
        else
            self:ShowModeList()
        end
    elseif tar == self.startGameBtn then 
        G.call('对决_开始')
    elseif tar == self.prepareBtn then 
        self:OnPrepareButtonClick()
    elseif tar == self.quitBtn then 
        G.call('房间_退出房间')
    elseif tar == self.deckButton then 
        if G.call('房间_获取当前玩家准备状态') then 
            G.call('提示_添加提示', '请先解除准备状态, 再更换卡组')
            return 
        end
        if self:IsDeckListVisible() then 
            self:HideDeckList()
        else
            self:ShowDeckList()
        end
    elseif tar.parent == self.deckListContent then
        local i_deck_卡组ID = math.floor(tar.data)
        local o_deck_卡组 = G.QueryName(i_deck_卡组ID)
        G.call('对决_设置预设对决卡组', o_deck_卡组)
        self:HideDeckList()
    elseif tar.parent == self.modeListContent then
        local i_game_mode_游戏模式 = math.floor(tar.data)
        G.call('对决_设置游戏模式', i_game_mode_游戏模式)
        self:HideModeList()
    end
end

function t:OnPrepareButtonClick()
    self.prepareBtn.c_button.state = 'n'
    if not G.call('房间_获取当前玩家准备状态') then 
        if not G.call('房间_是否满足开始条件', false) then 
            return 
        end
    end
    G.call('房间_当前玩家准备')
    if not G.call('房间_获取当前玩家准备状态') then 
        self.prepareBtn.c_button.state = 'c'
    else
        self.prepareBtn.c_button.state = 'n'
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

function t:ShowModeList()
    self.modeListNode.visible = true
    self.modeListContent.removeAllChildren()
    local _i_game_mode_游戏模式列表 = G.call('对决_获取游戏模式列表')
    for index, i_game_mode_游戏模式 in ipairs(_i_game_mode_游戏模式列表) do 
        local gameModeBtn = G.Clone(self.gameModeBtn)
        local o_game_mode_游戏模式 = G.QueryName(i_game_mode_游戏模式)
        gameModeBtn.c_button.text = o_game_mode_游戏模式.模式名称
        gameModeBtn.data = i_game_mode_游戏模式
        self.modeListContent.addChild(gameModeBtn)
    end
end

function t:HideModeList()
    self.modeListNode.visible = false
end

function t:IsModeListVisible()
    return self.modeListNode.visible
end

return t
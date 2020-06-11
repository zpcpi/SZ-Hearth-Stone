--[[301a

]]

local G = require "gf"
local t = G.com()

local ONE_PAGE_MAX_LOBBY = 5

function t:init()
    self.backgroundImg = self.obj.getChildByName('Background')
    self.roomButtonParent = self.obj.getChildByName('RoomList').getChildByName('content')
    self.roomButtonOrigin = self.obj.getChildByName('RoomButton')
    self.roomButtonOrigin.visible = false
    self.roomInfoText = self.obj.getChildByName('RoomInfo').getChildByName('Info')
    self.roomButtonParent.removeAllChildren()
    self.roomInfoText.text = '正在获取房间列表...'
    self.joinLobbyIndex = nil
    if not G.is_editor then 
        G.Steam_RequestLobbyList()
    end
end

function t:UpdateRoomList(lobbyCount, resetCurPage)
    self.roomButtonParent.removeAllChildren()
    if resetCurPage ~= false then 
        self.curPage = 0
    end
    self.lobbyCount = lobbyCount
    local firstIndex = self.curPage * ONE_PAGE_MAX_LOBBY
    local lastIndex = firstIndex + ONE_PAGE_MAX_LOBBY - 1
    if self.curPage - 1 >= 0 then 
        self:AddRoomButton('上一页', -1)
    end
    for index = firstIndex, lastIndex do 
        self:AddRoomButton(G.Steam_GetLobbyName(index), index)
    end
    if (self.curPage + 1) * ONE_PAGE_MAX_LOBBY < self.lobbyCount then 
        self:AddRoomButton('下一页', -100)
    end
    self.roomInfoText.text = ''
    self.curSelectLobbyIndex = nil
end

function t:AddRoomButton(lobbyName, lobbyIndex)
    local roomButton = G.Clone(self.roomButtonOrigin)
    roomButton.visible = true
    roomButton.c_button.text = lobbyName
    roomButton.c_button.lobbyIndex = lobbyIndex
    self.roomButtonParent.addChild(roomButton)
end

function t:UpdateLastPage()
    if self.curPage - 1 < 0 then 
        return 
    end
    self.curPage = self.curPage - 1
    self:UpdateRoomList(self.lobbyCount, false)
end

function t:UpdateNextPage()
    if (self.curPage + 1) * ONE_PAGE_MAX_LOBBY >= self.lobbyCount then 
        return 
    end
    self.curPage = self.curPage + 1
    self:UpdateRoomList(self.lobbyCount, false)
end

function t:click(tar)
    if tar == self.backgroundImg then 
        G.removeUI('v_room_list')
    elseif tar.parent == self.roomButtonParent then 
        local lobbyIndex = tar.c_button.lobbyIndex
        if lobbyIndex == -1 then 
            self:UpdateLastPage()
            return
        elseif lobbyIndex == -100 then
            self:UpdateNextPage()
            return 
        end
        if self.curSelectLobbyIndex == lobbyIndex then 
            if self.joinLobbyIndex ~= nil then 
                return 
            end
            self.joinLobbyIndex = lobbyIndex
            G.Steam_JoinLobby(lobbyIndex)
            -- TODO: 弹出提示连接中
            self.roomInfoText.text = self.roomInfoText.text .. '\n连接中...'
        else
            self.curSelectLobbyIndex = lobbyIndex
            self:ShowLobbyInfo(lobbyIndex)
        end
    end
end

function t:ShowLobbyInfo(lobbyIndex)
    self.roomInfoText.text = '房间名称:\n' .. (G.Steam_GetLobbyName(lobbyIndex) or '')
end

return t

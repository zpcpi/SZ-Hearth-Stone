--[[3012

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.returnButton = self.obj.getChildByName('ReturnButton')
    self.cardCollection = self.obj.getChildByName('CardCollection').getChildByName('CardCollection')
    self.cardNodeList = {}
    for i = 1, 8 do 
        local cardNode = self.cardCollection.getChildByName('Card' .. i)
        table.insert(self.cardNodeList, cardNode)
    end
    self.lastPageButton = self.obj.getChildByName('CardCollection').getChildByName('LastPage')
    self.nextPageButton = self.obj.getChildByName('CardCollection').getChildByName('NextPage')
    self.startCardIndex = 1

    self:UpdateCardCollection()
end

function t:click(tar)
    if tar == self.returnButton then
        G.call('收藏_退出收藏界面')
    elseif tar == self.lastPageButton then
        self:GoToLastPage()
    elseif tar == self.nextPageButton then
        self:GoToNextPage()
    end
end

function t:UpdateCardCollection()
    local _o_card_卡片列表 = G.call('收藏_通过范围获取卡片列表', self.startCardIndex, 8)
    for i = 1, 8 do 
        local o_card_卡片 = _o_card_卡片列表[i]
        if o_card_卡片 == nil then 
            self.cardNodeList[i].visible = false
        else
            self.cardNodeList[i].visible = true
            local o_node_卡片 = self.cardNodeList[i].getChildByName('Card')
            o_node_卡片.c_card_manager:setData(o_card_卡片)
        end
    end
end

function t:GoToLastPage()
    if self.startCardIndex == 1 then 
        return 
    end
    self.startCardIndex = self.startCardIndex - 8
    self:UpdateCardCollection()
end

function t:GoToNextPage()
    if self.startCardIndex + 8 >= G.call('收藏_获取收藏卡片数量') then 
        return 
    end
    self.startCardIndex = self.startCardIndex + 8
    self:UpdateCardCollection()
end

return t
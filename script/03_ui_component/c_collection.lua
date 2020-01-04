--[[3012

]]

local G = require "gf"
local t = G.com()

t.prop =
{
    {name = 'professionMarkSelectScale', type = 'number'},
    {name = 'DeckButtonHeight', type = 'int'},
    {name = "DeckButtonColor",type = 'hex',ctrl = 'color'},
    {name = 'DeckCardButtonHeight', type = 'int'},
}

function t:init()
    self.returnButton = self.obj.getChildByName('ReturnButton')
    self.cardCollection = self.obj.getChildByName('CardCollection').getChildByName('CardCollection')
    self.cardDataList = {}
    self.cardNodeList = {}
    for i = 1, 8 do 
        local cardNode = self.cardCollection.getChildByName('Card' .. i)
        table.insert(self.cardNodeList, cardNode)
    end
    self.lastPageButton = self.obj.getChildByName('CardCollection').getChildByName('LastPage')
    self.nextPageButton = self.obj.getChildByName('CardCollection').getChildByName('NextPage')

    self.professionMarkParent = self.obj.getChildByName('CardCollection').getChildByName('ProfessionMark')
    self.professionMarkTemplate = self.professionMarkParent.getChildByName('ProfessionMarkButton')
    self.professionMarkTemplate.visible = false

    self.deckInfoParent = self.obj.getChildByName('DeckList').getChildByName('DeckScrollView').getChildByName('content')
    self.newDeckButton = self.deckInfoParent.getChildByName('DeckInfo')
    self.endDeckEditButton = self.newDeckButton
    
    self.heroScrollView = self.obj.getChildByName('HeroScrollView')
    self.newDeckNameNode = self.heroScrollView.getChildByName('DeckName').getChildByName('Text')
    self.heroChoiceButtonParent = self.heroScrollView.getChildByName('content')
    self.heroChoiceButtonTemplate = self.heroChoiceButtonParent.getChildByName('HeroInfo')
    self.heroChoiceButtonTemplate.visible = false
    self.heroScrollView.visible = false

    self.currentEditDeck = nil
    self.startCardIndex = 1
    self.cardProfession = nil

    self.importCardButton = self.obj.getChildByName('ImportButton')
    self.cardCodeTextNode = self.obj.getChildByName('CardCode').getChildByName('CardCodeText')

    if not G.is_editor then
        self:UpdateProfessionMark()
        self:UpdateCardCollection()
        self:UpdateDeckInfo()
    end
end

function t:click(tar)
    if tar == self.returnButton then
        G.call('收藏_退出收藏界面')
    elseif tar == self.lastPageButton then
        self:GoToLastPage()
    elseif tar == self.nextPageButton then
        self:GoToNextPage()
    elseif self:IsProfessionMarkButton(tar) then 
        self:OnClickProfessionButton(tar)
    elseif self.currentEditDeck ~= nil and self:GetCardNodeIndex(tar) ~= 0 then
        local cardIndex = self:GetCardNodeIndex(tar)
        local o_card_卡片 = self.cardDataList[cardIndex]
        if o_card_卡片 ~= nil then 
            G.call('收藏_添加卡组卡片', self.currentEditDeck, o_card_卡片)
        end
    elseif tar.parent == self.heroChoiceButtonParent then
        if tar.data ~= nil and tar.data ~= 0 then 
            local heroID = math.floor(tar.data)
            G.call('收藏_新建卡组', {heroID}, self.newDeckNameNode.text or '新卡组')
            self:HideProfessionList()
        end
    elseif self.currentEditDeck == nil and tar == self.newDeckButton then 
        self:ShowProfessionList()        
    elseif self.currentEditDeck ~= nil and tar == self.endDeckEditButton then 
        self:EndDeckEdit()
    elseif self.currentEditDeck ~= nil and tar.parent == self.deckInfoParent then
        if tar.data ~= nil and tar.data ~= 0 then 
            local cardID = math.floor(tar.data)
            local cardData = G.QueryName(cardID)
            G.call('收藏_移除卡组卡片', self.currentEditDeck, cardData)
        end
    elseif self.currentEditDeck == nil and tar.parent == self.deckInfoParent then
        if tar.data ~= nil and tar.data ~= 0 then 
            local deckID = math.floor(tar.data)
            local deckData = G.QueryName(deckID)
            self:EditDeck(deckData)
        end
    elseif self.currentEditDeck == nil and tar == self.importCardButton then 
        local o_deck = G.call('收藏_解析卡组代码', self.cardCodeTextNode.text, true)
        if o_deck then 
            self:EditDeck(o_deck)
        end
        self.cardCodeTextNode.text = ''
    end
end

function t:IsProfessionMarkButton(node)
    if node.parent == self.professionMarkParent then 
        return true
    end
    return false
end

function t:OnClickProfessionButton(professionMarkButton)
    if professionMarkButton == nil then 
        return
    end
    for i = 1, #self.professionMarkList do 
        local scale = 1
        if self.professionMarkList[i] == professionMarkButton then 
            scale = self.professionMarkSelectScale
        end
        self.professionMarkList[i].scaleX = scale
        self.professionMarkList[i].scaleY = scale
    end
    self:SetCardProfession(professionMarkButton.c_button.profession)
end

function t:UpdateProfessionMark()
    local _o_profession_职业表 = self:GetProfessionList() 
    local image_默认图标 = 0x560d000a
    self.professionMarkParent.removeAllChildren()
    self.professionMarkList = {}
    for _, o_profession_职业 in ipairs(_o_profession_职业表) do 
        if o_profession_职业.是否可选 ~= false then 
            local professionMark = G.Clone(self.professionMarkTemplate)
            professionMark.visible = true
            local image_职业图标 = o_profession_职业.职业图标
            local string_职业名称 = o_profession_职业.showname
            professionMark.c_button.img_normal = image_职业图标 or image_默认图标
            professionMark.c_button.text = string_职业名称
            self.professionMarkParent.addChild(professionMark)
            table.insert(self.professionMarkList, professionMark)
            professionMark.c_button.profession = o_profession_职业
        end
    end
    self:OnClickProfessionButton(self.professionMarkList[1])
end

function t:SetCardProfession(o_profession)
    self.cardProfession = o_profession
    self.startCardIndex = 1
    self:UpdateCardCollection()
end

function t:UpdateCardCollection()
    local _o_card_卡片列表 = G.call('收藏_通过范围获取卡片列表', self.cardProfession, self.startCardIndex, 8)
    self.cardDataList = {}
    for i = 1, 8 do 
        local o_card_卡片 = _o_card_卡片列表[i]
        if o_card_卡片 == nil then 
            self.cardNodeList[i].visible = false
        else
            self.cardNodeList[i].visible = true
            local o_node_卡片 = self.cardNodeList[i].getChildByName('Card')
            o_node_卡片.c_card_manager:setData(o_card_卡片)
            self.cardDataList[i] = o_card_卡片
        end
    end
end

function t:UpdateDeckInfo()
    print('self.currentEditDeck', self.currentEditDeck)
    if self.currentEditDeck == nil then 
        self:ShowAllDeck()
    else
        self:ShowDeckCard()
    end
end

function t:ShowAllDeck()
    local _o_deck_卡组列表 = G.call('收藏_获取所有卡组')
    print('#_o_deck_卡组列表', #_o_deck_卡组列表)
    self.deckInfoParent.removeAllChildren()
    for _, o_deck_卡组 in ipairs(_o_deck_卡组列表) do
        self:AddDeckInfoButton(o_deck_卡组)
    end
    self.deckInfoParent.addChild(self.newDeckButton)
end

function t:ShowDeckCard()
    self.deckInfoParent.removeAllChildren()
    self:AddDeckInfoButton(self.currentEditDeck, false)
    local any_卡片字典 = {}
    for _, o_card_卡片 in ipairs(self.currentEditDeck.卡牌列表) do
        any_卡片字典[o_card_卡片.name] = any_卡片字典[o_card_卡片.name] or 0
        any_卡片字典[o_card_卡片.name] = any_卡片字典[o_card_卡片.name] + 1
    end
    for i_card_卡片ID, int_数量 in pairs(any_卡片字典) do
        self:AddDeckCardButton(i_card_卡片ID, int_数量)
    end
    self.deckInfoParent.addChild(self.endDeckEditButton)
end

function t:AddDeckInfoButton(o_deck, mouseEnabled)
    if o_deck == nil then 
        return
    end
    local deckButton = G.Clone(self.newDeckButton)
    local deckNameNode = deckButton.getChildByName('DeckName')
    if mouseEnabled ~= nil then 
        deckButton.mouseEnabled = mouseEnabled
    end
    deckButton.data = o_deck.name
    deckButton.height = self.DeckButtonHeight
    deckNameNode.color = self.DeckButtonColor
    deckNameNode.text = G.call('收藏_获取卡组全称', o_deck)
    self.deckInfoParent.addChild(deckButton)
end

function t:AddDeckCardButton(i_card, cardCount)
    local o_card_卡片 = G.QueryName(i_card)
    if o_card_卡片 == nil then 
        return
    end
    local deckCardButton = G.Clone(self.newDeckButton)
    local cardNameNode = deckCardButton.getChildByName('DeckName')
    deckCardButton.height = self.DeckCardButtonHeight
    deckCardButton.data = i_card

    local cardColor = 0xffffff
    if o_card_卡片.品质 ~= nil then
        local o_rank_品质 = G.QueryName(o_card_卡片.品质)
        cardColor = o_rank_品质.品质颜色 or cardColor
    end
    cardNameNode.color = cardColor
    cardNameNode.text = o_card_卡片.showname .. '(' .. tostring(cardCount) .. ')'
    self.deckInfoParent.addChild(deckCardButton)
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

function t:GetCardNodeIndex(node)
    if self.cardNodeList == nil then 
        return 0
    end
    for index, cardNode in ipairs(self.cardNodeList) do 
        if cardNode == node then 
            return index
        end
    end
    return 0
end

function t:EditDeck(o_deck)
    if o_deck == nil then 
        return
    end
    self.currentEditDeck = o_deck
    local textNode = self.endDeckEditButton.getChildByName('DeckName')
    textNode.text = '结束编辑'
    self:UpdateDeckInfo()
    self:UpdateProfessionMark()
end

function t:EndDeckEdit()
    G.call('系统_保存卡组数据')
    self.currentEditDeck = nil
    local textNode = self.endDeckEditButton.getChildByName('DeckName')
    textNode.text = '新建卡组'
    self:UpdateDeckInfo()
    self:UpdateProfessionMark()

    -- FIXME: 结束编辑后卡组列表突然不显示了, 临时使用重启界面这个方法解决一下问题
    G.call('收藏_退出收藏界面')
    G.call('收藏_进入收藏界面')
end

function t:ShowProfessionList()
    self.heroScrollView.visible = true
    self.heroChoiceButtonParent.removeAllChildren()
    
    local _o_card_英雄卡ID列表 = G.call('收藏_获取所有英雄卡')
    for _, o_card_英雄 in ipairs(_o_card_英雄卡ID列表) do 
        if o_card_英雄.局外数据 ~= nil and o_card_英雄.局外数据.可收集 then 
            local o_node_英雄 = G.Clone(self.heroChoiceButtonTemplate)
            o_node_英雄.visible = true
            self.heroChoiceButtonParent.addChild(o_node_英雄)
            local textNode = o_node_英雄.getChildByName('Name')
            textNode.text = o_card_英雄.showname
            o_node_英雄.data = o_card_英雄.name
        end
    end
end

function t:HideProfessionList()
    self.heroScrollView.visible = false
end

function t:GetProfessionList()
    if self.currentEditDeck == nil then 
        return G.DBTable('o_profession') or {}
    end
    local _i_profession_卡组职业 = G.call('收藏_获取卡组职业', self.currentEditDeck, true)
    local _o_profession_卡组职业 = {}
    for _, i_profession_职业 in ipairs(_i_profession_卡组职业) do 
        table.insert(_o_profession_卡组职业, G.QueryName(i_profession_职业))
    end
    return _o_profession_卡组职业
end

return t
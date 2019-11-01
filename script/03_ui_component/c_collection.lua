--[[3012

]]

local G = require "gf"
local t = G.com()

t.prop =
{
    {name = 'professionMarkSelectScale', type = 'number'},
}

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

    self.professionMarkParent = self.obj.getChildByName('CardCollection').getChildByName('ProfessionMark')
    self.professionMarkTemplate = self.professionMarkParent.getChildByName('ProfessionMarkButton')
    self.professionMarkTemplate.visible = false

    self.startCardIndex = 1
    self.cardProfession = nil

    if not G.is_editor then
        self:UpdateProfessionMark()
        self:UpdateCardCollection()
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
    local _o_profession_职业表 = G.DBTable('o_profession') or {}
    local image_默认图标 = 0x560d000a
    self.professionMarkParent.removeAllChildren()
    self.professionMarkList = {}
    for _, o_profession_职业 in ipairs(_o_profession_职业表) do 
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
    self:OnClickProfessionButton(self.professionMarkList[1])
end

function t:SetCardProfession(o_profession)
    self.cardProfession = o_profession
    self.startCardIndex = 1
    self:UpdateCardCollection()
end

function t:UpdateCardCollection()
    local _o_card_卡片列表 = G.call('收藏_通过范围获取卡片列表', self.cardProfession, self.startCardIndex, 8)
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
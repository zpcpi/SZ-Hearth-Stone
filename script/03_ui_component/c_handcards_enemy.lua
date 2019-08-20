--[[3006

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.功能区 = self.obj.getChildByName('功能区')

    self.tips版 = self.功能区.getChildByName('Tips版')
    self.布局点 = self.功能区.getChildByName('布局点')
end

function t:start()
    self.CardCount = 0
    self.maxCount = 10
    self.handCards = {}

    self.CurCard = nil
    self.TipsCard = nil

    self:initTipsCard()

    self:InitAnimActor()
end

function t:InitAnimActor()
    self.animActor = G.loadUI('v_animactor')
    self.animActor.c_animactor:push_quote('::HandCards', self)
    G.Stage().addChild(self.animActor)
end

function t:initTipsCard()
    local ui_card = G.loadUI('v_card_weapon')
    self.tips版.addChild(ui_card)
    self.TipsCard = ui_card

    ui_card.visible = false
    ui_card.scaleX = 0.7
    ui_card.scaleY = 0.7
    ui_card.y = 160
end

function t:addCard()
    local count = self.CardCount + 1
    if count > self.maxCount then
        return
    end

    local ui_card = G.loadUI('v_card_weapon')
    self.布局点.addChild(ui_card)
    self.handCards[count] = ui_card

    ui_card.mouseEnabled = true
    ui_card.scaleX = 0.35
    ui_card.scaleY = 0.35

    self.CardCount = count
    ui_card.y = 200
end

function t:removeCard()
    local count = G.call('角色_获取手牌数量', self:GetPlayerType())
    if count > self.CardCount then
        return
    end
    local ui_card = self.handCards[count + 1]
    table.remove(self.handCards, count + 1)
    self.obj:removeChild(ui_card)

    ui_card.visible = false
    self.CardCount = self.CardCount - 1
end

function t:click(tar)
end

function t:rollOver(tar)
    tar.alpha = 0
    self.CurCard = tar

    self.TipsCard.visible = true
    self.TipsCard.x = tar.x
end

function t:rollOut(tar)
    tar.alpha = 255
    self.CurCard = nil

    self.TipsCard.visible = false
end

function t:mouseDown(tar)
end

function t:mouseUp(tar)
end

function t:SetPlayerType(playerType)
    self.playerType = playerType
end

function t:GetPlayerType()
    return self.playerType
end

function t:GetAnimActor()
    return self.animActor
end

return t
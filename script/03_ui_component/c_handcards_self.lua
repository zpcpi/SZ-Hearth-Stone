--[[3003

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

function t:InitDifference(playerType, baseid, tipsfix, newfix)
    self:SetPlayerType(playerType)
    self.TipsFix = tipsfix
    self.NewcardFix = newfix
    self.AnimBaseID = baseid
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

    self.TipsFix(ui_card)
end

function t:run_animactor_reset()
    if self.animActor then
    else
        self:InitAnimActor()
    end

    if self.CardCount and (self.CardCount > 0) and (self.CardCount <= self.maxCount) then
    else
        return 
    end

    local actor = self.animActor.c_animactor
    actor.__o_animquest = {
        [1] = {
            [1] = G.call('动画系统_创建quest', actor, G.QueryName(self.AnimBaseID + self.CardCount - 1)),
        },
    }
    actor:run_animactor()
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

    self.NewcardFix(ui_card)
    self:run_animactor_reset()
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

    self:run_animactor_reset()
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
    -- todo，传出卡牌id
    G.call('主线程触发监听', 'UI_手牌_选择卡牌', G.QueryName(0x10060001))
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
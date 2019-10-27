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
    self.maxCount = HANDCARDS_MAX_COUNT
    self.handCards = {}

    self.CurCard = nil
    self.TipsCard = nil

    self.can_pick = true

    self:initTipsCard()
end

function t:InitDifference(baseid, tipsfix, newfix)
    self.AnimBaseID = baseid
    self.TipsFix = tipsfix
    self.NewcardFix = newfix
end

function t:initTipsCard()
    local ui_card = G.loadUI('v_card_manager')
    self.tips版.addChild(ui_card)
    self.TipsCard = ui_card

    ui_card.visible = false
    ui_card.scaleX = 0.7
    ui_card.scaleY = 0.7

    self.TipsFix(ui_card)
end

function t:addCard(o_card_卡牌)
    local count = self.CardCount + 1
    if count > self.maxCount then
        return
    end

    local ui_card = G.loadUI('v_card_manager')
    self.布局点.addChild(ui_card)
    self.handCards[count] = ui_card

    ui_card.mouseEnabled = true
    ui_card.scaleX = 0.35
    ui_card.scaleY = 0.35
    ui_card.c_card_manager:setData(o_card_卡牌)
    G.call('卡牌注册指令', o_card_卡牌)

    self.CardCount = count

    self.NewcardFix(ui_card)
end

function t:get_cardindex_byobj(obj)
    for k,v in ipairs(self.handCards or {}) do
        if v == obj then
            return k
        end
    end
    return 0
end

function t:removeCard(del_count)
    local count = self.CardCount
    if count < del_count then
        return
    end

    local ui_card = self.handCards[del_count]
    table.remove(self.handCards, del_count)
    ui_card.parent:removeChild(ui_card)

    ui_card.visible = false
    self.CardCount = count - 1
end

function t:click(tar)
end

function t:rollOver(tar)
    if self.can_pick then
        tar.alpha = 0
        self.CurCard = tar

        local o_card_picked = tar.c_card_manager:getData()
        G.trig_event('UI_鼠标覆盖卡牌', o_card_picked)

        self.TipsCard.visible = true
        self.TipsCard.x = tar.x
        self.TipsCard.c_card_manager:setData(o_card_picked)
    end
end

function t:rollOut(tar)
    if self.can_pick then
        tar.alpha = 255
        self.CurCard = nil

        local o_card_picked = tar.c_card_manager:getData()
        G.trig_event('UI_鼠标离开卡牌', o_card_picked)
        
        self.TipsCard.visible = false
    end
end

function t:mouseDown(tar)
    local o_card_picked = tar.c_card_manager:getData()
    if o_card_picked then
        G.trig_event('UI_抓取卡牌', o_card_picked, tar)
    end
end

function t:mouseUp(tar)
end

function t:pickcard_state(tar, picking)
    if picking then
        tar.alpha = 255
        self.CurCard = nil
        self.TipsCard.visible = false

        self.can_pick = false
    else
        self.can_pick = true
    end
end

return t
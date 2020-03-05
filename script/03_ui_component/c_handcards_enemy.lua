--[[3003

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.功能区 = self.obj.getChildByName('功能区')

    self.布局点 = self.功能区.getChildByName('布局点')
end

function t:start()
    self.CardCount = 0
    self.maxCount = HANDCARDS_MAX_COUNT
    self.handCards = {}

    self.CurCard = nil

    self.can_show = true

    self.主战场 = G.misc().主战场系统
end

function t:InitDifference(baseid, newfix)
    self.AnimBaseID = baseid
    self.NewcardFix = newfix
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
    ui_card.scaleX = 0.28
    ui_card.scaleY = 0.28
    ui_card.c_card_manager:setData(o_card_卡牌)

    self.CardCount = count

    self.NewcardFix(ui_card)
end

function t:removeCard(del_count)
    local count = self.CardCount
    if count < del_count then
        return
    end

    local ui_card = self.handCards[del_count]
    table.remove(self.handCards, del_count)
    ui_card.c_card_manager:delete()
    ui_card.parent:removeChild(ui_card)

    ui_card.visible = false
    self.CardCount = count - 1
end

function t:click(tar)
end

function t:rollOver(tar)
    if self.can_show then
        tar.alpha = 0
        self.CurCard = tar

        local o_card_picked = tar.c_card_manager:getData()

        local posx, posy = tar.localToGlobal(0, 0)
        self.主战场:showtips(o_card_picked, posx, 550)
    end
end

function t:rollOut(tar)
    if self.can_show then
        tar.alpha = 255
        self.CurCard = nil

        local o_card_picked = tar.c_card_manager:getData()
        
        self.主战场:hidetips()
    end
end

function t:mouseDown(tar)
end

function t:mouseUp(tar)
end

function t:can_show_state(state)
    self.can_show = state
end

return t


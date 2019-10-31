--[[300c

]]

local G = require "gf"
local t = G.com()
function t:init()
    self.功能区 = self.obj.getChildByName('功能区')

    self.tips版 = self.功能区.getChildByName('Tips版')
    self.布局点 = self.功能区.getChildByName('布局点')
end

function t:start()
    self.MinionCount = 0
    self.maxCount = BATTLEMINIONS_MAX_COUNT
    self.minions = {}

    self.CurCard = nil
    self.TipsCard = nil

    self.can_pick = true

    self:initTipsCard()
end

function t:initTipsCard()
    local ui_card = G.loadUI('v_card_manager')
    self.tips版.addChild(ui_card)
    self.TipsCard = ui_card

    ui_card.visible = false
    ui_card.scaleX = 0.7
    ui_card.scaleY = 0.7
end

function t:addMinion(o_card_卡牌, count)
    local count = self.MinionCount + 1
    if count > self.maxCount then
        return
    end

    local ui_card = G.loadUI('v_battle_minion')
    self.布局点.addChild(ui_card)
    self.minions[count] = ui_card

    ui_card.mouseEnabled = true
    ui_card.scaleX = 0.35
    ui_card.scaleY = 0.35

    local script_界面组件 = ui_card.getChildByName('卡牌框').c_battle_minion
    script_界面组件:setData(o_card_卡牌)
    
    -- 随从的攻击指令
    G.call('卡牌注册指令', o_card_卡牌, 0x10040008)

    self.MinionCount = count
end

function t:get_cardindex_byobj(obj)
    for k,v in ipairs(self.minions or {}) do
        if v == obj then
            return k
        end
    end
    return 0
end

function t:removeCard(del_count)
    local count = self.MinionCount
    if count < del_count then
        return
    end

    local ui_card = self.minions[del_count]
    table.remove(self.minions, del_count)
    ui_card.parent:removeChild(ui_card)

    ui_card.visible = false
    self.MinionCount = count - 1
end

function t:rollOver(tar)
    if tar.parent == self.布局点 then
        if self.can_pick then
            self.CurCard = tar

            local o_card_picked = tar.getChildByName('卡牌框').c_battle_minion:getData()

            self.TipsCard.visible = true
            self.TipsCard.x = tar.x
            self.TipsCard.c_card_manager:setData(o_card_picked)
        end
    end
end

function t:rollOut(tar)
    if tar.parent == self.布局点 then
        self.CurCard = nil
        self.TipsCard.visible = false
    end
end

function t:mouseDown(tar)


end

function t:mouseUp(tar)
    if tar.parent ~= self.布局点 then
        G.trig_event('UI_卡牌确认使用', '我方')
    end
end

return t
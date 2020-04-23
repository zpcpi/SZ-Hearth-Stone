--[[300e

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.功能区 = self.obj.getChildByName('功能区')

    self.布局点 = self.功能区.getChildByName('布局点')
    self.切换显示按钮 = self.功能区.getChildByName('HideButton')
end

function t:start()
    self.show_cards = {}
    self.card_objs = {}

    self.cards_posinfo = {}

    self.can_pick = true
    self.show_card = true
end

function t:create_cardobj()
    local count = #self.card_objs + 1
    local ui_card = G.loadUI('v_card_manager')
    ui_card.mouseEnabled = true
    self.布局点.addChild(ui_card)
    self.card_objs[count] = ui_card

    return ui_card
end

function t:get_obj_bycard(target)
    for k, card in iparis(show_cards) do
        if card == target then
            return self.card_objs[k]
        end
    end
end

function t:calculate_posinfo(count)
    local info = {}

    if count <= 5 then
        info.scale = 0.6

        local centerx = 0
        local centery = 0
        local deltax = 300

        if count == 4 then
            info.scale = 0.5
            deltax = 205
        elseif count == 5 then
            info.scale = 0.45
            deltax = 180
        end

        for i = 1, count, 1 do
            local pos = {}
            pos.x = centerx + (i - ((count + 1) / 2)) * deltax
            pos.y = centery
            info[i] = pos
        end
    elseif count <= 10 then
    elseif count <= 15 then
    end

    return info
end

function t:fixpos()
    local count = #self.show_cards
    local info = self.cards_posinfo[count]
    if info then
    else
        info = self:calculate_posinfo(count)
    end

    local scale = info.scale
    for i = 1, count, 1 do
        local posx = info[i].x
        local posy = info[i].y

        local ui_card = self.card_objs[i]
        ui_card.x = posx
        ui_card.y = posy
        ui_card.scaleX = scale
        ui_card.scaleY = scale
    end
end

function t:setData(list, i_order_当前指令)
    self.show_cards = list

    local count = #self.show_cards
    for i = 1, count, 1 do
        local ui_card = self.card_objs[i]
        if ui_card then
        else
            ui_card = self:create_cardobj()
        end
        ui_card.c_card_manager:setData(list[i])
        ui_card.visible = true

        if i_order_当前指令 then
            G.call('卡牌注册指令', list[i], i_order_当前指令)
        end
    end

    for i = count + 1, #self.card_objs, 1 do
        local ui_card = self.card_objs[i]
        ui_card.visible = false
    end

    self:fixpos()
    self:布局点显示控制(true)
end

function t:布局点显示控制(is_show)
    if is_show then
        self.show_card = true
        self.布局点.visible = true
        self.切换显示按钮.c_button.text = '隐藏'
    else
        self.show_card = false
        self.布局点.visible = false
        self.切换显示按钮.c_button.text = '显示'
    end
end

function t:mouseDown(tar)

end

function t:mouseUp(tar)
    if self.can_pick then
        if tar.parent == self.布局点 then 
            local o_card_picked = tar.c_card_manager:getData()
            if o_card_picked then
                G.trig_event('UI_抓取卡牌_选择界面', o_card_picked, tar)
            end
        elseif tar == self.切换显示按钮 then
            self:布局点显示控制(not self.show_card)
        end
    end
end

return t
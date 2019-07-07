--[[3003

]]

local G = require "gf"
local t = G.com()


function t:init()
    self.功能区 = self.obj.getChildByName('功能区')

    self.布局点 = self.功能区.getChildByName('布局点')
end

function t:start()
    self.cardsCount = 5
    self.maxCount = 10

    self.Radius = self:get_width() * 1
    self.maxRotation = math.atan(self:get_width() * 0.84, self.Radius)
    self.minRotation = self.maxRotation / 4

    self:initCards()
end

function t:get_width()
    return self.功能区.right - self.功能区.left
end

function t:get_height()
    return self.功能区.top - self.功能区.bottom
end

function t:getInvRotation(count)
    self.invDict = self.invDict or {}

    if not self.invDict[count] then
        local list = {}
    
        local minr = self.minRotation
        if (count - 1) * minr > self.maxRotation then
            minr = self.maxRotation / (count - 1)
        end

        local begR = -(count - 0.3) * 0.5 * minr
        if count == 1 then
            begR = 0
        end

        for k = 1, count, 1 do
            local r = begR + minr * (k - 1)
            list[k] = {
                x = self.Radius * math.sin(r),
                y = self.Radius * (math.cos(r) - 1),
                r = r * 180 / math.pi
            }
        end

        self.invDict[count] = list
    end

    return self.invDict[count]
end

function t:getCardRotation(index)
    local list = self:getInvRotation(self.cardsCount)
    return list[index]
end

function t:initCards()
    if not self.handCards then
        self.handCards = {}

        for k = 1, 10, 1 do
            local ui_card = G.addUI('v_card_weapon')

            self.handCards[k] = ui_card
            self.布局点.addChild(ui_card)
            
            ui_card.name = tostring(k)
            ui_card.visible = false

            ui_card.scaleX = 0.35
            ui_card.scaleY = 0.35
        end
    end

    -- 需要以一个圆心排列
    for k = 1, self.cardsCount, 1 do
        local ui_card = self.handCards[k]
        local pos = self:getCardRotation(k)

        ui_card.visible = true
        ui_card.x = pos.x
        ui_card.y = pos.y
        ui_card.rotation = pos.r
    end

    for k = self.cardsCount + 1, self.maxCount, 1 do
        local ui_card = self.handCards[k]
        ui_card.visible = false
    end
end




return t
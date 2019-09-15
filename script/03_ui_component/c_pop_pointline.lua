--[[0

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.容器 = self.obj.getChildByName('容器')
    self.线头 = self.obj.getChildByName('线头')
    self.线中 = self.obj.getChildByName('线中')
end

function t:start()
    local orgScale = 0.7
    self.spriteList = {}

    local ui_item = G.Clone(self.线头)
    ui_item.visible = true
    self.spriteList[20] = ui_item
    self.容器.addChild(ui_item)

    for i = 19, 1, -1 do
        local ui_item = G.Clone(self.线中)

        ui_item.scaleX = ui_item.scaleX * (0.2 + i / 18 * 0.8)
        ui_item.scaleY = ui_item.scaleX
        if i <= 5 then
            ui_item.alpha = (i - 1) / 5 * 255
        end

        ui_item.visible = true
        self.spriteList[i] = ui_item
        self.容器.addChild(ui_item)
    end

    self.time = 0
end

function t:update()
    if not self.startPos then
        return
    end

    local invTime = 300
    self.time = self.time + 1000 / 50
    while self.time > invTime do
        self.time = self.time - invTime
    end

    local ta = self.time / invTime

    if self.obj.visible then
        self:updateShow(self.startPos, self.endPos, ta)
    end
end

function t:updateShow(startPos, endPos, ta)
    self.ctrlAPos = {}
    self.ctrlBPos = {}

    local ctrlAPos = self.ctrlAPos
    local ctrlBPos = self.ctrlBPos

    ctrlAPos.x = endPos.x - (startPos.x - endPos.x) * 0.3
    ctrlAPos.y = startPos.y + (endPos.y - startPos.y) * 0.4
    
    ctrlBPos.x = endPos.x - (startPos.x - endPos.x) * 0.1
    ctrlBPos.y = endPos.y - (endPos.y - startPos.y) * 0.1

    local posFun = function(t, sp, ep, ca, cb)
        return sp*(1-t)*(1-t)*(1-t)+3*ca*t*(1-t)*(1-t)+3*cb*t*t*(1-t)+ep*t*t*t
    end

    for i = 1, 20 do
        t = (i - 1 + ta) / 19
        if i == 20 then
            t = 1
        end
        local posX = posFun(t, startPos.x, endPos.x, ctrlAPos.x, ctrlBPos.x)
        local posY = posFun(t, startPos.y, endPos.y, ctrlAPos.y, ctrlBPos.y)
        local ui_item = self.spriteList[i]
        ui_item.x = posX
        ui_item.y = posY

        local orgScale = 0.85
        ui_item.scaleX = orgScale * ((t / (20 / 19)) * 0.8 + 0.2)
        ui_item.scaleY = ui_item.scaleX

        if i == 20 then
            t = (i - 1 + ta) / 19
        end

        if t < 5 / 19 then
            ui_item.alpha = t / (5 / 19) * 255
        elseif t > 18 / 19 then
            ui_item.alpha = 255 - 255 * ((t - (18 / 19)) / (20 / 19 - 18 / 19))
        end
    end

    self:updateAngle()
end

function t:reset(startPos, endPos)
    self.startPos = startPos
    self.endPos = endPos
    self.ctrlAPos = {}
    self.ctrlBPos = {}

    -- ctrlAPos.x = startPos.x + (startPos.x - endPos.x) * 0.1
    -- ctrlAPos.y = endPos.y - (endPos.y - startPos.y) * 0.2
    
    -- ctrlBPos.x = startPos.x - (startPos.x - endPos.x) * 0.3
    -- ctrlBPos.y = endPos.y + (endPos.y - startPos.y) * 0.3

    self:update()
end

function t:updateAngle()
    local getLength = function(x1, y1, x2, y2)
        return math.sqrt( (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) )
    end

    for i = 1, 20 do
        local ui_preitem = self.spriteList[i - 1]
        local ui_item = self.spriteList[i]
        if i == 1 then
            ui_item.rotation = 270
        else
            if getLength(ui_preitem.x, ui_preitem.y, ui_item.x, ui_item.y) > 0.1 then
                ui_item.rotation = self:getAngle({x = ui_preitem.x, y = ui_preitem.y}, 
                {x = ui_item.x, y = ui_item.y})
            end
        end
    end
end


function t:getAngle(from, to)
    local pos = {x = to.x - from.x, y = to.y - from.y}
    if math.abs(pos.x) < 0.00001 then
        if pos.y > 0 then
            return 270
        else
            return 90
        end
    elseif pos.x > 0 then
        return -math.deg(math.atan(pos.y / pos.x))
    else
        return math.deg(math.pi - math.atan(pos.y / pos.x))
    end
end

return t
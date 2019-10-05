--[[0

]]

local G = require "gf"
local t = G.com()

t.prop =
{
    {name = 'p1x', type = 'int', ctrl = 'dragint'},
    {name = 'p1y', type = 'int', ctrl = 'dragint'},
    {name = 'p2x', type = 'int', ctrl = 'dragint'},
    {name = 'p2y', type = 'int', ctrl = 'dragint'},
    {name = 'p3x', type = 'int', ctrl = 'dragint'},
    {name = 'p3y', type = 'int', ctrl = 'dragint'},
}

function t:init()
    self.容器 = self.obj.getChildByName('容器')
    self.线头 = self.obj.getChildByName('线头')
    self.线中 = self.obj.getChildByName('线中')
    self.靶点 = self.obj.getChildByName('靶点')
end

function t:start()
    self.spritemax = 20
    self.spriteList = {}

    local ui_item = G.Clone(self.线头)
    ui_item.visible = true
    self.spriteList[self.spritemax] = ui_item
    self.容器.addChild(ui_item)

    for i = (self.spritemax - 1), 1, -1 do
        local ui_item = G.Clone(self.线中)
        ui_item.visible = true
        self.spriteList[i] = ui_item
        self.容器.addChild(ui_item)
    end
    --用于计算角度
    self.spriteList[0] = self.spriteList[2]

    self.dotpro = 0
    self.need_update = true
end

local getLength = function(x1, y1, x2, y2)
    return math.sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
end

function t:update()
    if self.need_update then
    else
        return
    end

    local k = 1000 / 30
    self.dotpro = self.dotpro + 0.7 / k
    while self.dotpro > 1 do
        self.dotpro = self.dotpro - 1
    end

    if self.p1x and self.p1y and self.p2x and self.p2y and self.p3x and self.p3y and (getLength(self.p1x, self.p1y, self.p3x, self.p3y) > 20) then
        -- 头尾是必须的
        self:updateShow()
        self.容器.visible = true
    else
        self.容器.visible = false
    end
end

function t:updateShow()
    local pointxs, pointys = G.call('Bezier_curve_bycount', 
                                    {self.p1x, self.p2x, self.p3x}, 
                                    {self.p1y, self.p2y, self.p3y}, 
                                    self.spritemax,
                                    self.dotpro
                                )
    local cur_count = #pointxs
    local orgScale = 0.7
    
    for i = 1, cur_count, 1 do
        local posX, posY = pointxs[i], pointys[i]
        local ui_item = self.spriteList[i]
        ui_item.x = posX
        ui_item.y = posY

        local t = i - 1 + self.dotpro
        ui_item.scaleX = orgScale * (t / cur_count * 0.7 + 0.3)
        -- local mid = 0.7
        -- if t <= cur_count * mid then
        --     local k = math.tan(1/mid) / cur_count
        --     ui_item.scaleX = orgScale * (t * k * 0.7 + 0.3)
        -- else
        --     local k = math.tan(1/(mid-1)) / cur_count
        --     ui_item.scaleX = orgScale * ((cur_count * mid - t) * k * 0.7 + 0.3)
        -- end
        ui_item.scaleY = ui_item.scaleX

        if t < 6 then
            ui_item.alpha = 255 * (t / 6) * 0.5
        elseif t > (cur_count - 3) then
            ui_item.alpha = 255 * (((cur_count - t) / 3) * 0.2 + 0.3)
        else
            ui_item.alpha = 255 * 0.5
        end
    end

    -- 线头控制
    local ui_item = self.spriteList[self.spritemax]
    ui_item.x = self.p3x
    ui_item.y = self.p3y
    ui_item.scaleX = orgScale
    ui_item.scaleY = orgScale
    ui_item.alpha = 255 * 0.6

    self:updateAngle()
end

function t:updateAngle()
    for i = 1, self.spritemax do
        local ui_preitem = self.spriteList[i - 1]
        local ui_item = self.spriteList[i]

        if i == 1 then
            ui_item.rotation = self:getAngle(
                {x = ui_item.x, y = ui_item.y},
                {x = ui_preitem.x, y = ui_preitem.y}
            )
        elseif i == self.spritemax then
            local pointxs, pointys = G.call('Bezier_curve', 
                                            {self.p1x, self.p2x, self.p3x}, 
                                            {self.p1y, self.p2y, self.p3y}, 
                                            {1 - 1 / self.spritemax}
                                        )
            ui_item.rotation = self:getAngle(
                {x = pointxs[1], y = pointys[1]},
                {x = self.p3x, y = self.p3y}
            )
        else
            ui_item.rotation = self:getAngle(
                {x = ui_preitem.x, y = ui_preitem.y}, 
                {x = ui_item.x, y = ui_item.y}
            )
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
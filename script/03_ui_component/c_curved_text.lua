--[[3005

]]

local G = require "gf"
local t = G.com()

t.prop =
{
    {name = 'text', type = 'string', ctrl = 'string'},
    {name = 'p0x', type = 'int', ctrl = 'dragint'},
    {name = 'p0y', type = 'int', ctrl = 'dragint'},
    {name = 'p1x', type = 'int', ctrl = 'dragint'},
    {name = 'p1y', type = 'int', ctrl = 'dragint'},
    {name = 'p2x', type = 'int', ctrl = 'dragint'},
    {name = 'p2y', type = 'int', ctrl = 'dragint'},
    {name = 'p3x', type = 'int', ctrl = 'dragint'},
    {name = 'p3y', type = 'int', ctrl = 'dragint'},
    {name = "space", type = 'int', ctrl = 'dragint', ctrl_arg = {min = 0, max = 100}},
}

function t:init()
    self.单字父级 = self.obj.getChildByName('单字父级')
    self.字体模板 = self.obj.getChildByName('字体模板')
    self.中心点 = self.obj.getChildByName('中心点')
    if self.中心点 then 
        self.中心点.visible = false
    end
    if self.字体模板 then 
        self.字体模板.visible = false
    end
    self:UpdateText()
end

function t:update()
    self:UpdateText()
end

function t:UpdateText(string_文字)
    if self.text == nil or #self.text == 0 then 
        return 
    end
    if self.text == self.oldText then 
        return 
    end
    self.oldText = self.text
    local string_文字 = self.text or ''
    self:ClearChildText()

    local _string_文字数组 = self:GetStringArray(string_文字)
    if #_string_文字数组 == 0 then 
        return 
    end
    for index, string_单字 in ipairs(_string_文字数组) do 
        local o_node_文字节点 = G.Clone(self.字体模板)
        o_node_文字节点.visible = true
        self.单字父级.addChild(o_node_文字节点)
        o_node_文字节点.text = string_单字
    end

    local int_已知点数量 = 0
    for i = 0, 3 do 
        if self['p' .. i .. 'x'] ~= nil and self['p' .. i .. 'y'] ~= nil then 
            int_已知点数量 = int_已知点数量 + 1
        else
            break
        end
    end
    if int_已知点数量 <= 1 then 
        return 
    end

    for i = 1, self.单字父级.childCount do 
        local number_t = 0
        if self.space ~= nil then 
            number_t = 0.5 + self.space * (i - self.单字父级.childCount / 2) / 100
        else
            number_t = 0.5 + (i - self.单字父级.childCount / 2) / self.单字父级.childCount
        end
        local o_node_文字节点 = self.单字父级.getChildAt(i - 1)

        if int_已知点数量 == 2 then 
            o_node_文字节点.x, o_node_文字节点.y = self:GetPosBy2Point(number_t)
            o_node_文字节点.rotation = self:GetRotBy2Point(number_t)
        elseif int_已知点数量 == 3 then 
            o_node_文字节点.x, o_node_文字节点.y = self:GetPosBy3Point(number_t)
            o_node_文字节点.rotation = self:GetRotBy3Point(number_t)
        elseif int_已知点数量 == 4 then 
            o_node_文字节点.x, o_node_文字节点.y = self:GetPosBy4Point(number_t)
            print('--== o_node_文字节点.text', o_node_文字节点.text)
            o_node_文字节点.rotation = self:GetRotBy4Point(number_t)
        end
    end
end

function t:ClearChildText()
    self.单字父级.removeAllChildren()
end

function t:GetStringArray(string_字符串)
    local size = G.getStrLen(string_字符串)
    local _string_文字数组 = {}
    for i = 1, size do
        local string_单字 = G.utf8sub(string_字符串, i, 1)
        table.insert(_string_文字数组, string_单字)
    end

    return _string_文字数组
end

function t:GetPosBy2Point(number_t)
    local x = self.p0x + ((self.p1x - self.p0x) * number_t)
    local y = self.p0y + ((self.p1y - self.p0y) * number_t)
    return x, y
end

function t:GetPosBy3Point(number_t)
    local x = ((1 - number_t) * (1 - number_t) * self.p0x) + (2 * number_t * (1 - number_t) * self.p1x) + (number_t * number_t * self.p2x)
    local y = ((1 - number_t) * (1 - number_t) * self.p0y) + (2 * number_t * (1 - number_t) * self.p1y) + (number_t * number_t * self.p2y)
    return x, y
end

function t:GetPosBy4Point(number_t)
    local x = ((1 - number_t) * (1 - number_t) * (1 - number_t) * self.p0x) + (3 * number_t * (1 - number_t) * (1 - number_t) * self.p1x) + (3 * number_t * number_t * (1 - number_t) * self.p2x) + (number_t * number_t * number_t * self.p3x)
    local y = ((1 - number_t) * (1 - number_t) * (1 - number_t) * self.p0y) + (3 * number_t * (1 - number_t) * (1 - number_t) * self.p1y) + (3 * number_t * number_t * (1 - number_t) * self.p2y) + (number_t * number_t * number_t * self.p3y)
    return x, y
end

function t:GetRotBy2Point(number_t)
    if not self.中心点 then 
        return 0
    end
    local x1, y1 = self:GetPosBy2Point(number_t - 0.05)
    local x2, y2 = self:GetPosBy2Point(number_t + 0.05)
    local k = (y1 - y2) / (x1 - x2)
    local rot = math.atan(k) * 180 / math.pi
    rot = self:ConvertRot(rot)
    return rot
end

function t:GetRotBy3Point(number_t)
    if not self.中心点 then 
        return 0
    end
    local x1, y1 = self:GetPosBy3Point(number_t - 0.05)
    local x2, y2 = self:GetPosBy3Point(number_t + 0.05)
    local k = (y1 - y2) / (x1 - x2)
    local rot = math.atan(k) * 180 / math.pi
    rot = self:ConvertRot(rot)
    return rot
end

function t:GetRotBy4Point(number_t)
    if not self.中心点 then 
        return 0
    end
    local x1, y1 = self:GetPosBy4Point(number_t - 0.05)
    local x2, y2 = self:GetPosBy4Point(number_t + 0.05)
    local k = (y1 - y2) / (x1 - x2)
    local rot = math.atan(k) * 180 / math.pi
    print('--== k, rot', k, rot)
    rot = self:ConvertRot(rot)
    return rot
end

function t:ConvertRot(number_rot)
    return -number_rot
end

return t
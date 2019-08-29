--[[3001

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.原画组合 = self.obj.getChildByName('原画组合')
    self.原画 = self.原画组合.getChildByName('原画')
    self.名称板 = self.obj.getChildByName('名称板')
    self.名称字符 = self.名称板.getChildByName('名称字符')
end

function t:setData(o_card_卡片数据)
    local string_卡片名称 = o_card_卡片数据.showname
    local number_原画偏移X = o_card_卡片数据.原画偏移X
    local number_原画偏移Y = o_card_卡片数据.原画偏移Y
    local number_原画旋转 = o_card_卡片数据.原画旋转
    local number_原画缩放 = o_card_卡片数据.原画缩放
    local image_原画 = o_card_卡片数据.原画

    self.原画.img = image_原画
    self.原画.x = number_原画偏移X
    self.原画.y = number_原画偏移Y
    self.原画.rotation = number_原画旋转
    self.原画.scaleX = number_原画缩放
    self.原画.scaleY = number_原画缩放
end

return t
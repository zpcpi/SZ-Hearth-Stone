--[[3001

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.原画组合 = self.obj.getChildByName('原画组合')
    self.原画 = self.原画组合.getChildByName('原画')

    self.职业边框 = self.obj.getChildByName('背景')

    self.品质板 = self.obj.getChildByName('品质板')
    self.品质宝石 = self.品质板.getChildByName('品质宝石')

    self.精英板 = self.obj.getChildByName('精英板')

    self.名称板 = self.obj.getChildByName('名称板')
    self.名称字符 = self.名称板.getChildByName('名称字符')
    self.描述板 = self.obj.getChildByName('描述板')
    self.描述字符 = self.描述板.getChildByName('描述字符')

    self.属性值组合 = self.obj.getChildByName('属性值组合')
    self.费用 = self.属性值组合.getChildByName('费用')
    self.费用数值 = self.费用.getChildByName('费用数值')
end

function t:setData(o_card_卡片数据)
    local d = require '_data'

    -- 原画信息
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

    -- 职业信息
    local i_profession_卡牌职业 = o_card_卡片数据.职业
    local o_profession_卡牌职业
    if G.is_editor then 
        o_profession_卡牌职业 = d.query_inst(i_profession_卡牌职业)
    else
        o_profession_卡牌职业 = G.QueryName(i_profession_卡牌职业)
    end
    self.职业边框 = o_profession_卡牌职业.法术卡边框

    -- 品质信息
    local i_rank_卡牌品质 = o_card_卡片数据.品质
    local o_rank_卡牌品质
    if G.is_editor then 
        o_rank_卡牌品质 = d.query_inst(i_rank_卡牌品质)
    else
        o_rank_卡牌品质 = G.QueryName(i_rank_卡牌品质)
    end
    local image_宝石图片 = o_rank_卡牌品质.宝石图片
    if image_宝石图片 then
        self.品质板.visible = true
        self.品质宝石.img = image_宝石图片
    else
        self.品质板.visible = false
    end

    -- 精英标志
    local boolean_是精英 = o_card_卡片数据.是精英
    if boolean_是精英 then
        self.精英板.visible = true
    else
        self.精英板.visible = false
    end

    -- 卡牌文本
    local string_卡片名称 = o_card_卡片数据.showname
    local string_卡片描述 = o_card_卡片数据.描述
    self.名称字符.c_curved_text.text = string_卡片名称
    self.描述字符.text = string_卡片描述

    -- 卡牌数据
    local int_卡片费用 = o_card_卡片数据.费用
    self.费用数值.text = int_卡片费用
end

return t
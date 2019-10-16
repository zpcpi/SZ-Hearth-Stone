--[[400c

]]
local G = require "gf"
local L = {}
local t = G.api

t['CardCom_SetData'] = function (com, o_card)
    local query_iter
    if G.is_editor then 
        local d = require '_data'
        query_iter = d.query_inst
    else
        query_iter = G.QueryName
    end

    -- 卡牌类型
    local o_card_type = query_iter(o_card.类型)

    -- 原画信息
    do
        local o_card_curcard
        if o_card.原画 then
            o_card_curcard = o_card
        else
            o_card_curcard = query_iter(o_card_type.默认原画配置)
        end

        local image_原画 = o_card_curcard.原画
        local number_原画偏移X = o_card_curcard.原画偏移X or 0
        local number_原画偏移Y = o_card_curcard.原画偏移Y or 0
        local number_原画旋转 = o_card_curcard.原画旋转 or 0
        local number_原画缩放X = (o_card_curcard.原画缩放X or 1) * 0.58
        local number_原画缩放Y = (o_card_curcard.原画缩放Y or 1) * 0.58

        com.原画.img = image_原画
        com.原画.x = number_原画偏移X
        com.原画.y = number_原画偏移Y
        com.原画.rotation = number_原画旋转
        com.原画.scaleX = number_原画缩放X
        com.原画.scaleY = number_原画缩放Y
    end

    -- 职业信息
    do
        local o_profession_卡牌职业 = query_iter(o_card.职业 or 0x10080001)
        com.职业边框.img = o_profession_卡牌职业[o_card_type.职业边框]

        if com.职业图标 then
            com.职业图标.img = o_profession_卡牌职业.职业图标
        end
    end

    -- 品质信息
    if com.品质板 then
        local o_rank_卡牌品质 = query_iter(o_card.品质 or 0x10070001)
        local image_宝石图片 = o_rank_卡牌品质.宝石图片
        if image_宝石图片 then
            com.品质板.visible = true
            com.品质宝石.img = image_宝石图片
        else
            com.品质板.visible = false
        end
    end

    -- 精英标志
    if com.精英板 then
        local boolean_是精英 = o_card.是精英
        if boolean_是精英 then
            com.精英板.visible = true
        else
            com.精英板.visible = false
        end
    end

    -- 卡牌文本
    if com.名称字符 then
        local string_卡片名称 = o_card.showname
        if com.名称字符.c_curved_text then
            com.名称字符.c_curved_text.text = string_卡片名称
        else
            com.名称字符.text = string_卡片名称
        end
    end
    if com.描述字符 then
        local string_卡片描述 = o_card.描述
        com.描述字符.text = string_卡片描述 or ''
    end
    if com.种族字符 then
        if o_card.种族 then
            local o_race_种族 = query_iter(o_card.种族)
            com.种族字符.text = o_race_种族.showname
            com.种族板.visible = true
        else
            com.种族板.visible = false
        end
    end

    -- 卡牌数据
    if com.费用数值 then
        local int_卡片费用 = o_card.费用
        com.cost = int_卡片费用
    end
    if com.攻击力数值 then
        local int_卡片攻击力 = o_card.攻击
        com.atk = int_卡片攻击力
    end
    if com.生命值数值 then
        local int_卡片生命值 = o_card.生命
        com.hp = int_卡片生命值
    end
    if com.护甲值数值 then
        local int_卡片护甲值 = o_card.护甲
        com.ap = int_卡片护甲值
    end

    -- 战场随从数据
    if com.嘲讽框 then
        -- todo...
    end
end

t['CardCom_SetAttr'] = function (attrA, objname, attrB)
    -- todo...
    -- 追加颜色设置

    return function (com, old_value)
        local value = com[attrA]
        if value then
            com[objname][attrB] = tostring(math.floor(value))
        else
            com[objname][attrB] = ''
        end
    end
end

t['CardCom_SetAttr_hide'] = function (attrA, objname, attrB, hide_objname)
    -- todo...
    -- 追加颜色设置

    if objname then
        return function (com, old_value)
            local value = com[attrA]
            if value then
                com[objname][attrB] = tostring(math.floor(value))
                com[hide_objname].visible = true
            else
                com[objname][attrB] = ''
                com[hide_objname].visible = false
            end
        end
    else
        return function (com, old_value)
            local value = com[attrA]
            if value then
                com[hide_objname].visible = true
            else
                com[hide_objname].visible = false
            end
        end
    end
end

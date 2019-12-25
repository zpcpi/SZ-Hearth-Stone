--[[400c

]]
local G = require "gf"
local L = {}
local t = G.api


t['CardCom_SetData'] = function (com, o_card)
    -- 记录当前关联卡牌
    com.cur_card = o_card

    local query_iter
    if G.is_editor then 
        local d = require '_data'
        query_iter = d.query_inst
    else
        query_iter = G.QueryName
    end
    local get_attr = CARD_GET_ATTR

    -- 卡牌类型
    local o_card_type = query_iter(get_attr(o_card, '逻辑数据', '类型'))

    -- 原画信息
    do
        local o_card_curcard
        if get_attr(o_card, '美术数据', '原画') then
            o_card_curcard = o_card
        else
            o_card_curcard = query_iter(o_card_type.默认原画配置)
        end

        local image_原画 = get_attr(o_card_curcard, '美术数据', '原画')
        local number_原画偏移X = get_attr(o_card_curcard, '美术数据', '原画偏移X') or 0
        local number_原画偏移Y = get_attr(o_card_curcard, '美术数据', '原画偏移Y') or 0
        local number_原画旋转 = get_attr(o_card_curcard, '美术数据', '原画旋转') or 0
        local number_原画缩放X = (get_attr(o_card_curcard, '美术数据', '原画缩放X') or 1) * 0.58
        local number_原画缩放Y = (get_attr(o_card_curcard, '美术数据', '原画缩放Y') or 1) * 0.58

        com.原画.img = image_原画
        com.原画.x = number_原画偏移X
        com.原画.y = number_原画偏移Y
        com.原画.rotation = number_原画旋转
        com.原画.scaleX = number_原画缩放X
        com.原画.scaleY = number_原画缩放Y
    end

    -- 职业信息
    local i_proflist = get_attr(o_card, '逻辑数据', '职业')
    for index, pro in ipairs(i_proflist or {0x10080001}) do
        local o_profession_卡牌职业 = query_iter(pro)

        if index == 1 then
            if com.职业边框 then
                com.职业边框.img = o_profession_卡牌职业[o_card_type.职业边框]
            end
        end
        local iconpath = '职业图标' .. index
        if com[iconpath] then
            com[iconpath].img = o_profession_卡牌职业.职业图标
            com[iconpath].visible = true
        end
    end
    
    -- 品质信息
    if com.品质板 then
        local o_rank_卡牌品质 = query_iter(get_attr(o_card, '逻辑数据', '品质') or 0x10070001)
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
        local boolean_是精英 = get_attr(o_card, '逻辑数据', '是精英')
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
        local string_卡片描述 = get_attr(o_card, '美术数据', '描述')
        com.描述字符.text = string_卡片描述 or ''
    end
    if com.种族字符 then
        local 种族 = get_attr(o_card, '逻辑数据', '种族')
        if 种族 then
            local o_race_种族 = query_iter(种族)
            com.种族字符.text = o_race_种族.showname
            com.种族板.visible = true
        else
            com.种族板.visible = false
        end
    end

    -- 卡牌数据
    if com.费用数值 then
        local int_卡片费用 = G.call('卡牌属性_获取', o_card, '费用', '当前值')
        com.cost = int_卡片费用
    end
    if com.攻击力数值 then
        local int_卡片攻击力 = G.call('卡牌属性_获取', o_card, '攻击', '当前值')
        com.atk = int_卡片攻击力
    end
    if com.生命值数值 then
        local int_卡片生命值 = G.call('卡牌属性_获取', o_card, '生命', '当前值')
        com.hp = int_卡片生命值
    end
    if com.护甲值数值 then
        local int_卡片护甲值 = G.call('卡牌属性_获取', o_card, '护甲', '当前值')
        com.ap = int_卡片护甲值
    end

    -- 战场随从数据
    if com.嘲讽框 then
        if G.call('卡牌条件_卡牌特性判断', o_card, {'嘲讽'}) then
            com.嘲讽框.visible = true
        else
            com.嘲讽框.visible = false
        end
    end

    -- 临时，追加属性改变监听
    -- 应该做成动画

    -- 注册卡牌更新监听
    do
        local update_data = function ()
            local _, attr = G.event_info()
            local value = G.call('卡牌属性_获取', o_card, attr, '当前值')
            if attr == '费用' then
                attr = 'cost'
            elseif attr == '攻击' then
                attr = 'atk'
            elseif attr == '生命' then
                attr = 'hp'
            elseif attr == '护甲' then
                attr = 'ap'
            end
            com[attr] = value
        end
    
        local key = 'card_attrchange|' .. tostring(com)
        G.removeListener(key, 'UI_卡牌属性更新')
        G.api[key] = update_data
        G.addListener(key, {'UI_卡牌属性更新', o_card.name})
    end
end

local function com_color_mode_费用 (estr_cardattr_enum_属性名)
    -- 当前值比原始值大，显示红色
    -- 当前值比原始值小，显示绿色
    -- 否则显示白色
    local red = G.QueryName(0x1f05000f)['color']
    local green = G.QueryName(0x1f050010)['color']
    local white = 0xffffff

    return function (self, objname)
        local o_card = self.cur_card
        local curv = G.call('卡牌属性_获取', o_card, estr_cardattr_enum_属性名, '当前值') or 0
        local maxv = G.call('卡牌属性_获取', o_card, estr_cardattr_enum_属性名, '最大值') or 0
        local oriv = G.call('卡牌属性_获取', o_card, estr_cardattr_enum_属性名, '原始值') or 0

        if curv > oriv then
            self[objname].color = red
            self[objname].outColor = 1
        elseif curv < oriv then
            self[objname].color = green
            self[objname].outColor = 1
        else
            self[objname].color = 0xffffff
            self[objname].outColor = 1
        end
    end
end
local function com_color_mode_攻击 (estr_cardattr_enum_属性名)
    -- 当前值比原始值大，显示绿色
    -- 否则显示白色
    local green = G.QueryName(0x1f050010)['color']
    local white = 0xffffff

    return function (self, objname)
        local o_card = self.cur_card
        local curv = G.call('卡牌属性_获取', o_card, estr_cardattr_enum_属性名, '当前值') or 0
        local maxv = G.call('卡牌属性_获取', o_card, estr_cardattr_enum_属性名, '最大值') or 0
        local oriv = G.call('卡牌属性_获取', o_card, estr_cardattr_enum_属性名, '原始值') or 0

        if curv > oriv then
            self[objname].color = green
            self[objname].outColor = 1
        else
            self[objname].color = white
            self[objname].outColor = 1
        end
    end
end
local function com_color_mode_生命 (estr_cardattr_enum_属性名)
    -- 当前值比最大值小，显示红色（受伤）
    -- 当前值等于最大值，最大值大于原始值，显示绿色
    -- 否则显示白色
    local red = G.QueryName(0x1f05000f)['color']
    local green = G.QueryName(0x1f050010)['color']
    local white = 0xffffff

    return function (self, objname)
        local o_card = self.cur_card
        local curv = G.call('卡牌属性_获取', o_card, estr_cardattr_enum_属性名, '当前值') or 0
        local maxv = G.call('卡牌属性_获取', o_card, estr_cardattr_enum_属性名, '最大值') or 0
        local oriv = G.call('卡牌属性_获取', o_card, estr_cardattr_enum_属性名, '原始值') or 0

        if curv < maxv then
            self[objname].color = red
            self[objname].outColor = 1
        elseif (curv == maxv) and (maxv > oriv) then
            self[objname].color = green
            self[objname].outColor = 1
        else
            self[objname].color = white
            self[objname].outColor = 1
        end
    end
end
local function com_mode_select (objname)
    if objname == '攻击力数值' then
        return com_color_mode_攻击('攻击')
    elseif objname == '生命值数值' then
        return com_color_mode_生命('生命')
    elseif objname == '护甲值数值' then
    elseif objname == '费用数值' then
        return com_color_mode_费用('费用')
    end
end

local function com_value_mode_生命 ()
    return function (v)
        if type(v) == 'number' then
            if v > (1 << 31) then
                v = 0
            end
            tostring(math.floor(v))
        end
        return v
    end
end

local function com_value_mode_最小0 ()
    return function (v)
        if type(v) == 'number' then
            if v < 0 then
                v = 0
            elseif v > (1 << 31) then
                v = 0
            end
            tostring(math.floor(v))
        end
        return v
    end
end

local function com_value_select (objname)
    if objname == '生命值数值' then
        return com_value_mode_生命()
    else
        return com_value_mode_最小0()
    end
end

t['CardCom_SetAttr'] = function (attrA, objname, attrB)
    local color_iter = com_mode_select(objname)
    local value_iter = com_value_select(objname)

    return function (com, old_value)
        local value = com[attrA]
        if value then
            com[objname][attrB] = value_iter(value)
        else
            com[objname][attrB] = ''
        end
        if color_iter then
            color_iter(com, objname)
        end
    end
end

t['CardCom_SetAttr_hide'] = function (attrA, objname, attrB, hide_objname)
    local color_iter = com_mode_select(objname)
    local value_iter = com_value_select(objname)

    if objname then
        return function (com, old_value)
            local value = com[attrA]
            if value and (value > 0) then
                com[objname][attrB] = value_iter(value)
                com[hide_objname].visible = true
            else
                com[objname][attrB] = ''
                com[hide_objname].visible = false
            end
            if color_iter then
                color_iter(com, objname)
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

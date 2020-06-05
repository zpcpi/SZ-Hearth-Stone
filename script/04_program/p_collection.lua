--[[4013

]]
local G = require "gf"
local L = {}
local t = G.api

t['收藏_初始化收藏'] = function()
    G.call('收藏_初始化卡片收藏')
    G.call('系统_读取卡组列表')
    G.call('收藏_生成卡片DbfID映射表')
end

t['收藏_进入收藏界面'] = function()
end

t['收藏_退出收藏界面'] = function()
end

t['收藏_初始化卡片收藏'] = function()
    G['收藏卡片列表'] = {}

    local iter = function (_o_card_卡片列表)
        for _, o_card_卡片 in ipairs(_o_card_卡片列表) do 
            if o_card_卡片.局外数据 and o_card_卡片.局外数据.可收集 then 
                table.insert(G['收藏卡片列表'], o_card_卡片)
                if o_card_卡片.逻辑数据 ~= nil and o_card_卡片.逻辑数据.职业 then
                    for _, i_profession_职业 in ipairs(o_card_卡片.逻辑数据.职业) do 
                        G.call('收藏_记录职业卡片', o_card_卡片, i_profession_职业)
                    end
                end
            end
        end
    end

    iter(G.DBTable('o_card') or {})
    iter(G.DBTable('o_card_expert') or {})
    iter(G.DBTable('o_card_honours') or {})
    iter(G.DBTable('o_card_naxx') or {})
    iter(G.DBTable('o_card_gvg') or {})
    iter(G.DBTable('o_card_brm') or {})
    iter(G.DBTable('o_card_tgt') or {})

end

t['收藏_记录职业卡片'] = function(o_card_卡片, i_profession_职业ID)
    local o_profession_职业 = G.QueryName(i_profession_职业ID)
    if o_profession_职业 then 
        local string_键名称 = '收藏卡片列表' .. i_profession_职业ID
        G[string_键名称] = G[string_键名称] or {}
        table.insert(G[string_键名称], o_card_卡片)
        if o_profession_职业.子职业 ~= nil then 
            for _, i_profession_子职业ID in ipairs(o_profession_职业.子职业) do 
                G.call('收藏_记录职业卡片', o_card_卡片, i_profession_子职业ID)
            end
        end
    end
end

t['收藏_通过范围获取卡片列表'] = function(o_profession_职业, int_开始索引, int_卡片数量)
    if G['收藏卡片列表'] == nil then 
        return {}
    end
    local _o_card_卡片库 = G['收藏卡片列表']
    if o_profession_职业 ~= nil then 
        local i_profession_职业 = o_profession_职业.name
        local string_键名称 = '收藏卡片列表' .. i_profession_职业
        _o_card_卡片库 = G[string_键名称] or {}
    end
    local _o_card_卡片列表 = {}
    for i = int_开始索引, int_开始索引 + int_卡片数量 - 1 do 
        local o_card_卡片 = _o_card_卡片库[i]
        if o_card_卡片 == nil then 
            break
        else
            table.insert(_o_card_卡片列表, o_card_卡片)
        end
    end
    return _o_card_卡片列表
end

t['收藏_获取收藏卡片数量'] = function()
    if G['收藏卡片列表'] == nil then 
        return 0
    end
    return #G['收藏卡片列表']
end

t['收藏_获取卡组列表'] = function()
    -- TODO: 如果还没有初始化卡组列表, 则先初始化
    -- TODO: 获取卡组列表
end

t['收藏_新建卡组'] = function(_i_card_英雄列表, string_卡组名称)
    string_卡组名称 = string_卡组名称 or '新卡组'
    local o_deck_新卡组 = G.NewInst('o_deck')
    o_deck_新卡组.卡牌列表 = {}
    o_deck_新卡组.卡组名称 = string_卡组名称
    o_deck_新卡组.英雄 = {}
    for _, i_card_英雄 in ipairs(_i_card_英雄列表) do 
        table.insert(o_deck_新卡组.英雄, i_card_英雄)
    end
    return o_deck_新卡组
end

t['收藏_添加卡组卡片'] = function(o_deck_卡组, o_card_卡片, boolean_无视单卡上限, boolean_无视卡片总数量上限)
    if not (type(o_deck_卡组) == 'table' and type(o_card_卡片) == 'table') then 
        return
    end
    local int_卡片数量上限 = G.call('收藏_获取卡片数量上限')
    local int_卡片总数量上限 = G.call('收藏_获取卡片总数量上限')
    if boolean_无视单卡上限 == nil then 
        boolean_无视单卡上限 = false
    end
    if (not boolean_无视单卡上限) and G.call('收藏_获取卡片数量', o_deck_卡组, o_card_卡片) >= int_卡片数量上限 then 
        G.call('提示_添加提示', '卡牌数量已经达到上限 ' .. int_卡片数量上限)
        return
    end
    if (not boolean_无视卡片总数量上限) and G.call('收藏_获取卡片总数量', o_deck_卡组) >= int_卡片总数量上限 then 
        G.call('提示_添加提示', '卡牌总数量已经达到上限 ' .. int_卡片总数量上限)
        return
    end
    o_deck_卡组.卡牌列表 = o_deck_卡组.卡牌列表 or {}
    table.insert(o_deck_卡组.卡牌列表, o_card_卡片)
end

t['收藏_移除卡组卡片'] = function(o_deck_卡组, o_card_卡片)
    if not (type(o_deck_卡组) == 'table' and type(o_deck_卡组.卡牌列表) == 'table' and type(o_card_卡片) == 'table') then 
        return 
    end
    for i = #o_deck_卡组.卡牌列表, 1, -1 do 
        local o_card_卡组卡片 = o_deck_卡组.卡牌列表[i]
        if o_card_卡组卡片.name == o_card_卡片.name then 
            table.remove(o_deck_卡组.卡牌列表, i)
            break
        end
    end
end

t['收藏_获取卡片数量'] = function(o_deck_卡组, o_card_卡片)
    if not (type(o_deck_卡组) == 'table' and type(o_deck_卡组.卡牌列表) == 'table' and type(o_card_卡片) == 'table') then 
        return 0
    end
    local int_卡片数量 = 0
    for _, o_card_卡组卡片 in ipairs(o_deck_卡组.卡牌列表) do 
        if o_card_卡组卡片.name == o_card_卡片.name then 
            int_卡片数量 = int_卡片数量 + 1
        end
    end
    return int_卡片数量
end

t['收藏_获取卡片数量上限'] = function()
    -- TODO: 以后改为可以修改的配置
    return 2
end

t['收藏_获取卡片总数量上限'] = function()
    -- TODO: 通过配置读取
    return 30
end

t['收藏_获取卡片总数量下限'] = function()
    -- TODO: 通过配置读取
    return 30
end

t['收藏_获取卡片总数量'] = function(o_deck_卡组)
    if not (type(o_deck_卡组) == 'table' and type(o_deck_卡组.卡牌列表) == 'table') then 
        return 0
    end
    local int_卡片数量 = 0
    for _, o_card_卡组卡片 in ipairs(o_deck_卡组.卡牌列表) do 
        int_卡片数量 = int_卡片数量 + 1
    end
    return int_卡片数量
end

t['收藏_获取所有卡组'] = function()
    local _o_deck_卡组列表 = {}
    local _o_deck_静态卡组列表 = G.DBTable('o_deck')
    local _o_deck_动态卡组列表 = G.DBInst('o_deck')
    for _, o_deck_卡组 in pairs(_o_deck_静态卡组列表) do 
        table.insert(_o_deck_卡组列表, o_deck_卡组)
    end
    for _, o_deck_卡组 in pairs(_o_deck_动态卡组列表) do 
        table.insert(_o_deck_卡组列表, o_deck_卡组)
    end
    return _o_deck_卡组列表
end

t['收藏_卡组是否有效'] = function(o_deck_卡组)
    local int_卡片数量 = G.call('收藏_获取卡片总数量', o_deck_卡组)
    local int_卡片总数量上限 = G.call('收藏_获取卡片总数量上限', o_deck_卡组) 
    if int_卡片数量 == int_卡片总数量上限 then 
        return true
    end
    return false
end

t['收藏_获取卡组全称'] = function(o_deck_卡组)
    local string_卡组名称 = o_deck_卡组.卡组名称
    local string_职业名称 = ''
    local _i_profession_卡组职业 = G.call('收藏_获取卡组职业', o_deck_卡组, false)
    for _, i_profession_职业ID in ipairs(_i_profession_卡组职业) do 
        local o_profession_职业 = G.QueryName(i_profession_职业ID)
        if o_profession_职业 ~= nil then 
            if string_职业名称 ~= '' then 
                string_职业名称 = string_职业名称 .. ','
            end
            string_职业名称 = string_职业名称 .. o_profession_职业.showname
        end
    end
    
    return string_卡组名称 .. '(' .. string_职业名称 .. ')'
end

--ret=_i_profession
t['收藏_获取卡组职业'] = function(o_deck_卡组, boolean_包含中立)
    local any_profession_职业字典 = {}
    for _, i_card_英雄 in ipairs(o_deck_卡组.英雄) do 
        local o_card_英雄 = G.QueryName(i_card_英雄)
        if o_card_英雄 and o_card_英雄.逻辑数据 and o_card_英雄.逻辑数据.职业 then 
            for _, i_profession_职业 in ipairs(o_card_英雄.逻辑数据.职业) do 
                any_profession_职业字典[i_profession_职业] = true
            end
        end
    end
    local _i_profession_职业列表 = {}
    for i_profession_职业, _ in pairs(any_profession_职业字典) do 
        table.insert(_i_profession_职业列表, i_profession_职业)
    end
    if boolean_包含中立 then 
        local i_profession_中立 = 0x10080001
        table.insert(_i_profession_职业列表, i_profession_中立)
    end
    return _i_profession_职业列表
end

--ret=_o_card
t['收藏_获取所有英雄卡'] = function()
    local i_cardtype_英雄卡类型 = 0x10090001
    local _o_card_英雄卡列表 = {}
    local _o_card_卡片列表 = G.DBTable('o_card') or {}
    for _, o_card_卡片 in ipairs(_o_card_卡片列表) do
        if o_card_卡片.逻辑数据 ~= nil and o_card_卡片.逻辑数据.类型 == i_cardtype_英雄卡类型 then 
            table.insert(_o_card_英雄卡列表, o_card_卡片)
        end
    end
    return _o_card_英雄卡列表
end

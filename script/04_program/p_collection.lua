--[[4013

]]
local G = require "gf"
local L = {}
local t = G.api

t['收藏_进入收藏界面'] = function()
    G.call('收藏_初始化卡片收藏')
end

t['收藏_退出收藏界面'] = function()
end

t['收藏_初始化卡片收藏'] = function()
    G['收藏卡片列表'] = {}
    local _o_card_卡片列表 = G.DBTable('o_card') or {}
    for _, o_card_卡片 in ipairs(_o_card_卡片列表) do 
        if o_card_卡片.可收集 then 
            table.insert(G['收藏卡片列表'], o_card_卡片)
            if o_card_卡片.职业 ~= nil then 
                local string_键名称 = '收藏卡片列表' .. o_card_卡片.职业
                G[string_键名称] = G[string_键名称] or {}
                table.insert(G[string_键名称], o_card_卡片)
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

t['收藏_新建卡组'] = function(o_profession_职业, string_卡组名称)
    string_卡组名称 = string_卡组名称 or '新卡组'
    local o_deck_新卡组 = G.NewInst('o_deck')
    o_deck_新卡组.卡牌列表 = {}
    o_deck_新卡组.卡组名称 = string_卡组名称
    return o_deck_新卡组
end

t['收藏_添加卡组卡片'] = function(o_deck_卡组, o_card_卡片, boolean_无视上限)
    if not (type(o_deck_卡组) == 'table' and type(o_card_卡片) == 'table') then 
        return
    end
    local int_卡片数量上限 = G.call('收藏_获取卡片数量上限')
    if boolean_无视上限 == nil then 
        boolean_无视上限 = false
    end
    if (not boolean_无视上限) and G.call('收藏_获取卡片数量', o_deck_卡组, o_card_卡片) >= int_卡片数量上限 then 
        G.call('提示_添加提示', '卡牌数量已经达到上限 ' .. int_卡片数量上限)
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

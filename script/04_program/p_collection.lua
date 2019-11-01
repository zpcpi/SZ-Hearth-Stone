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
    -- TODO: 新建卡组
end

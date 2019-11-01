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
        end
    end
end

t['收藏_通过范围获取卡片列表'] = function(int_开始索引, int_卡片数量)
    if G['收藏卡片列表'] == nil then 
        return {}
    end
    local _o_card_卡片列表 = {}
    for i = int_开始索引, int_开始索引 + int_卡片数量 - 1 do 
        local o_card_卡片 = G['收藏卡片列表'][i]
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

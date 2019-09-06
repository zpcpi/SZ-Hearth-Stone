--[[400b

]]

local G = require "gf"
local L = {}
local t = G.api

t['提示_初始化'] = function()
    G.addListener('提示_播放下一条', 'TipEnd')
end

t['提示_添加提示'] = function(string_提示内容)
    if not G.cacheData.isPlayTip then 
        G.cacheData.tipsList = {}
    end
    table.insert(G.cacheData.tipsList, string_提示内容)
    if not G.cacheData.isPlayTip then 
        G.cacheData.isPlayTip = true
        G.call('提示_播放下一条')
    end
end

t['提示_播放下一条'] = function(string_提示内容)
    local tipList = G.cacheData.tipsList
    if not (type(tipList) == 'table' and #tipList > 0) then 
        G.cacheData.isPlayTip = false
        return 
    end
    local tipContent = table.remove(tipList, 1)
    G.call('提示_播放提示', tipContent)
end

t['提示_播放提示'] = function(string_提示内容)
end
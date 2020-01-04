--[[400a

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")
local js = require "cjson.c"

t['系统_输出信息'] = function(string_信息)
end

t['系统_初始化玩家信息'] = function()
    local o_misc = G.misc()
    if o_misc.玩家信息 == nil then 
        o_misc.玩家信息 = {}
    end
    o_misc.玩家信息.玩家IP = G.call('网络通用_获取本机IP地址')
end

t['系统_设置玩家名称'] = function(string_名称)
    local any_当前玩家 = G.call('系统_获取当前玩家信息')
    any_当前玩家.玩家名称 = string_名称
end

t['系统_获取table长度'] = function(any_table)
    if type(any_table) ~= 'table' then 
        return 0
    end

    local maxSize = 0
    for k, v in pairs(any_table) do 
        if type(k) == 'number' and k > maxSize then 
            maxSize = k
        end
    end
    return maxSize
end

t['系统_获取当前玩家信息'] = function()
    return G.misc().玩家信息 or {}
end

t['系统_更新当前玩家信息'] = function(o_room_player_玩家信息)
    G.misc().玩家信息 = o_room_player_玩家信息
end

t['系统_重试等待'] = function(string_提示内容, int_秒数)
    for i = 1, int_秒数 do 
        G.call('提示_添加提示', (string_提示内容 or '') .. (int_秒数 - i + 1) .. ' 秒后重试')
        G.wait_time(1000)
    end
end

t['系统_保存数据'] = function()
    G.call('系统_保存卡组数据')
end

t['系统_保存卡组数据'] = function()
    local _o_deck_卡组列表 = G.call('收藏_获取所有卡组')
    for i = 1, #_o_deck_卡组列表 do 
        local o_deck_卡组 = {}
        o_deck_卡组.卡组名称 = _o_deck_卡组列表[i].卡组名称
        o_deck_卡组.卡牌列表 = {}
        for _, o_card_卡片 in ipairs(_o_deck_卡组列表[i].卡牌列表) do 
            table.insert(o_deck_卡组.卡牌列表, o_card_卡片.name)
        end
        o_deck_卡组.英雄 = _o_deck_卡组列表[i].英雄
        _o_deck_卡组列表[i] = o_deck_卡组
    end
    local buf = js.encode(_o_deck_卡组列表)
    local path = G.GetSavePath('Deck')
    G.WriteFile(path, buf)
end

t['系统_读取卡组列表'] = function()
    local path = G.GetSavePath('Deck')
    local buf = G.LoadFile(path)
    if not buf then 
        return
    end
    if not pcall(js.decode, buf) then 
        G.call('提示_添加提示', '读取卡组信息错误')
        return
    end
    local _o_deck_卡组列表 = js.decode(buf)
    if not _o_deck_卡组列表 then
        G.call('提示_添加提示', '卡组信息为空')
        return
    end
    for _, o_deck_档案卡组 in ipairs(_o_deck_卡组列表) do 
        local o_deck_卡组 = G.NewInst('o_deck')
        o_deck_卡组.卡组名称 = o_deck_档案卡组.卡组名称
        o_deck_卡组.英雄 = o_deck_档案卡组.英雄
        o_deck_卡组.卡牌列表 = {}
        for _, i_card_卡片ID in ipairs(o_deck_档案卡组.卡牌列表) do 
            table.insert(o_deck_卡组.卡牌列表, G.QueryName(i_card_卡片ID))
        end
    end
end

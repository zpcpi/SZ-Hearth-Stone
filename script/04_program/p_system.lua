--[[400a

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")

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
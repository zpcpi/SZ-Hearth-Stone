--[[4007

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")
local json = require 'cjson.c'

t['网络通用_发送消息'] = function(target, ...)
    local msg = {...}
    msg.size = G.call('系统_获取table长度', msg)
    local buffer = json.encode(msg)
    buffer = buffer .. string.char(10)
    local ret = target:send(buffer)
end

t['网络通用_广播消息'] = function(...)
    if type(G.connectList) ~= 'table' then 
        return 
    end

    local msg = {...}
    msg.size = G.call('系统_获取table长度', msg)
    local buffer = json.encode(msg)
    buffer = buffer .. string.char(10)

    for _, connect in ipairs(G.connectList) do 
        connect:send(buffer)
    end
end

t['网络通用_处理消息'] = function(buffer)
    if not pcall(json.decode, buffer) then 
        return 
    end
    local paramsList = json.decode(buffer)
    if type(paramsList) ~= 'table' then 
        return 
    end
    local size = paramsList.size
    for i = 1, size do 
        table.insert(paramsList, paramsList[tostring(i)])
    end
    G.call(table.unpack(paramsList, 1, size))
end

t['网络通用_获取本机IP地址'] = function()
    local hostname = lsocket.dns.gethostname()
    return lsocket.dns.toip(hostname)
end

t['Net_SendMsg'] = function(msg)
    msg = tostring(msg) .. '\n'
    if G.clientList and #G.clientList > 0 then 
        for _, client in ipairs(G.clientList) do 
            client:send(msg)
        end
        return 
    end
    if G.tcpSocket then 
        G.tcpSocket:send(msg)
    end
end

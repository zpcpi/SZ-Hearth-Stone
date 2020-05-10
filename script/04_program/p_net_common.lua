--[[4007

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")
local json = require 'cjson.c'

t['网络通用_发送消息'] = function(target, ...)
    if target == nil then 
        error('消息对象为空')
        return
    end
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
    for _, connect in ipairs(G.connectList) do 
        G.call('网络通用_发送消息', connect, ...)
    end
end

t['网络通用_处理消息'] = function(socketTarget, buffer)
    G.canBroadcast = false
    if not pcall(json.decode, buffer) then 
        G.canBroadcast = true
        return 
    end
    local paramsList = json.decode(buffer)
    if type(paramsList) ~= 'table' then 
        G.canBroadcast = true
        return 
    end
    local size = paramsList.size
    for i = 1, size do 
        table.insert(paramsList, paramsList[tostring(i)])
    end
    local funcName = paramsList[1]
    G.call(funcName, table.unpack(paramsList, 2, size), socketTarget)
    G.canBroadcast = true
end

t['网络通用_获取本机IP地址'] = function()
    local hostname = lsocket.dns.gethostname()
    return lsocket.dns.toip(hostname)
end

t['网络通用_获取主机端口'] = function()
    return tostring(G.netPort)
end

t['网络通用_能否广播'] = function()
    -- 只有主机可以广播消息, 其他客机只能通知主机
    return G.call('主机_是主机')
end

t['Net_SendMsg'] = function(msg)
    msg = tostring(msg) .. '\n'
    if G.clientList and #G.clientList > 0 then 
        for _, client in ipairs(G.clientList) do 
            client:send(msg)
        end
        return 
    end
    if G.tcpServerSocket then 
        G.tcpServerSocket:send(msg)
    elseif G.tcpClientSocket then 
        G.tcpClientSocket:send(msg)
    end
end

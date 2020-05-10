--[[4007

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")

--hide=true
t['客机_连接主机'] = function(string_hostip)
    local any_玩家信息 = G.call('系统_获取当前玩家信息')
    any_玩家信息.是主机 = false

    if not string.find(string_hostip, ':') then 
        G.netPort = tonumber(DEFAULT_NET_PORT)
    else
        local pos = string.find(string_hostip, ':')
        local portStr = string.sub(string_hostip, pos + 1)
        string_hostip = string.sub(string_hostip, 1, pos - 1)
        G.netPort = tonumber(portStr)
    end
    G.call('客机_输出连接信息', '正在连接中...\n' .. string.format('%s:%s', tostring(string_hostip), tostring(G.netPort)))
    if G.tcpClientSocket then 
        G.tcpClientSocket:close()
    end
    G.tcpClientSocket = lsocket.tcp()
    local hostSocket, err = G.tcpClientSocket:connect(string_hostip, G.netPort)
    if not hostSocket then
        G.call('客机_输出连接信息', '连接失败!\n' .. string.format('%s:%s\n', tostring(string_hostip), tostring(G.netPort)) .. err)
        return
    end
    G.connectList = {G.tcpClientSocket}
    G.tcpClientSocket:settimeout(4)
    G.call('客机_输出连接信息', '连接成功!正在建立监听...')
    G.call('客机_连接成功回调')
end

--hide=true
t['客机_连接成功回调'] = function()
    G.socketList = {G.tcpClientSocket}
    G.hostSocket = G.tcpClientSocket
    G.call('客机_申请加入房间')
end

--hide=true
t['客机_申请加入房间'] = function()
    local o_room_player_当前玩家 = G.call('系统_获取当前玩家信息')
    o_room_player_当前玩家.是主机 = false
    G.call('客机_向主机发送消息', '主机处理回调_申请加入房间', o_room_player_当前玩家)
end

--hide=true
t['客机_输出连接信息'] = function(string_信息)
end

--hide=true
t['客机_向主机发送消息'] = function(...)
    G.call('网络通用_发送消息', G.hostSocket, ...)
end

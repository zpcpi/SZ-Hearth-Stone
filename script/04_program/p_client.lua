--[[4007

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")

--hide=true
t['客机_连接主机'] = function(string_hostip)
    local any_玩家信息 = G.call('系统_获取玩家信息', '我方')
    any_玩家信息.是主机 = false

    local netPort = tonumber(DEFAULT_NET_PORT)
    G.call('客机_输出连接信息', '正在连接中...')
    if G.tcpClientSocket then 
        G.tcpClientSocket:close()
    end
    G.tcpClientSocket = lsocket.tcp()
    local hostSocket, err = G.tcpClientSocket:connect(string_hostip, netPort)
    if not hostSocket then
        G.call('客机_输出连接信息', '连接失败!' .. err)
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
    G.call('对决_增加对决玩家信息', G.misc().玩家信息, false)
    G.call('网络通用_发送消息', G.tcpClientSocket, '对决_增加对决玩家信息', G.misc().玩家信息, false)
end

--hide=true
t['客机_输出连接信息'] = function(string_信息)
end

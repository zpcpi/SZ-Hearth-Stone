--[[4002

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")

--hide=true
t['主机_新建房间'] = function()
    local any_玩家信息 = G.misc().玩家信息
    any_玩家信息.是主机 = true
    G.start_program('主机_建立连接')
end

--hide=true
t['主机_断开连接'] = function()
    G.call('对决_清空对决玩家信息')
    G.tcpServerSocket:close()
end

--hide=true
t['主机_建立连接'] = function()
    local netPort = tonumber(DEFAULT_NET_PORT)
    G.tcpServerSocket = lsocket.tcp()
    G.tcpServerSocket:settimeout(0)
    local ret, err = G.tcpServerSocket:bind('127.0.0.1', netPort)
    if not ret then
        G.call('系统_输出信息', '房间建立失败!' .. tostring(err))
        return
    end
    G.call('系统_输出信息', '房间建立成功， 正在开启监听!')
    local ret, err = G.tcpServerSocket:listen(1)
    if(ret and ret == 1) then
        G.call('系统_输出信息', '监听开启成功， 等待玩家加入!')
        G.call('主机_连接建立成功回调')
    else 
        G.call('系统_输出信息', '监听开启失败!' .. err)
        return
    end
end

--hide=true
t['主机_连接建立成功回调'] = function()
    G.socketList = {G.tcpServerSocket}
    G.connectList = {}
    G.misc().玩家信息.身份标识 = '玩家1'
    G.call('对决_增加对决玩家信息', G.misc().玩家信息, true)
end

--hide=true
t['主机_是主机'] = function()
    local any_玩家信息 = G.misc().玩家信息
    return any_玩家信息.是主机
end

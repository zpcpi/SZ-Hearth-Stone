--[[4007

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")

--hide=true
t['客机_连接主机'] = function(string_hostip)
    local netPort = tonumber(DEFAULT_NET_PORT)
    G.call('客机_输出连接信息', '正在连接中...')
    if G.tcpSocket then 
        G.tcpSocket:close()
    end
    G.tcpSocket = lsocket.tcp()
    local hostSocket, err = G.tcpSocket:connect(string_hostip, netPort)
    if not hostSocket then
        G.call('客机_输出连接信息', '连接失败!' .. err)
        return
    end
    G.tcpSocket:settimeout(4)
    G.call('客机_输出连接信息', '连接成功!正在建立监听...')
    G.call('客机_连接成功回调')
    G.start_program('客机_建立监听')
end

--hide=true
t['客机_连接成功回调'] = function()
    G.call('对决_增加对决玩家信息', G.misc().玩家信息, false)
    G.call('网络通用_发送消息', G.tcpSocket, '对决_增加对决玩家信息', G.misc().玩家信息, false)
end

--hide=true
t['客机_输出连接信息'] = function(string_信息)
end

--hide=true
t['客机_建立监听'] = function()
    local socketList = {G.tcpSocket}

    while true do 
        local readySocketList = lsocket.select(socketList, {}, 0.1)
        for _, socket in ipairs(socketList) do 
            local rev, err = socket:receive('*l')
            if rev == nil and err == nil then 
                socket:close()
                G.call('系统_输出信息', '与主机连接断开!')
                return
            elseif err == 'closed' then 
                socket:close()
                G.call('系统_输出信息', '与主机连接断开!')
                return
            else
                G.call('网络通用_处理消息', rev)
            end
        end
        G.wait_time(100)
    end
end
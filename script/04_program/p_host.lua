--[[4002

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")

--hide=true
t['主机_新建房间'] = function()
    G.start_program('主机_建立连接')
end

--hide=true
t['主机_连接建立成功回调'] = function()
    G.call('对决_增加对决玩家信息', G.misc().玩家信息, true)
end

--hide=true
t['主机_断开连接'] = function()
    G.tcpSocket:close()
end

--hide=true
t['主机_建立连接'] = function()
    local netPort = tonumber(DEFAULT_NET_PORT)
    G.tcpSocket = lsocket.tcp()
    local ret, err = G.tcpSocket:bind('127.0.0.1', netPort)
    if not ret then
        G.call('系统_输出信息', '房间建立失败!' .. tostring(err))
        return
    end
    G.call('系统_输出信息', '房间建立成功， 正在开启监听!')
    local ret, err = G.tcpSocket:listen(1)
    if(ret and ret == 1) then
        G.call('系统_输出信息', '监听开启成功， 等待玩家加入!')
    else 
        G.call('系统_输出信息', '监听开启失败!' .. err)
    end
    G.start_program('主机_监听玩家加入')
end

--hide=true
t['主机_监听玩家加入'] = function()
    local socketList = {G.tcpSocket}

    while true do 
        local readySocketList = lsocket.select(socketList, {}, 0.1)
        for i = #readySocketList, 1, -1 do 
            local socket = readySocketList[i]
            if socket == G.tcpSocket then 
                local client, err = socket:accept()
                G.call('系统_输出信息', '新玩家连接成功!')
                table.insert(socketList, client)
            -- else
            --     local rev, err = socket:receive('*l')
            --     print('--== rev, err', rev, err)
            --     if rev == nil and err == nil then 
            --         socket:close()
            --         for i = #socketList, 1, -1 do 
            --             if socketList[i] == socket then 
            --                 table.remove(socketList, i)
            --             end
            --         end
            --         print('--== Client disconnect!')
            --     end
            end
        end
        G.wait_time(100)
    end
end

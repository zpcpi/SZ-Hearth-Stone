--[[4002

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")
G.tcpSocket = lsocket.tcp()

--hide=true
t['Net_CreateHost'] = function(int_port)
    int_port = tonumber(int_port)
    local ret, err = G.tcpSocket:bind('127.0.0.1', int_port)
    if not ret then
        print('--== Host Failed!', ret, err, '127.0.0.1', int_port)
        return
    end
    print('--== Host Success!')
    local ret, err = G.tcpSocket:listen(1)
    if(ret and ret == 1) then
        print('--== Host listen ok')
    else 
        print('--== Host listen error', err)
    end
    G.start_program('Net_ListenClient')
end

--hide=true
t['Net_ListenClient'] = function()
    print('--== G.tcpSocket:getsockname()', G.tcpSocket:getsockname())
    local socketList = {G.tcpSocket}
    G.clientList = {}

    while true do 
        local readySocketList = lsocket.select(socketList, {}, 0.1)
        for i = #readySocketList, 1, -1 do 
            local socket = readySocketList[i]
            if socket == G.tcpSocket then 
                local client, err = socket:accept()
                print('--== Client connect!', client)
                table.insert(G.clientList, client)
                table.insert(socketList, client)
            else
                local rev, err = socket:receive('*l')
                print('--== rev, err', rev, err)
                if rev == nil and err == nil then 
                    socket:close()
                    for i = #socketList, 1, -1 do 
                        if socketList[i] == socket then 
                            table.remove(socketList, i)
                        end
                    end
                    for i = #G.clientList, 1, -1 do 
                        if G.clientList[i] == socket then 
                            table.remove(G.clientList, i)
                        end
                    end
                    print('--== Client disconnect!')
                end
            end
        end
        G.wait_time(100)
    end
end

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
    local client, err = G.tcpSocket:connect(string_hostip, netPort)
    if not client then
        G.call('客机_输出连接信息', '连接失败!' .. err)
        return
    end
    G.call('客机_输出连接信息', '连接成功!正在建立监听...')
    -- G.start_program('Net_ListenHost', client)
end

--hide=true
t['客机_输出连接信息'] = function(string_信息)
end

--hide=true
t['客机_尝试建立连接'] = function(string_hostip)
    
end

--hide=true
t['Net_ListenHost'] = function()
    local socketList = {G.tcpSocket}

    while true do 
        local readySocketList = lsocket.select(socketList, {}, 0.1)
        for i = #readySocketList, 1, -1 do 
            local socket = readySocketList[i]
            local rev, err = socket:receive('*l')
            print('--== rev, err', rev, err)
            if rev == nil and err == nil then 
                socket:close()
                print('--== Host disconnect!')
                return
            elseif err == 'closed' then 
                socket:close()
                print('--== Host disconnect!')
                return
            end
        end
        G.wait_time(100)
    end
end
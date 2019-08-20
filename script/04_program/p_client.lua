--[[4007

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
t['Net_TryConnectHost'] = function(string_url, int_port)
    int_port = tonumber(int_port)
    print('--== Connecting......', string_url, int_port)
    local client, err = G.tcpSocket:connect(string_url, int_port)
    if not client then
        print('--== Connect Failed!', string_url, int_port)
        return
    end
    print('--== Connect Success!', string_url, int_port)
    G.start_program('Net_ListenHost', client)
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
--[[4002

]]
local G = require "gf"
local L = {}
local t = G.api
G.lsocket = require("socket.core").tcp()

--hide=true
t['Net_TryConnectHost'] = function(string_url, int_port)
    int_port = tonumber(int_port)
    print('--== Connecting......', string_url, int_port)
    local client, err = G.lsocket:connect(string_url, int_port)
    if not client then
        print('--== Connect Failed!', string_url, int_port)
        return
    end
    print('--== Connect Success!', string_url, int_port)
    G.start_program('Net_ListenHost', client)
end

--hide=true
t['Net_CreateListener'] = function(int_port)
    int_port = tonumber(int_port)
    local ret, err = G.lsocket:bind('127.0.0.1', int_port)
    if not ret then
        print('--== Host Failed!', ret, err, '127.0.0.1', int_port)
        return
    end
    print('--== Host Success!')
    local ret, err = G.lsocket:listen(50)
    if(ret and ret == 1) then
        print('--== Host listen ok')
    else 
        print('--== Host listen error', err)
    end
    G.start_program('Net_ListenClient')
end

--hide=true
t['Net_ListenClient'] = function()
    local client_tab = {}
    local conn_count = 0
    while 1 do
        local client = G.lsocket:accept()
        if client then
            conn_count = conn_count + 1
            client_tab[conn_count] = client
            print("A client successfully connect!", client) 

            local rev = client:receive(16)
            print('--== rev', rev)
        end
        G.wait_time(100)
    end
end

--hide=true
t['Net_ListenHost'] = function()
    while 1 do
        local rev = G.lsocket:receive(16)
        print('--== rev', rev)
        G.wait_time(100)
    end
end
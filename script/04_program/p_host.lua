--[[4002

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")

--hide=true
t['主机_新建房间'] = function()
    local any_玩家信息 = G.call('系统_获取当前玩家信息')
    any_玩家信息.是主机 = true
    if G.IsSteamAvaliable() then 
        G.Steam_CreateLobby()
    else
        G.start_program('主机_建立连接')
    end
end

--hide=true
t['主机_建立连接'] = function()
    G.tcpServerSocket = lsocket.tcp()
    G.tcpServerSocket:settimeout(0)
    G.netPort = tonumber(DEFAULT_NET_PORT)
    local string_本机IP地址 = G.call('网络通用_获取本机IP地址')
    while not G.tcpServerSocket:bind(string_本机IP地址, G.netPort) do 
        if G.netPort > 9999 then 
            G.call('房间_退出房间')
            G.call('提示_添加提示', '无法建立房间, 请检查端口占用情况')
            return 
        end
        G.netPort = G.netPort + 1
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
    local any_当前玩家 = G.call('系统_获取当前玩家信息')
    any_当前玩家.是主机 = true
    G.call('房间_更新玩家信息', any_当前玩家)
    G.call('对决_设置游戏模式', 0x10150001)
    G.noti_call('主机_连接建立成功回调')
end

--hide=true
t['主机_是主机'] = function()
    local boolean_是主机 = false
    if G.IsSteamAvaliable() then
        boolean_是主机 = G.Steam_IsLocalUserLobbyOwner()
    else
        local any_玩家信息 = G.call('系统_获取当前玩家信息')
        boolean_是主机 = any_玩家信息.是主机
    end
    print('[主机_是主机]', boolean_是主机)
    return boolean_是主机
end

local GF = require('gfbase')
local lsocket = require("socket.core")

table.insert(GF.update, function(t, k)
	GF.NetReceive()
end)

function GF.NetReceive()
    if GF.tcpServerSocket then 
        local readySocketList = lsocket.select(GF.socketList, {}, 0)
        for i = #readySocketList, 1, -1 do 
            local socket = readySocketList[i]
            if socket == GF.tcpServerSocket then 
                local client, err = socket:accept()
                GF.call('系统_输出信息', '新玩家连接成功!')
                table.insert(GF.socketList, client)
                table.insert(GF.connectList, client)
                local any_当前玩家 = GF.call('系统_获取当前玩家信息')
                GF.call('网络通用_发送消息', client, '房间_更新玩家信息', any_当前玩家)
                GF.call('网络通用_发送消息', client, '房间_更新房间信息', GF.misc().对决类型)
            else
                local rev, err = socket:receive('*l')
                if rev == nil and err == nil then 
                    socket:close()
                    for i = #GF.socketList, 1, -1 do 
                        if GF.socketList[i] == socket then 
                            table.remove(GF.socketList, i)
                        end
                    end
                    for i = #GF.connectList, 1, -1 do 
                        if GF.connectList[i] == socket then 
                            table.remove(GF.connectList, i)
                        end
                    end
                    GF.call('系统_输出信息', '玩家离开房间!')
                else
                    GF.call('网络通用_处理消息', rev)
                end
            end
        end
    end
    if GF.tcpClientSocket then 
        local readySocketList = lsocket.select(GF.socketList, nil, 0)
        for _, socket in ipairs(readySocketList) do 
            local rev, err = socket:receive()
            if (rev == nil and err == nil) or (err == 'closed') then 
                GF.call('房间_退出房间')
                GF.call('提示_添加提示', '与主机连接断开!')
                return
            else
                GF.call('网络通用_处理消息', rev)
            end
        end
    end
end
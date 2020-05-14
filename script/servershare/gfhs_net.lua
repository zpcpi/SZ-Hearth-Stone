local GF = require('gfbase')
local lsocket = require("socket.core")
local json = require 'cjson.c'

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
                GF.call('系统_输出信息', '有新的玩家尝试连入!')
                table.insert(GF.socketList, client)
                table.insert(GF.connectList, client)
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
                    GF.call('网络通用_处理消息', socket, rev)
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
                GF.call('网络通用_处理消息', socket, rev)
            end
        end
    end
end

function GF.DecodeJson(buffer)
    local data = json.decode(buffer)
    GF.FormatJsonTable(data)
    return data
end

function GF.FormatJsonTable(jsonTable)
    if type(jsonTable) ~= 'table' then 
        return
    end
    local deleteKeyList = {}
    for k, v in pairs(jsonTable) do
        if type(k) == 'string' and tonumber(k) ~= nil then
            jsonTable[tonumber(k)] = v
            table.insert(deleteKeyList, k)
        end
        if type(v) == 'table' then 
            GF.FormatJsonTable(v)
        end
    end
    for _, k in ipairs(deleteKeyList) do 
        jsonTable[k] = nil
    end
end
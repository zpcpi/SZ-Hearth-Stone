local G = require "gf"
local noti = G.notify

function noti.init()
end

function noti.初始化()
    G.addUI('v_main_menu')
end

function noti.主机_新建房间()
    G.addUI('v_room')
    G.removeUI('v_main_menu')
end

function noti.主机_断开连接()
    G.addUI('v_main_menu')
    G.removeUI('v_room')
end

function noti.系统_输出信息(string_信息)
    local v_room = G.getUI('v_room')
    if v_room then 
        v_room.c_room:AddInfo(string_信息)
    end
end

function noti.对决_增加对决玩家信息(o_battle_player_对决玩家, boolean_是主机)
    local playerName = o_battle_player_对决玩家.玩家名称
    if boolean_是主机 then 
        G.call('系统_输出信息', string.format('[02]%s[ff] 成为了房主', playerName))
    else
        G.call('系统_输出信息', string.format('[02]%s[ff] 进入了房间', playerName))
    end

    local v_room = G.getUI('v_room')
    if v_room then 
        v_room.c_room:UpdateRoomMember()
    end
end

function noti.客机_连接主机()
end

function noti.客机_输出连接信息(string_信息)
    local v_connect = G.getUI('v_connect')
    if v_connect then 
        v_connect.c_connect:ShowInfo(string_信息)
    end
end

function noti.客机_连接成功回调()
    G.addUI('v_room')    
    G.removeUI('v_main_menu')
    G.removeUI('v_connect')
end

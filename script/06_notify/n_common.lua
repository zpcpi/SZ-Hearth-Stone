local G = require "gf"
local noti = G.notify

function noti.init()
end

function noti.初始化()
    G.addUI('v_main_menu')
end

function noti.房间_退出房间()
    G.changeUI('v_main_menu')
end

function noti.系统_输出信息(string_信息)
    local v_room = G.getUI('v_room')
    if v_room then 
        v_room.c_room:AddInfo(string_信息)
    end
end

function noti.主机_连接建立成功回调()
    local v_room = G.changeUI('v_room')
    if v_room then 
        v_room.c_room:UpdateRoom()
    end
end

function noti.房间_更新玩家信息(o_room_player_对决玩家)
    local playerName = o_room_player_对决玩家.玩家名称
    if o_room_player_对决玩家.是主机 then 
        G.call('系统_输出信息', string.format('[02]%s[ff] 成为了房主', playerName))
    end

    local v_room = G.getUI('v_room')
    if v_room then 
        v_room.c_room:UpdateRoom()
    end
end

function noti.房间_清空玩家列表()
    local v_room = G.getUI('v_room')
    if v_room then 
        v_room.c_room:UpdateRoom()
    end
end

function noti.房间_删除玩家信息()
    local v_room = G.getUI('v_room')
    if v_room then 
        v_room.c_room:UpdateRoom()
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

function noti.客机_加入房间成功回调()
    local o_node_room = G.changeUI('v_room')    
    o_node_room.c_room:UpdateGameModeInfo()
    o_node_room.c_room:UpdateRoom()
end

function noti.客机处理回调_加入房间回调(boolean_结果)
    if boolean_结果 then 
        local o_node_room = G.changeUI('v_room')    
        o_node_room.c_room:UpdateGameModeInfo()
        o_node_room.c_room:UpdateRoom()
    end
end

function noti.提示_播放提示(string_提示内容)
    local o_node_提示 = G.addUI('v_tip')
    o_node_提示.c_tip:setData(string_提示内容)
    o_node_提示.alpha = 0
    G.RunAction('提示动画_显示提示', o_node_提示)
end

function noti.收藏_进入收藏界面()
    G.changeUI('v_collection')
    local o_node_界面 = G.getUI('v_collection')
    if o_node_界面 and o_node_界面.c_collection then 
        o_node_界面.c_collection:UpdateProfessionMark()
        o_node_界面.c_collection:UpdateDeckInfo()
    end
end

function noti.收藏_退出收藏界面()
    G.changeUI('v_main_menu')
end

function noti.收藏_新建卡组()
    local o_node_界面 = G.getUI('v_collection')
    if o_node_界面 and o_node_界面.c_collection then 
        o_node_界面.c_collection:UpdateDeckInfo()
    end
end

function noti.收藏_添加卡组卡片()
    local o_node_界面 = G.getUI('v_collection')
    if o_node_界面 and o_node_界面.c_collection then 
        o_node_界面.c_collection:UpdateDeckInfo()
    end
end

function noti.收藏_移除卡组卡片()
    local o_node_界面 = G.getUI('v_collection')
    if o_node_界面 and o_node_界面.c_collection then 
        o_node_界面.c_collection:UpdateDeckInfo()
    end
end

function noti.房间_刷新房间列表回调(lobbyCount)
    local o_node_界面 = G.getUI('v_room_list')
    if not o_node_界面 then 
        return 
    end
    o_node_界面.c_room_list:UpdateRoomList(lobbyCount)
end
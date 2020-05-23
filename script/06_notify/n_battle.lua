local G = require "gf"
local noti = G.notify

function noti.对决_初始化1v1战场()
    G.addUI('v_battle_1v1')
    G.noti_call('作弊系统_初始化作弊系统ui')
    G.removeUI('v_room')
end

function noti.对决_初始化2v2战场()
    -- TODO: 2v2 游戏模式初始化
end

function noti.对决_设置预设对决卡组()
    local v_room = G.getUI('v_room')
    if v_room then 
        v_room.c_room:UpdateDeckInfo()
    end
end

function noti.对决_设置游戏模式()
    local v_room = G.getUI('v_room')
    if v_room then 
        v_room.c_room:UpdateGameModeInfo()
    end
end

function noti.对决_设置对决结果(estr_absolute_id_type_绝对身份, boolean_是否胜利)
    -- TODO: 显示所有玩家的对决结果, 现在只显示自己的
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)
    if not G.call('房间_是否同一阵营_相对身份', estr_player_相对身份, '我方') then 
        boolean_是否胜利 = not boolean_是否胜利
    end
    G.noti_call('对决界面_显示结算界面', boolean_是否胜利)
end

function noti.对决界面_显示结算界面(boolean_是否胜利)
    local o_node_结算界面 = G.addUI('v_battle_result')
    if o_node_结算界面 and o_node_结算界面.c_battle_result then 
        o_node_结算界面.c_battle_result:setData(boolean_是否胜利)
    end
end